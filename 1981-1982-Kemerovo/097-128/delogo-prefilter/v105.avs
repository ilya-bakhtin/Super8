import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v105, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v105.audioDub(va).prefetch
}

v105o = v105
#v105 = v105.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v105 = v105.deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45)
#return v105o.interleave(v105).prefetch
return v105.audioDub(va).prefetch

if (!varExist("v105_angle"))
{
    v105o = v105

    v105_m = v105.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v105 = v105.convertToRGB32(interlaced=false, matrix="PC.709")

    v105 = v105.ExInpaint(mask = v105_m)
    v105 = v105.convertToYV24(interlaced=false, matrix="PC.709")

    v105_m = v105_m.convertToYV24(interlaced=false, matrix="PC.709")
    v105_m = v105_m.gaussResize(v105.width/8, v105.height/8).gaussResize(v105.width, v105.height)
    v105b = v105.gaussResize(v105.width/16, v105.height/16).gaussResize(v105.width, v105.height)
    v105 = v105o.mt_merge(v105b, v105_m, luma = true)
}
else
{
    flip = false
    if (v105_angle < 0)
    {
        v105 = v105.flipHorizontal()
        v105_angle = -v105_angle
        flip = true
    }

    v105 = v105.rotate(-v105_angle)
    v105 = v105.fill_wedges(a = v105_angle)

    v105o = v105
    if (flip)
    {
        v105_m = v105.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v105_m = v105.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v105_m = v105.prepare_solid_mask(w = 170, h = 120)
        v105 = v105.convertToRGB32(interlaced=false, matrix="PC.709")
        v105 = v105.ExInpaint(mask = v105_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v105 = v105.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v105_m = v105_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v105_m = v105_m.gaussResize(v105.width/8, v105.height/8).gaussResize(v105.width, v105.height)
    v105b = v105.gaussResize(v105.width/16, v105.height/16).gaussResize(v105.width, v105.height)
    v105 = v105o.mt_merge(v105b, v105_m, luma = true)
    if (flip)
    {
        v105 = v105.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v105_m = v105_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v105_m = v105_m.gaussResize(vv105.width/8, v105.height/8).gaussResize(v105.width, v105.height)
    v105_129 = v105.trim(129, -1)
    v105 = v105.trim(0, 129) + v105.trim(130, 138).mt_merge(v105_129.loop(10), v105_m, luma = true) + v105.trim(139, 0)
*/
    #v105 = v105.crop(78, 0, 0, -56)#.adjustBorders
}

v105 = v105.audioDub(va)

last = v105#.hist_levels
prefetch

