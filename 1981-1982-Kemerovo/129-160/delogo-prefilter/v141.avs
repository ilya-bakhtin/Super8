import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v141, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v141.audioDub(va).prefetch
}

v141o = v141
#v141 = v141.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v141 = v141.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v141o.interleave(v141).prefetch
return v141.audioDub(va).prefetch

if (!varExist("v141_angle"))
{
    v141o = v141

    v141_m = v141.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v141 = v141.convertToRGB32(interlaced=false, matrix="PC.709")

    v141 = v141.ExInpaint(mask = v141_m)
    v141 = v141.convertToYV24(interlaced=false, matrix="PC.709")

    v141_m = v141_m.convertToYV24(interlaced=false, matrix="PC.709")
    v141_m = v141_m.gaussResize(v141.width/8, v141.height/8).gaussResize(v141.width, v141.height)
    v141b = v141.gaussResize(v141.width/16, v141.height/16).gaussResize(v141.width, v141.height)
    v141 = v141o.mt_merge(v141b, v141_m, luma = true)
}
else
{
    flip = false
    if (v141_angle < 0)
    {
        v141 = v141.flipHorizontal()
        v141_angle = -v141_angle
        flip = true
    }

    v141 = v141.rotate(-v141_angle)
    v141 = v141.fill_wedges(a = v141_angle)

    v141o = v141
    if (flip)
    {
        v141_m = v141.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v141_m = v141.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v141_m = v141.prepare_solid_mask(w = 170, h = 120)
        v141 = v141.convertToRGB32(interlaced=false, matrix="PC.709")
        v141 = v141.ExInpaint(mask = v141_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v141 = v141.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v141_m = v141_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v141_m = v141_m.gaussResize(v141.width/8, v141.height/8).gaussResize(v141.width, v141.height)
    v141b = v141.gaussResize(v141.width/16, v141.height/16).gaussResize(v141.width, v141.height)
    v141 = v141o.mt_merge(v141b, v141_m, luma = true)
    if (flip)
    {
        v141 = v141.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v141_m = v141_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v141_m = v141_m.gaussResize(vv141.width/8, v141.height/8).gaussResize(v141.width, v141.height)
    v141_129 = v141.trim(129, -1)
    v141 = v141.trim(0, 129) + v141.trim(130, 138).mt_merge(v141_129.loop(10), v141_m, luma = true) + v141.trim(139, 0)
*/
    #v141 = v141.crop(78, 0, 0, -56)#.adjustBorders
}

v141 = v141.audioDub(va)

last = v141#.hist_levels
prefetch

