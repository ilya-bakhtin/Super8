import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v5 = v5.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v5 = v5.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v5_angle"))
{
    v5o = v5

    v5_m = v5.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v5 = v5.convertToRGB32(interlaced=false, matrix="PC.709")

    v5 = v5.ExInpaint(mask = v5_m)
    v5 = v5.convertToYV24(interlaced=false, matrix="PC.709")

    v5_m = v5_m.convertToYV24(interlaced=false, matrix="PC.709")
    v5_m = v5_m.gaussResize(v5.width/8, v5.height/8).gaussResize(v5.width, v5.height)
    v5b = v5.gaussResize(v5.width/16, v5.height/16).gaussResize(v5.width, v5.height)
    v5 = v5o.mt_merge(v5b, v5_m, luma = true)
}
else
{
    flip = false
    if (v5_angle < 0)
    {
        v5 = v5.flipHorizontal()
        v5_angle = -v5_angle
        flip = true
    }

    v5 = v5.rotate(-v5_angle)
    v5 = v5.fill_wedges(a = v5_angle)

    v5o = v5
    if (flip)
    {
        v5_m = v5.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v5_m = v5.prepare_solid_mask(w = 170, h = 120)
        v5 = v5.convertToRGB32(interlaced=false, matrix="PC.709")
        v5 = v5.ExInpaint(mask = v5_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v5 = v5.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v5_m = v5_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v5_m = v5_m.gaussResize(v5.width/8, v5.height/8).gaussResize(v5.width, v5.height)
    v5b = v5.gaussResize(v5.width/16, v5.height/16).gaussResize(v5.width, v5.height)
    v5 = v5o.mt_merge(v5b, v5_m, luma = true)
    if (flip)
    {
        v5 = v5.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v5_m = v5_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v5_m = v5_m.gaussResize(vv5.width/8, v5.height/8).gaussResize(v5.width, v5.height)
    v5_129 = v5.trim(129, -1)
    v5 = v5.trim(0, 129) + v5.trim(130, 138).mt_merge(v5_129.loop(10), v5_m, luma = true) + v5.trim(139, 0)
*/
    #v5 = v5.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v5, audio_rate = 48000, channels = 2).killVideo
v5 = v5.audioDub(va)

last = v5#.hist_levels
prefetch

