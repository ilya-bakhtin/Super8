import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v139, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v139.audioDub(va).prefetch
}

v139o = v139
#v139 = v139.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v139 = v139.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v139o.interleave(v139).prefetch
return v139.audioDub(va).prefetch

if (!varExist("v139_angle"))
{
    v139o = v139

    v139_m = v139.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v139 = v139.convertToRGB32(interlaced=false, matrix="PC.709")

    v139 = v139.ExInpaint(mask = v139_m)
    v139 = v139.convertToYV24(interlaced=false, matrix="PC.709")

    v139_m = v139_m.convertToYV24(interlaced=false, matrix="PC.709")
    v139_m = v139_m.gaussResize(v139.width/8, v139.height/8).gaussResize(v139.width, v139.height)
    v139b = v139.gaussResize(v139.width/16, v139.height/16).gaussResize(v139.width, v139.height)
    v139 = v139o.mt_merge(v139b, v139_m, luma = true)
}
else
{
    flip = false
    if (v139_angle < 0)
    {
        v139 = v139.flipHorizontal()
        v139_angle = -v139_angle
        flip = true
    }

    v139 = v139.rotate(-v139_angle)
    v139 = v139.fill_wedges(a = v139_angle)

    v139o = v139
    if (flip)
    {
        v139_m = v139.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v139_m = v139.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v139_m = v139.prepare_solid_mask(w = 170, h = 120)
        v139 = v139.convertToRGB32(interlaced=false, matrix="PC.709")
        v139 = v139.ExInpaint(mask = v139_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v139 = v139.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v139_m = v139_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v139_m = v139_m.gaussResize(v139.width/8, v139.height/8).gaussResize(v139.width, v139.height)
    v139b = v139.gaussResize(v139.width/16, v139.height/16).gaussResize(v139.width, v139.height)
    v139 = v139o.mt_merge(v139b, v139_m, luma = true)
    if (flip)
    {
        v139 = v139.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v139_m = v139_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v139_m = v139_m.gaussResize(vv139.width/8, v139.height/8).gaussResize(v139.width, v139.height)
    v139_129 = v139.trim(129, -1)
    v139 = v139.trim(0, 129) + v139.trim(130, 138).mt_merge(v139_129.loop(10), v139_m, luma = true) + v139.trim(139, 0)
*/
    #v139 = v139.crop(78, 0, 0, -56)#.adjustBorders
}

v139 = v139.audioDub(va)

last = v139#.hist_levels
prefetch

