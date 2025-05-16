import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v137, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v137.audioDub(va).prefetch
}

v137o = v137
#v137 = v137.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v137 = v137.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v137o.interleave(v137).prefetch
return v137.audioDub(va).prefetch

if (!varExist("v137_angle"))
{
    v137o = v137

    v137_m = v137.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v137 = v137.convertToRGB32(interlaced=false, matrix="PC.709")

    v137 = v137.ExInpaint(mask = v137_m)
    v137 = v137.convertToYV24(interlaced=false, matrix="PC.709")

    v137_m = v137_m.convertToYV24(interlaced=false, matrix="PC.709")
    v137_m = v137_m.gaussResize(v137.width/8, v137.height/8).gaussResize(v137.width, v137.height)
    v137b = v137.gaussResize(v137.width/16, v137.height/16).gaussResize(v137.width, v137.height)
    v137 = v137o.mt_merge(v137b, v137_m, luma = true)
}
else
{
    flip = false
    if (v137_angle < 0)
    {
        v137 = v137.flipHorizontal()
        v137_angle = -v137_angle
        flip = true
    }

    v137 = v137.rotate(-v137_angle)
    v137 = v137.fill_wedges(a = v137_angle)

    v137o = v137
    if (flip)
    {
        v137_m = v137.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v137_m = v137.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v137_m = v137.prepare_solid_mask(w = 170, h = 120)
        v137 = v137.convertToRGB32(interlaced=false, matrix="PC.709")
        v137 = v137.ExInpaint(mask = v137_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v137 = v137.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v137_m = v137_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v137_m = v137_m.gaussResize(v137.width/8, v137.height/8).gaussResize(v137.width, v137.height)
    v137b = v137.gaussResize(v137.width/16, v137.height/16).gaussResize(v137.width, v137.height)
    v137 = v137o.mt_merge(v137b, v137_m, luma = true)
    if (flip)
    {
        v137 = v137.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v137_m = v137_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v137_m = v137_m.gaussResize(vv137.width/8, v137.height/8).gaussResize(v137.width, v137.height)
    v137_129 = v137.trim(129, -1)
    v137 = v137.trim(0, 129) + v137.trim(130, 138).mt_merge(v137_129.loop(10), v137_m, luma = true) + v137.trim(139, 0)
*/
    #v137 = v137.crop(78, 0, 0, -56)#.adjustBorders
}

v137 = v137.audioDub(va)

last = v137#.hist_levels
prefetch

