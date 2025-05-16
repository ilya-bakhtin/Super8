import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v114, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v114.audioDub(va).prefetch
}

v114o = v114
#v114 = v114.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v114 = v114.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
            deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
#return v114o.interleave(v114).prefetch
#return v114.audioDub(va).prefetch

if (!varExist("v114_angle"))
{
    v114o = v114

    v114_m = v114.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v114 = v114.convertToRGB32(interlaced=false, matrix="PC.709")

    v114 = v114.ExInpaint(mask = v114_m)
    v114 = v114.convertToYV24(interlaced=false, matrix="PC.709")

    v114_m = v114_m.convertToYV24(interlaced=false, matrix="PC.709")
    v114_m = v114_m.gaussResize(v114.width/8, v114.height/8).gaussResize(v114.width, v114.height)
    v114b = v114.gaussResize(v114.width/16, v114.height/16).gaussResize(v114.width, v114.height)
    v114 = v114o.mt_merge(v114b, v114_m, luma = true)
}
else
{
    flip = false
    if (v114_angle < 0)
    {
        v114 = v114.flipHorizontal()
        v114_angle = -v114_angle
        flip = true
    }

    v114 = v114.rotate(-v114_angle)
    v114 = v114.fill_wedges(a = v114_angle)

    v114o = v114
    if (flip)
    {
        v114_m = v114.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v114_m = v114.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v114_m = v114.prepare_solid_mask(w = 170, h = 120)
        v114 = v114.convertToRGB32(interlaced=false, matrix="PC.709")
        v114 = v114.ExInpaint(mask = v114_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v114 = v114.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v114_m = v114_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v114_m = v114_m.gaussResize(v114.width/8, v114.height/8).gaussResize(v114.width, v114.height)
    v114b = v114.gaussResize(v114.width/16, v114.height/16).gaussResize(v114.width, v114.height)
    v114 = v114o.mt_merge(v114b, v114_m, luma = true)
    if (flip)
    {
        v114 = v114.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v114_m = v114_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v114_m = v114_m.gaussResize(vv114.width/8, v114.height/8).gaussResize(v114.width, v114.height)
    v114_129 = v114.trim(129, -1)
    v114 = v114.trim(0, 129) + v114.trim(130, 138).mt_merge(v114_129.loop(10), v114_m, luma = true) + v114.trim(139, 0)
*/
    #v114 = v114.crop(78, 0, 0, -56)#.adjustBorders
}

v114 = v114.audioDub(va)

last = v114#.hist_levels
prefetch

