import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v142, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v142.audioDub(va).prefetch
}

v142o = v142
#v142 = v142.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v142 = v142.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v142o.interleave(v142).prefetch
return v142.audioDub(va).prefetch

if (!varExist("v142_angle"))
{
    v142o = v142

    v142_m = v142.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v142 = v142.convertToRGB32(interlaced=false, matrix="PC.709")

    v142 = v142.ExInpaint(mask = v142_m)
    v142 = v142.convertToYV24(interlaced=false, matrix="PC.709")

    v142_m = v142_m.convertToYV24(interlaced=false, matrix="PC.709")
    v142_m = v142_m.gaussResize(v142.width/8, v142.height/8).gaussResize(v142.width, v142.height)
    v142b = v142.gaussResize(v142.width/16, v142.height/16).gaussResize(v142.width, v142.height)
    v142 = v142o.mt_merge(v142b, v142_m, luma = true)
}
else
{
    flip = false
    if (v142_angle < 0)
    {
        v142 = v142.flipHorizontal()
        v142_angle = -v142_angle
        flip = true
    }

    v142 = v142.rotate(-v142_angle)
    v142 = v142.fill_wedges(a = v142_angle)

    v142o = v142
    if (flip)
    {
        v142_m = v142.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v142_m = v142.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v142_m = v142.prepare_solid_mask(w = 170, h = 120)
        v142 = v142.convertToRGB32(interlaced=false, matrix="PC.709")
        v142 = v142.ExInpaint(mask = v142_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v142 = v142.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v142_m = v142_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v142_m = v142_m.gaussResize(v142.width/8, v142.height/8).gaussResize(v142.width, v142.height)
    v142b = v142.gaussResize(v142.width/16, v142.height/16).gaussResize(v142.width, v142.height)
    v142 = v142o.mt_merge(v142b, v142_m, luma = true)
    if (flip)
    {
        v142 = v142.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v142_m = v142_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v142_m = v142_m.gaussResize(vv142.width/8, v142.height/8).gaussResize(v142.width, v142.height)
    v142_129 = v142.trim(129, -1)
    v142 = v142.trim(0, 129) + v142.trim(130, 138).mt_merge(v142_129.loop(10), v142_m, luma = true) + v142.trim(139, 0)
*/
    #v142 = v142.crop(78, 0, 0, -56)#.adjustBorders
}

v142 = v142.audioDub(va)

last = v142#.hist_levels
prefetch

