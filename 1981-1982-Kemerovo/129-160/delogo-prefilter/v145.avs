import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v145, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v145.audioDub(va).prefetch
}

v145o = v145
#v145 = v145.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v145 = v145.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v145o.interleave(v145).prefetch
return v145.audioDub(va).prefetch

if (!varExist("v145_angle"))
{
    v145o = v145

    v145_m = v145.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v145 = v145.convertToRGB32(interlaced=false, matrix="PC.709")

    v145 = v145.ExInpaint(mask = v145_m)
    v145 = v145.convertToYV24(interlaced=false, matrix="PC.709")

    v145_m = v145_m.convertToYV24(interlaced=false, matrix="PC.709")
    v145_m = v145_m.gaussResize(v145.width/8, v145.height/8).gaussResize(v145.width, v145.height)
    v145b = v145.gaussResize(v145.width/16, v145.height/16).gaussResize(v145.width, v145.height)
    v145 = v145o.mt_merge(v145b, v145_m, luma = true)
}
else
{
    flip = false
    if (v145_angle < 0)
    {
        v145 = v145.flipHorizontal()
        v145_angle = -v145_angle
        flip = true
    }

    v145 = v145.rotate(-v145_angle)
    v145 = v145.fill_wedges(a = v145_angle)

    v145o = v145
    if (flip)
    {
        v145_m = v145.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v145_m = v145.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v145_m = v145.prepare_solid_mask(w = 170, h = 120)
        v145 = v145.convertToRGB32(interlaced=false, matrix="PC.709")
        v145 = v145.ExInpaint(mask = v145_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v145 = v145.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v145_m = v145_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v145_m = v145_m.gaussResize(v145.width/8, v145.height/8).gaussResize(v145.width, v145.height)
    v145b = v145.gaussResize(v145.width/16, v145.height/16).gaussResize(v145.width, v145.height)
    v145 = v145o.mt_merge(v145b, v145_m, luma = true)
    if (flip)
    {
        v145 = v145.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v145_m = v145_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v145_m = v145_m.gaussResize(vv145.width/8, v145.height/8).gaussResize(v145.width, v145.height)
    v145_129 = v145.trim(129, -1)
    v145 = v145.trim(0, 129) + v145.trim(130, 138).mt_merge(v145_129.loop(10), v145_m, luma = true) + v145.trim(139, 0)
*/
    #v145 = v145.crop(78, 0, 0, -56)#.adjustBorders
}

v145 = v145.audioDub(va)

last = v145#.hist_levels
prefetch

