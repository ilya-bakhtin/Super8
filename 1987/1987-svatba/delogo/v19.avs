import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v19 = v19.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v19 = v19.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v19_angle"))
{
    v19o = v19

    v19_m = v19.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v19 = v19.convertToRGB32(interlaced=false, matrix="PC.709")

    v19 = v19.ExInpaint(mask = v19_m)
    v19 = v19.convertToYV24(interlaced=false, matrix="PC.709")

    v19_m = v19_m.convertToYV24(interlaced=false, matrix="PC.709")
    v19_m = v19_m.gaussResize(v19.width/8, v19.height/8).gaussResize(v19.width, v19.height)
    v19b = v19.gaussResize(v19.width/16, v19.height/16).gaussResize(v19.width, v19.height)
    v19 = v19o.mt_merge(v19b, v19_m, luma = true)
}
else
{
    flip = false
    if (v19_angle < 0)
    {
        v19 = v19.flipHorizontal()
        v19_angle = -v19_angle
        flip = true
    }

    v19 = v19.rotate(-v19_angle)
    v19 = v19.fill_wedges(a = v19_angle)

    v19o = v19
    if (flip)
    {
        v19_m = v19.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v19_m = v19.prepare_solid_mask(w = 170, h = 120)
        v19 = v19.convertToRGB32(interlaced=false, matrix="PC.709")
        v19 = v19.ExInpaint(mask = v19_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v19 = v19.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v19_m = v19_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v19_m = v19_m.gaussResize(v19.width/8, v19.height/8).gaussResize(v19.width, v19.height)
    v19b = v19.gaussResize(v19.width/16, v19.height/16).gaussResize(v19.width, v19.height)
    v19 = v19o.mt_merge(v19b, v19_m, luma = true)
    if (flip)
    {
        v19 = v19.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v19_m = v19_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v19_m = v19_m.gaussResize(vv19.width/8, v19.height/8).gaussResize(v19.width, v19.height)
    v19_129 = v19.trim(129, -1)
    v19 = v19.trim(0, 129) + v19.trim(130, 138).mt_merge(v19_129.loop(10), v19_m, luma = true) + v19.trim(139, 0)
*/
    #v19 = v19.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v19, audio_rate = 48000, channels = 2).killVideo
v19 = v19.audioDub(va)

last = v19#.hist_levels
prefetch

