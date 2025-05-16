import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v124, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v124.audioDub(va).prefetch
}

v124o = v124
#v124 = v124.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v124 = v124.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v124o.interleave(v124).prefetch
return v124.audioDub(va).prefetch

if (!varExist("v124_angle"))
{
    v124o = v124

    v124_m = v124.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v124 = v124.convertToRGB32(interlaced=false, matrix="PC.709")

    v124 = v124.ExInpaint(mask = v124_m)
    v124 = v124.convertToYV24(interlaced=false, matrix="PC.709")

    v124_m = v124_m.convertToYV24(interlaced=false, matrix="PC.709")
    v124_m = v124_m.gaussResize(v124.width/8, v124.height/8).gaussResize(v124.width, v124.height)
    v124b = v124.gaussResize(v124.width/16, v124.height/16).gaussResize(v124.width, v124.height)
    v124 = v124o.mt_merge(v124b, v124_m, luma = true)
}
else
{
    flip = false
    if (v124_angle < 0)
    {
        v124 = v124.flipHorizontal()
        v124_angle = -v124_angle
        flip = true
    }

    v124 = v124.rotate(-v124_angle)
    v124 = v124.fill_wedges(a = v124_angle)

    v124o = v124
    if (flip)
    {
        v124_m = v124.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v124_m = v124.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v124_m = v124.prepare_solid_mask(w = 170, h = 120)
        v124 = v124.convertToRGB32(interlaced=false, matrix="PC.709")
        v124 = v124.ExInpaint(mask = v124_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v124 = v124.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v124_m = v124_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v124_m = v124_m.gaussResize(v124.width/8, v124.height/8).gaussResize(v124.width, v124.height)
    v124b = v124.gaussResize(v124.width/16, v124.height/16).gaussResize(v124.width, v124.height)
    v124 = v124o.mt_merge(v124b, v124_m, luma = true)
    if (flip)
    {
        v124 = v124.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v124_m = v124_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v124_m = v124_m.gaussResize(vv124.width/8, v124.height/8).gaussResize(v124.width, v124.height)
    v124_129 = v124.trim(129, -1)
    v124 = v124.trim(0, 129) + v124.trim(130, 138).mt_merge(v124_129.loop(10), v124_m, luma = true) + v124.trim(139, 0)
*/
    #v124 = v124.crop(78, 0, 0, -56)#.adjustBorders
}

v124 = v124.audioDub(va)

last = v124#.hist_levels
prefetch

