import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v120, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v120.audioDub(va).prefetch
}

v120o = v120
#v120 = v120.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v120 = v120.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v120o.interleave(v120).prefetch
return v120.audioDub(va).prefetch

if (!varExist("v120_angle"))
{
    v120o = v120

    v120_m = v120.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v120 = v120.convertToRGB32(interlaced=false, matrix="PC.709")

    v120 = v120.ExInpaint(mask = v120_m)
    v120 = v120.convertToYV24(interlaced=false, matrix="PC.709")

    v120_m = v120_m.convertToYV24(interlaced=false, matrix="PC.709")
    v120_m = v120_m.gaussResize(v120.width/8, v120.height/8).gaussResize(v120.width, v120.height)
    v120b = v120.gaussResize(v120.width/16, v120.height/16).gaussResize(v120.width, v120.height)
    v120 = v120o.mt_merge(v120b, v120_m, luma = true)
}
else
{
    flip = false
    if (v120_angle < 0)
    {
        v120 = v120.flipHorizontal()
        v120_angle = -v120_angle
        flip = true
    }

    v120 = v120.rotate(-v120_angle)
    v120 = v120.fill_wedges(a = v120_angle)

    v120o = v120
    if (flip)
    {
        v120_m = v120.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v120_m = v120.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v120_m = v120.prepare_solid_mask(w = 170, h = 120)
        v120 = v120.convertToRGB32(interlaced=false, matrix="PC.709")
        v120 = v120.ExInpaint(mask = v120_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v120 = v120.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v120_m = v120_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v120_m = v120_m.gaussResize(v120.width/8, v120.height/8).gaussResize(v120.width, v120.height)
    v120b = v120.gaussResize(v120.width/16, v120.height/16).gaussResize(v120.width, v120.height)
    v120 = v120o.mt_merge(v120b, v120_m, luma = true)
    if (flip)
    {
        v120 = v120.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v120_m = v120_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v120_m = v120_m.gaussResize(vv120.width/8, v120.height/8).gaussResize(v120.width, v120.height)
    v120_129 = v120.trim(129, -1)
    v120 = v120.trim(0, 129) + v120.trim(130, 138).mt_merge(v120_129.loop(10), v120_m, luma = true) + v120.trim(139, 0)
*/
    #v120 = v120.crop(78, 0, 0, -56)#.adjustBorders
}

v120 = v120.audioDub(va)

last = v120#.hist_levels
prefetch

