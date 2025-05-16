import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v98, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v98.audioDub(va).prefetch
}

v98o = v98
#v98 = v98.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v98 = v98.deScratch(mindif = 1, asym = 255, maxwidth = 9, minlen = 170, maxlen = 4096, maxangle = 45).\
          deScratch(mindif = 1, asym = 255, maxwidth = 9, minlen = 170, maxlen = 4096, maxangle = 45)
#return v98o.interleave(v98).prefetch
return v98.audioDub(va).prefetch

if (!varExist("v98_angle"))
{
    v98o = v98

    v98_m = v98.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v98 = v98.convertToRGB32(interlaced=false, matrix="PC.709")

    v98 = v98.ExInpaint(mask = v98_m)
    v98 = v98.convertToYV24(interlaced=false, matrix="PC.709")

    v98_m = v98_m.convertToYV24(interlaced=false, matrix="PC.709")
    v98_m = v98_m.gaussResize(v98.width/8, v98.height/8).gaussResize(v98.width, v98.height)
    v98b = v98.gaussResize(v98.width/16, v98.height/16).gaussResize(v98.width, v98.height)
    v98 = v98o.mt_merge(v98b, v98_m, luma = true)
}
else
{
    flip = false
    if (v98_angle < 0)
    {
        v98 = v98.flipHorizontal()
        v98_angle = -v98_angle
        flip = true
    }

    v98 = v98.rotate(-v98_angle)
    v98 = v98.fill_wedges(a = v98_angle)

    v98o = v98
    if (flip)
    {
        v98_m = v98.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v98_m = v98.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v98_m = v98.prepare_solid_mask(w = 170, h = 120)
        v98 = v98.convertToRGB32(interlaced=false, matrix="PC.709")
        v98 = v98.ExInpaint(mask = v98_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v98 = v98.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v98_m = v98_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v98_m = v98_m.gaussResize(v98.width/8, v98.height/8).gaussResize(v98.width, v98.height)
    v98b = v98.gaussResize(v98.width/16, v98.height/16).gaussResize(v98.width, v98.height)
    v98 = v98o.mt_merge(v98b, v98_m, luma = true)
    if (flip)
    {
        v98 = v98.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v98_m = v98_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v98_m = v98_m.gaussResize(vv98.width/8, v98.height/8).gaussResize(v98.width, v98.height)
    v98_129 = v98.trim(129, -1)
    v98 = v98.trim(0, 129) + v98.trim(130, 138).mt_merge(v98_129.loop(10), v98_m, luma = true) + v98.trim(139, 0)
*/
    #v98 = v98.crop(78, 0, 0, -56)#.adjustBorders
}

v98 = v98.audioDub(va)

last = v98#.hist_levels
prefetch

