import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v125, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v125.audioDub(va).prefetch
}

v125o = v125
#v125 = v125.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v125 = v125.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
#return v125o.interleave(v125).prefetch
#return v125.audioDub(va).prefetch

if (!varExist("v125_angle"))
{
    v125o = v125

    v125_m = v125.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v125 = v125.convertToRGB32(interlaced=false, matrix="PC.709")

    v125 = v125.ExInpaint(mask = v125_m)
    v125 = v125.convertToYV24(interlaced=false, matrix="PC.709")

    v125_m = v125_m.convertToYV24(interlaced=false, matrix="PC.709")
    v125_m = v125_m.gaussResize(v125.width/8, v125.height/8).gaussResize(v125.width, v125.height)
    v125b = v125.gaussResize(v125.width/16, v125.height/16).gaussResize(v125.width, v125.height)
    v125 = v125o.mt_merge(v125b, v125_m, luma = true)
}
else
{
    flip = false
    if (v125_angle < 0)
    {
        v125 = v125.flipHorizontal()
        v125_angle = -v125_angle
        flip = true
    }

    v125 = v125.rotate(-v125_angle)
    v125 = v125.fill_wedges(a = v125_angle)

    v125o = v125
    if (flip)
    {
        v125_m = v125.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v125_m = v125.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v125_m = v125.prepare_solid_mask(w = 170, h = 120)
        v125 = v125.convertToRGB32(interlaced=false, matrix="PC.709")
        v125 = v125.ExInpaint(mask = v125_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v125 = v125.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v125_m = v125_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v125_m = v125_m.gaussResize(v125.width/8, v125.height/8).gaussResize(v125.width, v125.height)
    v125b = v125.gaussResize(v125.width/16, v125.height/16).gaussResize(v125.width, v125.height)
    v125 = v125o.mt_merge(v125b, v125_m, luma = true)
    if (flip)
    {
        v125 = v125.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v125_m = v125_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v125_m = v125_m.gaussResize(vv125.width/8, v125.height/8).gaussResize(v125.width, v125.height)
    v125_129 = v125.trim(129, -1)
    v125 = v125.trim(0, 129) + v125.trim(130, 138).mt_merge(v125_129.loop(10), v125_m, luma = true) + v125.trim(139, 0)
*/
    #v125 = v125.crop(78, 0, 0, -56)#.adjustBorders
}

v125 = v125.audioDub(va)

last = v125#.hist_levels
prefetch

