import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v15 = v15.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 235, autolevel = false)
v15 = v15.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v15_angle"))
{
    v15 = v15.fill_wedges(a = v15_angle)

    v15o = v15
    v15_m = v15.prepare_solid_mask(w = 160, h = 170)
    v15 = v15.convertToRGB32(interlaced=false, matrix="PC.709")
    v15 = v15.ExInpaint(mask = v15_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v15 = v15.convertToYV24(interlaced=false, matrix="PC.709")

    v15_m = v15_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v15_m = v15_m.gaussResize(v15.width/8, v15.height/8).gaussResize(v15.width, v15.height)
    v15b = v15.gaussResize(v15.width/16, v15.height/16).gaussResize(v15.width, v15.height)
    v15 = v15o.mt_merge(v15b, v15_m, luma = true)
/*
    # 129 -> 130..138
    v15_m = v15_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v15_m = v15_m.gaussResize(vv15.width/8, v15.height/8).gaussResize(v15.width, v15.height)
    v15_129 = v15.trim(129, -1)
    v15 = v15.trim(0, 129) + v15.trim(130, 138).mt_merge(v15_129.loop(10), v15_m, luma = true) + v15.trim(139, 0)
*/
    #v15 = v15.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v15, audio_rate = 48000, channels = 2).killVideo
v15 = v15.audioDub(va)

last = v15#.hist_levels
prefetch

