function mergeDiv2H(clip c, clip c1)
{
    mask = BlankClip(length = c.frameCount, width = c.width, height = c.height, pixel_type="YV12")
    mask = mask.mt_lutspa(mode="relative", expr="y 255 *", chroma="-128")
    return c.mt_merge(c1, mask, luma = true)
}

function mergeDiv2(clip c, clip c1, int x, int full_w)
{
    mask = BlankClip(length = c.frameCount, width = c.width, height = c.height, pixel_type="YV12")
    mask = mask.mt_lutspa(mode="relative", expr="x 255 *", chroma="-128")
    return c.mt_merge(c1, mask, luma = true)
}

function deFlickOverlappedH(clip c, int "height", int "step", int "radius", float "noise", float "noise_u", float "noise_v", bool "toward_darkest", bool "right2left", bool "left_column")
{
    height = default(height, c.height)
    step = default(step, 100)
    noise = default(noise, 0)
    noise_u = default(noise_u, 0)
    noise_v = default(noise_v, noise_u)
    right2left = default(right2left, false)

    height = height <= 0 || height > c.height ? c.height : height
    step = step <= 0 ? 100 : step

    result = blankClip
    last_c = (height + step - 1)/step - 1

    first_c = 0

    for (i = first_c, last_c)
    {
        top = step*i
        sh = step*2
        if (top + sh > height)
        {
            sh = height - top
        }
     
        str = c.crop(0, top, 0, sh)
        if (!right2left || !left_column)
        {
            str = str.deFlicker(scene = 255, lag = radius, noise = noise, noise_u = noise_u, noise_v = noise_v, toward_darkest = toward_darkest, right2left = false)#, info = true)
        }
        else
        {
            str0 = str.deFlicker(scene = 255, lag = radius, noise = noise, noise_u = noise_u, noise_v = noise_v, toward_darkest = toward_darkest, right2left = true)#, info = true)
            str1 = str.deFlicker(scene = 255, lag = radius, noise = noise, noise_u = noise_u, noise_v = noise_v, toward_darkest = toward_darkest, right2left = false)
            str = str0.mergeDiv2(str1, 0, str.width)
        }
#return str
        if (i == first_c)
        {
            result = str
        }
        else
        {
            if (sh <= step)
            {
                rl = result.crop(0, 0, 0, result.height - sh)
                rr = result.crop(0, result.height - sh, 0, 0)
       
                result = rl.stackVertical(rr.mergeDiv2H(str))
            }
            else
            { 
                rl = result.crop(0, 0, 0, result.height - step)
                rr = result.crop(0, result.height - step, 0, 0)
       
                sl = str.crop(0, 0, 0, step)
                sr = str.crop(0, step, 0, 0)
                result = rl.stackVertical(rr.mergeDiv2H(sl)).stackVertical(sr)
            }
        }
    }
    if (result.height == c.height || result.height <= step)
    {
        return result
    }
    else
    {
        rl = result.crop(0, 0, 0, result.height - step)
        rr = result.crop(0, result.height - step, 0, 0)

        if (c.height - result.height <= step)
        {
            cl = c.crop(0, result.height - step, 0, c.height - result.height)
            result = rl.stackVertical(rr.mergeDiv2H(cl))
        }
        else
        {
            cl = c.crop(0, result.height - step, 0, step)
            cr = c.crop(0, result.height, 0, 0)
#return c.crop(rr.height,0,0,0).addBorders(200,0,0,0)
            result = rl.stackVertical(rr.mergeDiv2H(cl)).stackVertical(cr)
        }
    }
    return result
}

function deFlickOverlapped(clip c, int "width", int "step", float "noise", float "noise_u", float "noise_v", int "height", int "step_h", int "radius", bool "toward_darkest", bool "right2left")
{
    width = default(width, c.width)
    step = default(step, 100)
    step_h = default(step_h, step)

    width = width <= 0 || width > c.width ? c.width : width
    step = step <= 0 ? 100 : step

    result = blankClip
    last_c = (width + step - 1)/step - 1

    for (i = 0, last_c)
    {
        left = step*i
        sw = step*2
        if (left + sw > width)
        {
            sw = width - left
        }
     
        str = c.crop(left, 0, sw, 0).deFlickOverlappedH(step = step_h, height = height, noise = noise, noise_u = noise_u, noise_v = noise_v, radius = radius, toward_darkest = toward_darkest, right2left = right2left, left_column = (i == 0))
#return str
        if (i == 0)
        {
            result = str
        }
        else
        {
            if (sw <= step)
            {
                rl = result.crop(0, 0, result.width - sw, 0)
                rr = result.crop(result.width - sw, 0, 0, 0)
       
                result = rl.stackHorizontal(rr.mergeDiv2(str, 0, sw))
            }
            else
            { 
                rl = result.crop(0, 0, result.width - step, 0)
                rr = result.crop(result.width - step, 0, 0, 0)
       
                sl = str.crop(0, 0, step, 0)
                sr = str.crop(step, 0, 0, 0)
                result = rl.stackHorizontal(rr.mergeDiv2(sl, 0, step)).stackHorizontal(sr)
            }
        }
    }
    if (result.width == c.width)
    {
        return result
    }
    else
    {
        rl = result.crop(0, 0, result.width - step, 0)
        rr = result.crop(result.width - step, 0, 0, 0)

        if (c.width - result.width <= step)
        {
            cl = c.crop(result.width - step, 0, c.width - result.width, 0)
            result = rl.stackHorizontal(rr.mergeDiv2(cl, 0, step))
        }
        else
        {
            cl = c.crop(result.width - step, 0, step, 0)
            cr = c.crop(result.width, 0, 0, 0)
#return c.crop(rr.width,0,0,0).addBorders(200,0,0,0)
            result = rl.stackHorizontal(rr.mergeDiv2(cl, 0, step)).stackHorizontal(cr)
        }
    }
    return result
}
