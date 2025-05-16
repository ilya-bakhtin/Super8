import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v66 = v66.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v66 = v66.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v66_angle"))
{
    v66o = v66

    v66_m = v66.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v66 = v66.convertToRGB32(interlaced=false, matrix="PC.709")

    v66 = v66.ExInpaint(mask = v66_m)
    v66 = v66.convertToYV24(interlaced=false, matrix="PC.709")

    v66_m = v66_m.convertToYV24(interlaced=false, matrix="PC.709")
    v66_m = v66_m.gaussResize(v66.width/8, v66.height/8).gaussResize(v66.width, v66.height)
    v66b = v66.gaussResize(v66.width/16, v66.height/16).gaussResize(v66.width, v66.height)
    v66 = v66o.mt_merge(v66b, v66_m, luma = true)
}
else
{
    flip = false
    if (v66_angle < 0)
    {
        v66 = v66.flipHorizontal()
        v66_angle = -v66_angle
        flip = true
    }

    v66 = v66.rotate(-v66_angle)
    v66 = v66.fill_wedges(a = v66_angle)

    v66o = v66
    if (flip)
    {
        v66_m = v66.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v66_m = v66.prepare_solid_mask(w = 170, h = 120)
        v66 = v66.convertToRGB32(interlaced=false, matrix="PC.709")
        v66 = v66.ExInpaint(mask = v66_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v66 = v66.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v66_m = v66_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v66_m = v66_m.gaussResize(v66.width/8, v66.height/8).gaussResize(v66.width, v66.height)
    v66b = v66.gaussResize(v66.width/16, v66.height/16).gaussResize(v66.width, v66.height)
    v66 = v66o.mt_merge(v66b, v66_m, luma = true)
    if (flip)
    {
        v66 = v66.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v66_m = v66_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v66_m = v66_m.gaussResize(vv66.width/8, v66.height/8).gaussResize(v66.width, v66.height)
    v66_129 = v66.trim(129, -1)
    v66 = v66.trim(0, 129) + v66.trim(130, 138).mt_merge(v66_129.loop(10), v66_m, luma = true) + v66.trim(139, 0)
*/
    #v66 = v66.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v66, audio_rate = 48000, channels = 2).killVideo
v66 = v66.audioDub(va)

last = v66#.hist_levels
prefetch

