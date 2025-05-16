import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v123, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v123.audioDub(va).prefetch
}

v123o = v123
#v123 = v123.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v123 = v123.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v123o.interleave(v123).prefetch
return v123.audioDub(va).prefetch

if (!varExist("v123_angle"))
{
    v123o = v123

    v123_m = v123.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v123 = v123.convertToRGB32(interlaced=false, matrix="PC.709")

    v123 = v123.ExInpaint(mask = v123_m)
    v123 = v123.convertToYV24(interlaced=false, matrix="PC.709")

    v123_m = v123_m.convertToYV24(interlaced=false, matrix="PC.709")
    v123_m = v123_m.gaussResize(v123.width/8, v123.height/8).gaussResize(v123.width, v123.height)
    v123b = v123.gaussResize(v123.width/16, v123.height/16).gaussResize(v123.width, v123.height)
    v123 = v123o.mt_merge(v123b, v123_m, luma = true)
}
else
{
    flip = false
    if (v123_angle < 0)
    {
        v123 = v123.flipHorizontal()
        v123_angle = -v123_angle
        flip = true
    }

    v123 = v123.rotate(-v123_angle)
    v123 = v123.fill_wedges(a = v123_angle)

    v123o = v123
    if (flip)
    {
        v123_m = v123.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v123_m = v123.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v123_m = v123.prepare_solid_mask(w = 170, h = 120)
        v123 = v123.convertToRGB32(interlaced=false, matrix="PC.709")
        v123 = v123.ExInpaint(mask = v123_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v123 = v123.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v123_m = v123_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v123_m = v123_m.gaussResize(v123.width/8, v123.height/8).gaussResize(v123.width, v123.height)
    v123b = v123.gaussResize(v123.width/16, v123.height/16).gaussResize(v123.width, v123.height)
    v123 = v123o.mt_merge(v123b, v123_m, luma = true)
    if (flip)
    {
        v123 = v123.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v123_m = v123_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v123_m = v123_m.gaussResize(vv123.width/8, v123.height/8).gaussResize(v123.width, v123.height)
    v123_129 = v123.trim(129, -1)
    v123 = v123.trim(0, 129) + v123.trim(130, 138).mt_merge(v123_129.loop(10), v123_m, luma = true) + v123.trim(139, 0)
*/
    #v123 = v123.crop(78, 0, 0, -56)#.adjustBorders
}

v123 = v123.audioDub(va)

last = v123#.hist_levels
prefetch

