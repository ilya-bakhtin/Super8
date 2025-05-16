import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v119, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v119.audioDub(va).prefetch
}

v119o = v119
#v119 = v119.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v119 = v119.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v119o.interleave(v119).prefetch
return v119.audioDub(va).prefetch

if (!varExist("v119_angle"))
{
    v119o = v119

    v119_m = v119.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v119 = v119.convertToRGB32(interlaced=false, matrix="PC.709")

    v119 = v119.ExInpaint(mask = v119_m)
    v119 = v119.convertToYV24(interlaced=false, matrix="PC.709")

    v119_m = v119_m.convertToYV24(interlaced=false, matrix="PC.709")
    v119_m = v119_m.gaussResize(v119.width/8, v119.height/8).gaussResize(v119.width, v119.height)
    v119b = v119.gaussResize(v119.width/16, v119.height/16).gaussResize(v119.width, v119.height)
    v119 = v119o.mt_merge(v119b, v119_m, luma = true)
}
else
{
    flip = false
    if (v119_angle < 0)
    {
        v119 = v119.flipHorizontal()
        v119_angle = -v119_angle
        flip = true
    }

    v119 = v119.rotate(-v119_angle)
    v119 = v119.fill_wedges(a = v119_angle)

    v119o = v119
    if (flip)
    {
        v119_m = v119.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v119_m = v119.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v119_m = v119.prepare_solid_mask(w = 170, h = 120)
        v119 = v119.convertToRGB32(interlaced=false, matrix="PC.709")
        v119 = v119.ExInpaint(mask = v119_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v119 = v119.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v119_m = v119_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v119_m = v119_m.gaussResize(v119.width/8, v119.height/8).gaussResize(v119.width, v119.height)
    v119b = v119.gaussResize(v119.width/16, v119.height/16).gaussResize(v119.width, v119.height)
    v119 = v119o.mt_merge(v119b, v119_m, luma = true)
    if (flip)
    {
        v119 = v119.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v119_m = v119_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v119_m = v119_m.gaussResize(vv119.width/8, v119.height/8).gaussResize(v119.width, v119.height)
    v119_129 = v119.trim(129, -1)
    v119 = v119.trim(0, 129) + v119.trim(130, 138).mt_merge(v119_129.loop(10), v119_m, luma = true) + v119.trim(139, 0)
*/
    #v119 = v119.crop(78, 0, 0, -56)#.adjustBorders
}

v119 = v119.audioDub(va)

last = v119#.hist_levels
prefetch

