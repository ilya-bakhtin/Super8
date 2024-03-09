import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v17 = v17.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v17 = v17.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v17_angle"))
{
    v17 = v17.fill_wedges(a = v17_angle)

    v17o = v17
    v17_m = v17.prepare_solid_mask(w = 160, h = 170)
    v17 = v17.convertToRGB32(interlaced=false, matrix="PC.709")
    v17 = v17.ExInpaint(mask = v17_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v17 = v17.convertToYV24(interlaced=false, matrix="PC.709")

    v17_m = v17_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v17_m = v17_m.gaussResize(v17.width/8, v17.height/8).gaussResize(v17.width, v17.height)
    v17b = v17.gaussResize(v17.width/16, v17.height/16).gaussResize(v17.width, v17.height)
    v17 = v17o.mt_merge(v17b, v17_m, luma = true)
/*
    # 129 -> 130..138
    v17_m = v17_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v17_m = v17_m.gaussResize(vv17.width/8, v17.height/8).gaussResize(v17.width, v17.height)
    v17_129 = v17.trim(129, -1)
    v17 = v17.trim(0, 129) + v17.trim(130, 138).mt_merge(v17_129.loop(10), v17_m, luma = true) + v17.trim(139, 0)
*/
    #v17 = v17.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

last = v17#.hist_levels
prefetch

