import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v133, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v133.audioDub(va).prefetch
}

v133o = v133
#v133 = v133.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v133 = v133.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v133o.interleave(v133).prefetch
return v133.audioDub(va).prefetch

if (!varExist("v133_angle"))
{
    v133o = v133

    v133_m = v133.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v133 = v133.convertToRGB32(interlaced=false, matrix="PC.709")

    v133 = v133.ExInpaint(mask = v133_m)
    v133 = v133.convertToYV24(interlaced=false, matrix="PC.709")

    v133_m = v133_m.convertToYV24(interlaced=false, matrix="PC.709")
    v133_m = v133_m.gaussResize(v133.width/8, v133.height/8).gaussResize(v133.width, v133.height)
    v133b = v133.gaussResize(v133.width/16, v133.height/16).gaussResize(v133.width, v133.height)
    v133 = v133o.mt_merge(v133b, v133_m, luma = true)
}
else
{
    flip = false
    if (v133_angle < 0)
    {
        v133 = v133.flipHorizontal()
        v133_angle = -v133_angle
        flip = true
    }

    v133 = v133.rotate(-v133_angle)
    v133 = v133.fill_wedges(a = v133_angle)

    v133o = v133
    if (flip)
    {
        v133_m = v133.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v133_m = v133.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v133_m = v133.prepare_solid_mask(w = 170, h = 120)
        v133 = v133.convertToRGB32(interlaced=false, matrix="PC.709")
        v133 = v133.ExInpaint(mask = v133_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v133 = v133.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v133_m = v133_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v133_m = v133_m.gaussResize(v133.width/8, v133.height/8).gaussResize(v133.width, v133.height)
    v133b = v133.gaussResize(v133.width/16, v133.height/16).gaussResize(v133.width, v133.height)
    v133 = v133o.mt_merge(v133b, v133_m, luma = true)
    if (flip)
    {
        v133 = v133.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v133_m = v133_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v133_m = v133_m.gaussResize(vv133.width/8, v133.height/8).gaussResize(v133.width, v133.height)
    v133_129 = v133.trim(129, -1)
    v133 = v133.trim(0, 129) + v133.trim(130, 138).mt_merge(v133_129.loop(10), v133_m, luma = true) + v133.trim(139, 0)
*/
    #v133 = v133.crop(78, 0, 0, -56)#.adjustBorders
}

v133 = v133.audioDub(va)

last = v133#.hist_levels
prefetch

