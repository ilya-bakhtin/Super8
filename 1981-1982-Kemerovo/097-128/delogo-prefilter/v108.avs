import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v108, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v108.audioDub(va).prefetch
}

v108o = v108
#v108 = v108.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v108 = v108.deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 200, maxlen = 4096, maxangle = 45).\
            deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 200, maxlen = 4096, maxangle = 45)
#return v108o.interleave(v108).prefetch
return v108.audioDub(va).prefetch

if (!varExist("v108_angle"))
{
    v108o = v108

    v108_m = v108.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v108 = v108.convertToRGB32(interlaced=false, matrix="PC.709")

    v108 = v108.ExInpaint(mask = v108_m)
    v108 = v108.convertToYV24(interlaced=false, matrix="PC.709")

    v108_m = v108_m.convertToYV24(interlaced=false, matrix="PC.709")
    v108_m = v108_m.gaussResize(v108.width/8, v108.height/8).gaussResize(v108.width, v108.height)
    v108b = v108.gaussResize(v108.width/16, v108.height/16).gaussResize(v108.width, v108.height)
    v108 = v108o.mt_merge(v108b, v108_m, luma = true)
}
else
{
    flip = false
    if (v108_angle < 0)
    {
        v108 = v108.flipHorizontal()
        v108_angle = -v108_angle
        flip = true
    }

    v108 = v108.rotate(-v108_angle)
    v108 = v108.fill_wedges(a = v108_angle)

    v108o = v108
    if (flip)
    {
        v108_m = v108.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v108_m = v108.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v108_m = v108.prepare_solid_mask(w = 170, h = 120)
        v108 = v108.convertToRGB32(interlaced=false, matrix="PC.709")
        v108 = v108.ExInpaint(mask = v108_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v108 = v108.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v108_m = v108_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v108_m = v108_m.gaussResize(v108.width/8, v108.height/8).gaussResize(v108.width, v108.height)
    v108b = v108.gaussResize(v108.width/16, v108.height/16).gaussResize(v108.width, v108.height)
    v108 = v108o.mt_merge(v108b, v108_m, luma = true)
    if (flip)
    {
        v108 = v108.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v108_m = v108_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v108_m = v108_m.gaussResize(vv108.width/8, v108.height/8).gaussResize(v108.width, v108.height)
    v108_129 = v108.trim(129, -1)
    v108 = v108.trim(0, 129) + v108.trim(130, 138).mt_merge(v108_129.loop(10), v108_m, luma = true) + v108.trim(139, 0)
*/
    #v108 = v108.crop(78, 0, 0, -56)#.adjustBorders
}

v108 = v108.audioDub(va)

last = v108#.hist_levels
prefetch

