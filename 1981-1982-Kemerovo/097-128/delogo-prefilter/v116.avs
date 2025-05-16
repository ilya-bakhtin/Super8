import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v116, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v116.audioDub(va).prefetch
}

v116o = v116
#v116 = v116.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v116 = v116.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
            deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
#return v116o.interleave(v116).prefetch
return v116.audioDub(va).prefetch

if (!varExist("v116_angle"))
{
    v116o = v116

    v116_m = v116.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v116 = v116.convertToRGB32(interlaced=false, matrix="PC.709")

    v116 = v116.ExInpaint(mask = v116_m)
    v116 = v116.convertToYV24(interlaced=false, matrix="PC.709")

    v116_m = v116_m.convertToYV24(interlaced=false, matrix="PC.709")
    v116_m = v116_m.gaussResize(v116.width/8, v116.height/8).gaussResize(v116.width, v116.height)
    v116b = v116.gaussResize(v116.width/16, v116.height/16).gaussResize(v116.width, v116.height)
    v116 = v116o.mt_merge(v116b, v116_m, luma = true)
}
else
{
    flip = false
    if (v116_angle < 0)
    {
        v116 = v116.flipHorizontal()
        v116_angle = -v116_angle
        flip = true
    }

    v116 = v116.rotate(-v116_angle)
    v116 = v116.fill_wedges(a = v116_angle)

    v116o = v116
    if (flip)
    {
        v116_m = v116.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v116_m = v116.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v116_m = v116.prepare_solid_mask(w = 170, h = 120)
        v116 = v116.convertToRGB32(interlaced=false, matrix="PC.709")
        v116 = v116.ExInpaint(mask = v116_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v116 = v116.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v116_m = v116_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v116_m = v116_m.gaussResize(v116.width/8, v116.height/8).gaussResize(v116.width, v116.height)
    v116b = v116.gaussResize(v116.width/16, v116.height/16).gaussResize(v116.width, v116.height)
    v116 = v116o.mt_merge(v116b, v116_m, luma = true)
    if (flip)
    {
        v116 = v116.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v116_m = v116_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v116_m = v116_m.gaussResize(vv116.width/8, v116.height/8).gaussResize(v116.width, v116.height)
    v116_129 = v116.trim(129, -1)
    v116 = v116.trim(0, 129) + v116.trim(130, 138).mt_merge(v116_129.loop(10), v116_m, luma = true) + v116.trim(139, 0)
*/
    #v116 = v116.crop(78, 0, 0, -56)#.adjustBorders
}

v116 = v116.audioDub(va)

last = v116#.hist_levels
prefetch

