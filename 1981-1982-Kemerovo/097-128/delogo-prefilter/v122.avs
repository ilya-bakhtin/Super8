import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v122, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v122.audioDub(va).prefetch
}

v122o = v122
#v122 = v122.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v122 = v122.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v122o.interleave(v122).prefetch
return v122.audioDub(va).prefetch

if (!varExist("v122_angle"))
{
    v122o = v122

    v122_m = v122.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v122 = v122.convertToRGB32(interlaced=false, matrix="PC.709")

    v122 = v122.ExInpaint(mask = v122_m)
    v122 = v122.convertToYV24(interlaced=false, matrix="PC.709")

    v122_m = v122_m.convertToYV24(interlaced=false, matrix="PC.709")
    v122_m = v122_m.gaussResize(v122.width/8, v122.height/8).gaussResize(v122.width, v122.height)
    v122b = v122.gaussResize(v122.width/16, v122.height/16).gaussResize(v122.width, v122.height)
    v122 = v122o.mt_merge(v122b, v122_m, luma = true)
}
else
{
    flip = false
    if (v122_angle < 0)
    {
        v122 = v122.flipHorizontal()
        v122_angle = -v122_angle
        flip = true
    }

    v122 = v122.rotate(-v122_angle)
    v122 = v122.fill_wedges(a = v122_angle)

    v122o = v122
    if (flip)
    {
        v122_m = v122.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v122_m = v122.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v122_m = v122.prepare_solid_mask(w = 170, h = 120)
        v122 = v122.convertToRGB32(interlaced=false, matrix="PC.709")
        v122 = v122.ExInpaint(mask = v122_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v122 = v122.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v122_m = v122_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v122_m = v122_m.gaussResize(v122.width/8, v122.height/8).gaussResize(v122.width, v122.height)
    v122b = v122.gaussResize(v122.width/16, v122.height/16).gaussResize(v122.width, v122.height)
    v122 = v122o.mt_merge(v122b, v122_m, luma = true)
    if (flip)
    {
        v122 = v122.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v122_m = v122_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v122_m = v122_m.gaussResize(vv122.width/8, v122.height/8).gaussResize(v122.width, v122.height)
    v122_129 = v122.trim(129, -1)
    v122 = v122.trim(0, 129) + v122.trim(130, 138).mt_merge(v122_129.loop(10), v122_m, luma = true) + v122.trim(139, 0)
*/
    #v122 = v122.crop(78, 0, 0, -56)#.adjustBorders
}

v122 = v122.audioDub(va)

last = v122#.hist_levels
prefetch

