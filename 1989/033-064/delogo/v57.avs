import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v57 = v57.autolevels(output_low = 0, output_high = 255, input_low = 100, input_high = 230, autolevel = false)
v57 = v57.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v57_angle"))
{
    v57 = v57.fill_wedges(a = v57_angle)

    v57o = v57
    v57_m = v57.prepare_solid_mask(w = 160, h = 170)
    v57 = v57.convertToRGB32(interlaced=false, matrix="PC.709")
    v57 = v57.ExInpaint(mask = v57_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v57 = v57.convertToYV24(interlaced=false, matrix="PC.709")

    v57_m = v57_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v57_m = v57_m.gaussResize(v57.width/8, v57.height/8).gaussResize(v57.width, v57.height)
    v57b = v57.gaussResize(v57.width/16, v57.height/16).gaussResize(v57.width, v57.height)
    v57 = v57o.mt_merge(v57b, v57_m, luma = true)
/*
    # 129 -> 130..138
    v57_m = v57_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v57_m = v57_m.gaussResize(vv57.width/8, v57.height/8).gaussResize(v57.width, v57.height)
    v57_129 = v57.trim(129, -1)
    v57 = v57.trim(0, 129) + v57.trim(130, 138).mt_merge(v57_129.loop(10), v57_m, luma = true) + v57.trim(139, 0)
*/
    #v57 = v57.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v57, audio_rate = 48000, channels = 2).killVideo
v57 = v57.audioDub(va)

last = v57#.hist_levels
prefetch

