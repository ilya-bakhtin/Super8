import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v110, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v110.audioDub(va).prefetch
}

v110o = v110
#v110 = v110.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v110 = v110.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
            deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
#return v110o.interleave(v110).prefetch
return v110.audioDub(va).prefetch

if (!varExist("v110_angle"))
{
    v110o = v110

    v110_m = v110.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v110 = v110.convertToRGB32(interlaced=false, matrix="PC.709")

    v110 = v110.ExInpaint(mask = v110_m)
    v110 = v110.convertToYV24(interlaced=false, matrix="PC.709")

    v110_m = v110_m.convertToYV24(interlaced=false, matrix="PC.709")
    v110_m = v110_m.gaussResize(v110.width/8, v110.height/8).gaussResize(v110.width, v110.height)
    v110b = v110.gaussResize(v110.width/16, v110.height/16).gaussResize(v110.width, v110.height)
    v110 = v110o.mt_merge(v110b, v110_m, luma = true)
}
else
{
    flip = false
    if (v110_angle < 0)
    {
        v110 = v110.flipHorizontal()
        v110_angle = -v110_angle
        flip = true
    }

    v110 = v110.rotate(-v110_angle)
    v110 = v110.fill_wedges(a = v110_angle)

    v110o = v110
    if (flip)
    {
        v110_m = v110.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v110_m = v110.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v110_m = v110.prepare_solid_mask(w = 170, h = 120)
        v110 = v110.convertToRGB32(interlaced=false, matrix="PC.709")
        v110 = v110.ExInpaint(mask = v110_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v110 = v110.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v110_m = v110_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v110_m = v110_m.gaussResize(v110.width/8, v110.height/8).gaussResize(v110.width, v110.height)
    v110b = v110.gaussResize(v110.width/16, v110.height/16).gaussResize(v110.width, v110.height)
    v110 = v110o.mt_merge(v110b, v110_m, luma = true)
    if (flip)
    {
        v110 = v110.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v110_m = v110_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v110_m = v110_m.gaussResize(vv110.width/8, v110.height/8).gaussResize(v110.width, v110.height)
    v110_129 = v110.trim(129, -1)
    v110 = v110.trim(0, 129) + v110.trim(130, 138).mt_merge(v110_129.loop(10), v110_m, luma = true) + v110.trim(139, 0)
*/
    #v110 = v110.crop(78, 0, 0, -56)#.adjustBorders
}

v110 = v110.audioDub(va)

last = v110#.hist_levels
prefetch

