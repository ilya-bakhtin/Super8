import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v130, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v130.audioDub(va).prefetch
}

v130o = v130
#v130 = v130.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v130 = v130.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v130o.interleave(v130).prefetch
return v130.audioDub(va).prefetch

if (!varExist("v130_angle"))
{
    v130o = v130

    v130_m = v130.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v130 = v130.convertToRGB32(interlaced=false, matrix="PC.709")

    v130 = v130.ExInpaint(mask = v130_m)
    v130 = v130.convertToYV24(interlaced=false, matrix="PC.709")

    v130_m = v130_m.convertToYV24(interlaced=false, matrix="PC.709")
    v130_m = v130_m.gaussResize(v130.width/8, v130.height/8).gaussResize(v130.width, v130.height)
    v130b = v130.gaussResize(v130.width/16, v130.height/16).gaussResize(v130.width, v130.height)
    v130 = v130o.mt_merge(v130b, v130_m, luma = true)
}
else
{
    flip = false
    if (v130_angle < 0)
    {
        v130 = v130.flipHorizontal()
        v130_angle = -v130_angle
        flip = true
    }

    v130 = v130.rotate(-v130_angle)
    v130 = v130.fill_wedges(a = v130_angle)

    v130o = v130
    if (flip)
    {
        v130_m = v130.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v130_m = v130.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v130_m = v130.prepare_solid_mask(w = 170, h = 120)
        v130 = v130.convertToRGB32(interlaced=false, matrix="PC.709")
        v130 = v130.ExInpaint(mask = v130_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v130 = v130.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v130_m = v130_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v130_m = v130_m.gaussResize(v130.width/8, v130.height/8).gaussResize(v130.width, v130.height)
    v130b = v130.gaussResize(v130.width/16, v130.height/16).gaussResize(v130.width, v130.height)
    v130 = v130o.mt_merge(v130b, v130_m, luma = true)
    if (flip)
    {
        v130 = v130.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v130_m = v130_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v130_m = v130_m.gaussResize(vv130.width/8, v130.height/8).gaussResize(v130.width, v130.height)
    v130_129 = v130.trim(129, -1)
    v130 = v130.trim(0, 129) + v130.trim(130, 138).mt_merge(v130_129.loop(10), v130_m, luma = true) + v130.trim(139, 0)
*/
    #v130 = v130.crop(78, 0, 0, -56)#.adjustBorders
}

v130 = v130.audioDub(va)

last = v130#.hist_levels
prefetch

