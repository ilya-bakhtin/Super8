import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v109, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v109.audioDub(va).prefetch
}

v109o = v109
#v109 = v109.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v109 = v109.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v109o.interleave(v109).prefetch
return v109.audioDub(va).prefetch

if (!varExist("v109_angle"))
{
    v109o = v109

    v109_m = v109.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v109 = v109.convertToRGB32(interlaced=false, matrix="PC.709")

    v109 = v109.ExInpaint(mask = v109_m)
    v109 = v109.convertToYV24(interlaced=false, matrix="PC.709")

    v109_m = v109_m.convertToYV24(interlaced=false, matrix="PC.709")
    v109_m = v109_m.gaussResize(v109.width/8, v109.height/8).gaussResize(v109.width, v109.height)
    v109b = v109.gaussResize(v109.width/16, v109.height/16).gaussResize(v109.width, v109.height)
    v109 = v109o.mt_merge(v109b, v109_m, luma = true)
}
else
{
    flip = false
    if (v109_angle < 0)
    {
        v109 = v109.flipHorizontal()
        v109_angle = -v109_angle
        flip = true
    }

    v109 = v109.rotate(-v109_angle)
    v109 = v109.fill_wedges(a = v109_angle)

    v109o = v109
    if (flip)
    {
        v109_m = v109.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v109_m = v109.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v109_m = v109.prepare_solid_mask(w = 170, h = 120)
        v109 = v109.convertToRGB32(interlaced=false, matrix="PC.709")
        v109 = v109.ExInpaint(mask = v109_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v109 = v109.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v109_m = v109_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v109_m = v109_m.gaussResize(v109.width/8, v109.height/8).gaussResize(v109.width, v109.height)
    v109b = v109.gaussResize(v109.width/16, v109.height/16).gaussResize(v109.width, v109.height)
    v109 = v109o.mt_merge(v109b, v109_m, luma = true)
    if (flip)
    {
        v109 = v109.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v109_m = v109_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v109_m = v109_m.gaussResize(vv109.width/8, v109.height/8).gaussResize(v109.width, v109.height)
    v109_129 = v109.trim(129, -1)
    v109 = v109.trim(0, 129) + v109.trim(130, 138).mt_merge(v109_129.loop(10), v109_m, luma = true) + v109.trim(139, 0)
*/
    #v109 = v109.crop(78, 0, 0, -56)#.adjustBorders
}

v109 = v109.audioDub(va)

last = v109#.hist_levels
prefetch

