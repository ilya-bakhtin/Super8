import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v134, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v134.audioDub(va).prefetch
}

v134o = v134
#v134 = v134.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v134 = v134.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v134o.interleave(v134).prefetch
return v134.audioDub(va).prefetch

if (!varExist("v134_angle"))
{
    v134o = v134

    v134_m = v134.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v134 = v134.convertToRGB32(interlaced=false, matrix="PC.709")

    v134 = v134.ExInpaint(mask = v134_m)
    v134 = v134.convertToYV24(interlaced=false, matrix="PC.709")

    v134_m = v134_m.convertToYV24(interlaced=false, matrix="PC.709")
    v134_m = v134_m.gaussResize(v134.width/8, v134.height/8).gaussResize(v134.width, v134.height)
    v134b = v134.gaussResize(v134.width/16, v134.height/16).gaussResize(v134.width, v134.height)
    v134 = v134o.mt_merge(v134b, v134_m, luma = true)
}
else
{
    flip = false
    if (v134_angle < 0)
    {
        v134 = v134.flipHorizontal()
        v134_angle = -v134_angle
        flip = true
    }

    v134 = v134.rotate(-v134_angle)
    v134 = v134.fill_wedges(a = v134_angle)

    v134o = v134
    if (flip)
    {
        v134_m = v134.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v134_m = v134.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v134_m = v134.prepare_solid_mask(w = 170, h = 120)
        v134 = v134.convertToRGB32(interlaced=false, matrix="PC.709")
        v134 = v134.ExInpaint(mask = v134_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v134 = v134.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v134_m = v134_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v134_m = v134_m.gaussResize(v134.width/8, v134.height/8).gaussResize(v134.width, v134.height)
    v134b = v134.gaussResize(v134.width/16, v134.height/16).gaussResize(v134.width, v134.height)
    v134 = v134o.mt_merge(v134b, v134_m, luma = true)
    if (flip)
    {
        v134 = v134.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v134_m = v134_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v134_m = v134_m.gaussResize(vv134.width/8, v134.height/8).gaussResize(v134.width, v134.height)
    v134_129 = v134.trim(129, -1)
    v134 = v134.trim(0, 129) + v134.trim(130, 138).mt_merge(v134_129.loop(10), v134_m, luma = true) + v134.trim(139, 0)
*/
    #v134 = v134.crop(78, 0, 0, -56)#.adjustBorders
}

v134 = v134.audioDub(va)

last = v134#.hist_levels
prefetch

