import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v136, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v136.audioDub(va).prefetch
}

v136o = v136
#v136 = v136.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v136 = v136.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v136o.interleave(v136).prefetch
return v136.audioDub(va).prefetch

if (!varExist("v136_angle"))
{
    v136o = v136

    v136_m = v136.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v136 = v136.convertToRGB32(interlaced=false, matrix="PC.709")

    v136 = v136.ExInpaint(mask = v136_m)
    v136 = v136.convertToYV24(interlaced=false, matrix="PC.709")

    v136_m = v136_m.convertToYV24(interlaced=false, matrix="PC.709")
    v136_m = v136_m.gaussResize(v136.width/8, v136.height/8).gaussResize(v136.width, v136.height)
    v136b = v136.gaussResize(v136.width/16, v136.height/16).gaussResize(v136.width, v136.height)
    v136 = v136o.mt_merge(v136b, v136_m, luma = true)
}
else
{
    flip = false
    if (v136_angle < 0)
    {
        v136 = v136.flipHorizontal()
        v136_angle = -v136_angle
        flip = true
    }

    v136 = v136.rotate(-v136_angle)
    v136 = v136.fill_wedges(a = v136_angle)

    v136o = v136
    if (flip)
    {
        v136_m = v136.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v136_m = v136.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v136_m = v136.prepare_solid_mask(w = 170, h = 120)
        v136 = v136.convertToRGB32(interlaced=false, matrix="PC.709")
        v136 = v136.ExInpaint(mask = v136_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v136 = v136.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v136_m = v136_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v136_m = v136_m.gaussResize(v136.width/8, v136.height/8).gaussResize(v136.width, v136.height)
    v136b = v136.gaussResize(v136.width/16, v136.height/16).gaussResize(v136.width, v136.height)
    v136 = v136o.mt_merge(v136b, v136_m, luma = true)
    if (flip)
    {
        v136 = v136.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v136_m = v136_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v136_m = v136_m.gaussResize(vv136.width/8, v136.height/8).gaussResize(v136.width, v136.height)
    v136_129 = v136.trim(129, -1)
    v136 = v136.trim(0, 129) + v136.trim(130, 138).mt_merge(v136_129.loop(10), v136_m, luma = true) + v136.trim(139, 0)
*/
    #v136 = v136.crop(78, 0, 0, -56)#.adjustBorders
}

v136 = v136.audioDub(va)

last = v136#.hist_levels
prefetch

