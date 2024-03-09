import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v23 = v23.autolevels(output_low = 0, output_high = 255, input_low = 100, input_high = 230, autolevel = false)
v23 = v23.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v23_angle"))
{
    v23 = v23.fill_wedges(a = v23_angle)

    v23o = v23
    v23_m = v23.prepare_solid_mask(w = 160, h = 170)
    v23 = v23.convertToRGB32(interlaced=false, matrix="PC.709")
    v23 = v23.ExInpaint(mask = v23_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v23 = v23.convertToYV24(interlaced=false, matrix="PC.709")

    v23_m = v23_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v23_m = v23_m.gaussResize(v23.width/8, v23.height/8).gaussResize(v23.width, v23.height)
    v23b = v23.gaussResize(v23.width/16, v23.height/16).gaussResize(v23.width, v23.height)
    v23 = v23o.mt_merge(v23b, v23_m, luma = true)
/*
    # 129 -> 130..138
    v23_m = v23_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v23_m = v23_m.gaussResize(vv23.width/8, v23.height/8).gaussResize(v23.width, v23.height)
    v23_129 = v23.trim(129, -1)
    v23 = v23.trim(0, 129) + v23.trim(130, 138).mt_merge(v23_129.loop(10), v23_m, luma = true) + v23.trim(139, 0)
*/
    #v23 = v23.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v23, audio_rate = 48000, channels = 2).killVideo
v23 = v23.audioDub(va)

last = v23#.hist_levels
prefetch

