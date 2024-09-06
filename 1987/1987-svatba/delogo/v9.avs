import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v9 = v9.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v9 = v9.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v9_angle"))
{
    v9o = v9

    v9_m = v9.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v9 = v9.convertToRGB32(interlaced=false, matrix="PC.709")

    v9 = v9.ExInpaint(mask = v9_m)
    v9 = v9.convertToYV24(interlaced=false, matrix="PC.709")

    v9_m = v9_m.convertToYV24(interlaced=false, matrix="PC.709")
    v9_m = v9_m.gaussResize(v9.width/8, v9.height/8).gaussResize(v9.width, v9.height)
    v9b = v9.gaussResize(v9.width/16, v9.height/16).gaussResize(v9.width, v9.height)
    v9 = v9o.mt_merge(v9b, v9_m, luma = true)
}
else
{
    flip = false
    if (v9_angle < 0)
    {
        v9 = v9.flipHorizontal()
        v9_angle = -v9_angle
        flip = true
    }

    v9 = v9.rotate(-v9_angle)
    v9 = v9.fill_wedges(a = v9_angle)

    v9o = v9
    if (flip)
    {
        v9_m = v9.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v9_m = v9.prepare_solid_mask(w = 170, h = 120)
        v9 = v9.convertToRGB32(interlaced=false, matrix="PC.709")
        v9 = v9.ExInpaint(mask = v9_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v9 = v9.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v9_m = v9_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v9_m = v9_m.gaussResize(v9.width/8, v9.height/8).gaussResize(v9.width, v9.height)
    v9b = v9.gaussResize(v9.width/16, v9.height/16).gaussResize(v9.width, v9.height)
    v9 = v9o.mt_merge(v9b, v9_m, luma = true)
    if (flip)
    {
        v9 = v9.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v9_m = v9_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v9_m = v9_m.gaussResize(vv9.width/8, v9.height/8).gaussResize(v9.width, v9.height)
    v9_129 = v9.trim(129, -1)
    v9 = v9.trim(0, 129) + v9.trim(130, 138).mt_merge(v9_129.loop(10), v9_m, luma = true) + v9.trim(139, 0)
*/
    #v9 = v9.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v9, audio_rate = 48000, channels = 2).killVideo
v9 = v9.audioDub(va)

last = v9#.hist_levels
prefetch

