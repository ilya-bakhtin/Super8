import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v50 = v50.autolevels(output_low = 0, output_high = 255, input_low = 50, input_high = 230, autolevel = false)
v50 = v50.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v50_angle"))
{
    flip = false
    if (v50_angle < 0)
    {
        v50 = v50.flipHorizontal()
        v50_angle = -v50_angle
        flip = true
    }

    v50 = v50.rotate(-v50_angle)
    v50 = v50.fill_wedges(a = v50_angle)

    v50o = v50
    v50_m = v50.trim(0, -1).extractY.expr("0").convertToYV24
/*
    v50_m = v50.prepare_solid_mask(w = 160, h = 170)
    v50 = v50.convertToRGB32(interlaced=false, matrix="PC.709")
    v50 = v50.ExInpaint(mask = v50_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v50 = v50.convertToYV24(interlaced=false, matrix="PC.709")
*/
    v50_m = v50_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v50_m = v50_m.gaussResize(v50.width/8, v50.height/8).gaussResize(v50.width, v50.height)
    v50b = v50.gaussResize(v50.width/16, v50.height/16).gaussResize(v50.width, v50.height)
    v50 = v50o.mt_merge(v50b, v50_m, luma = true)
    if (flip)
    {
        v50 = v50.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v50_m = v50_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v50_m = v50_m.gaussResize(vv50.width/8, v50.height/8).gaussResize(v50.width, v50.height)
    v50_129 = v50.trim(129, -1)
    v50 = v50.trim(0, 129) + v50.trim(130, 138).mt_merge(v50_129.loop(10), v50_m, luma = true) + v50.trim(139, 0)
*/
    v50 = v50.crop(78, 0, 0, -54)#.adjustBorders
}

va = BlankClip(v50, audio_rate = 48000, channels = 2).killVideo
v50 = v50.audioDub(va)

last = v50#.hist_levels
prefetch

