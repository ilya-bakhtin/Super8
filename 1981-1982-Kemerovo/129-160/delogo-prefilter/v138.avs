import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v138, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v138.audioDub(va).prefetch
}

v138o = v138
#v138 = v138.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v138 = v138.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v138o.interleave(v138).prefetch
return v138.audioDub(va).prefetch

if (!varExist("v138_angle"))
{
    v138o = v138

    v138_m = v138.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v138 = v138.convertToRGB32(interlaced=false, matrix="PC.709")

    v138 = v138.ExInpaint(mask = v138_m)
    v138 = v138.convertToYV24(interlaced=false, matrix="PC.709")

    v138_m = v138_m.convertToYV24(interlaced=false, matrix="PC.709")
    v138_m = v138_m.gaussResize(v138.width/8, v138.height/8).gaussResize(v138.width, v138.height)
    v138b = v138.gaussResize(v138.width/16, v138.height/16).gaussResize(v138.width, v138.height)
    v138 = v138o.mt_merge(v138b, v138_m, luma = true)
}
else
{
    flip = false
    if (v138_angle < 0)
    {
        v138 = v138.flipHorizontal()
        v138_angle = -v138_angle
        flip = true
    }

    v138 = v138.rotate(-v138_angle)
    v138 = v138.fill_wedges(a = v138_angle)

    v138o = v138
    if (flip)
    {
        v138_m = v138.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v138_m = v138.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v138_m = v138.prepare_solid_mask(w = 170, h = 120)
        v138 = v138.convertToRGB32(interlaced=false, matrix="PC.709")
        v138 = v138.ExInpaint(mask = v138_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v138 = v138.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v138_m = v138_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v138_m = v138_m.gaussResize(v138.width/8, v138.height/8).gaussResize(v138.width, v138.height)
    v138b = v138.gaussResize(v138.width/16, v138.height/16).gaussResize(v138.width, v138.height)
    v138 = v138o.mt_merge(v138b, v138_m, luma = true)
    if (flip)
    {
        v138 = v138.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v138_m = v138_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v138_m = v138_m.gaussResize(vv138.width/8, v138.height/8).gaussResize(v138.width, v138.height)
    v138_129 = v138.trim(129, -1)
    v138 = v138.trim(0, 129) + v138.trim(130, 138).mt_merge(v138_129.loop(10), v138_m, luma = true) + v138.trim(139, 0)
*/
    #v138 = v138.crop(78, 0, 0, -56)#.adjustBorders
}

v138 = v138.audioDub(va)

last = v138#.hist_levels
prefetch

