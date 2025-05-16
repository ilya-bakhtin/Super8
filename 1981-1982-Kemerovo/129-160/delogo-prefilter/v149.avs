import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v149, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v149.audioDub(va).prefetch
}

v149o = v149
#v149 = v149.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v149 = v149.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v149o.interleave(v149).prefetch
return v149.audioDub(va).prefetch

if (!varExist("v149_angle"))
{
    v149o = v149

    v149_m = v149.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v149 = v149.convertToRGB32(interlaced=false, matrix="PC.709")

    v149 = v149.ExInpaint(mask = v149_m)
    v149 = v149.convertToYV24(interlaced=false, matrix="PC.709")

    v149_m = v149_m.convertToYV24(interlaced=false, matrix="PC.709")
    v149_m = v149_m.gaussResize(v149.width/8, v149.height/8).gaussResize(v149.width, v149.height)
    v149b = v149.gaussResize(v149.width/16, v149.height/16).gaussResize(v149.width, v149.height)
    v149 = v149o.mt_merge(v149b, v149_m, luma = true)
}
else
{
    flip = false
    if (v149_angle < 0)
    {
        v149 = v149.flipHorizontal()
        v149_angle = -v149_angle
        flip = true
    }

    v149 = v149.rotate(-v149_angle)
    v149 = v149.fill_wedges(a = v149_angle)

    v149o = v149
    if (flip)
    {
        v149_m = v149.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v149_m = v149.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v149_m = v149.prepare_solid_mask(w = 170, h = 120)
        v149 = v149.convertToRGB32(interlaced=false, matrix="PC.709")
        v149 = v149.ExInpaint(mask = v149_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v149 = v149.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v149_m = v149_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v149_m = v149_m.gaussResize(v149.width/8, v149.height/8).gaussResize(v149.width, v149.height)
    v149b = v149.gaussResize(v149.width/16, v149.height/16).gaussResize(v149.width, v149.height)
    v149 = v149o.mt_merge(v149b, v149_m, luma = true)
    if (flip)
    {
        v149 = v149.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v149_m = v149_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v149_m = v149_m.gaussResize(vv149.width/8, v149.height/8).gaussResize(v149.width, v149.height)
    v149_129 = v149.trim(129, -1)
    v149 = v149.trim(0, 129) + v149.trim(130, 138).mt_merge(v149_129.loop(10), v149_m, luma = true) + v149.trim(139, 0)
*/
    #v149 = v149.crop(78, 0, 0, -56)#.adjustBorders
}

v149 = v149.audioDub(va)

last = v149#.hist_levels
prefetch

