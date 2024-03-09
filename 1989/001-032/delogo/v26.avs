import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v26 = v26.autolevels(output_low = 0, output_high = 255, input_low = 50, input_high = 230, autolevel = false)
v26 = v26.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v26_angle"))
{
    v26 = v26.rotate(-v26_angle)
    v26 = v26.fill_wedges(a = v26_angle)

    v26o = v26
    v26_m = v26.prepare_solid_mask(w = 60, h = 100)
    v26 = v26.convertToRGB32(interlaced=false, matrix="PC.709")
    v26 = v26.ExInpaint(mask = v26_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v26 = v26.convertToYV24(interlaced=false, matrix="PC.709")

    v26_m = v26_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v26_m = v26_m.gaussResize(v26.width/8, v26.height/8).gaussResize(v26.width, v26.height)
    v26b = v26.gaussResize(v26.width/16, v26.height/16).gaussResize(v26.width, v26.height)
    v26 = v26o.mt_merge(v26b, v26_m, luma = true)
/*
    # 129 -> 130..138
    v26_m = v26_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v26_m = v26_m.gaussResize(vv26.width/8, v26.height/8).gaussResize(v26.width, v26.height)
    v26_129 = v26.trim(129, -1)
    v26 = v26.trim(0, 129) + v26.trim(130, 138).mt_merge(v26_129.loop(10), v26_m, luma = true) + v26.trim(139, 0)
*/
    v26 = v26.crop(78, 0, 0, -54)#.adjustBorders
}

va = BlankClip(v26, audio_rate = 48000, channels = 2).killVideo
v26 = v26.audioDub(va)

last = v26#.hist_levels
prefetch

