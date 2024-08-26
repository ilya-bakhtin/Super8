import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v113 = v113.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v113 = v113.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v113_angle"))
{
    flip = false
    if (v113_angle < 0)
    {
        v113 = v113.flipHorizontal()
        v113_angle = -v113_angle
        flip = true
    }

    v113 = v113.rotate(-v113_angle)
    v113 = v113.fill_wedges(a = v113_angle)

    v113o = v113
    if (flip)
    {
        v113_m = v113.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v113_m = v113.prepare_solid_mask(w = 160, h = 170)
        v113 = v113.convertToRGB32(interlaced=false, matrix="PC.709")
        v113 = v113.ExInpaint(mask = v113_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v113 = v113.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v113_m = v113_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v113_m = v113_m.gaussResize(v113.width/8, v113.height/8).gaussResize(v113.width, v113.height)
    v113b = v113.gaussResize(v113.width/16, v113.height/16).gaussResize(v113.width, v113.height)
    v113 = v113o.mt_merge(v113b, v113_m, luma = true)
    if (flip)
    {
        v113 = v113.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v113_m = v113_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v113_m = v113_m.gaussResize(vv113.width/8, v113.height/8).gaussResize(v113.width, v113.height)
    v113_129 = v113.trim(129, -1)
    v113 = v113.trim(0, 129) + v113.trim(130, 138).mt_merge(v113_129.loop(10), v113_m, luma = true) + v113.trim(139, 0)
*/
    #v113 = v113.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v113, audio_rate = 48000, channels = 2).killVideo
v113 = v113.audioDub(va)

last = v113#.hist_levels
prefetch

