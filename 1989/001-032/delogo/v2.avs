import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v2 = v2.autolevels(output_low = 0, output_high = 255, input_low = 100, input_high = 220, autolevel = false)
v2 = v2.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v2_angle"))
{
    v2 = v2.fill_wedges(a = v2_angle)

    v2o = v2
    v2_m = v2.prepare_solid_mask(w = 160, h = 170)
    v2 = v2.convertToRGB32(interlaced=false, matrix="PC.709")
    v2 = v2.ExInpaint(mask = v2_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v2 = v2.convertToYV24(interlaced=false, matrix="PC.709")

    v2_m = v2_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v2_m = v2_m.gaussResize(v2.width/8, v2.height/8).gaussResize(v2.width, v2.height)
    v2b = v2.gaussResize(v2.width/16, v2.height/16).gaussResize(v2.width, v2.height)
    v2 = v2o.mt_merge(v2b, v2_m, luma = true)
/*
    # 129 -> 130..138
    v2_m = v2_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v2_m = v2_m.gaussResize(vv2.width/8, v2.height/8).gaussResize(v2.width, v2.height)
    v2_129 = v2.trim(129, -1)
    v2 = v2.trim(0, 129) + v2.trim(130, 138).mt_merge(v2_129.loop(10), v2_m, luma = true) + v2.trim(139, 0)
*/
    #v2 = v2.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v2, audio_rate = 48000, channels = 2).killVideo
v2 = v2.audioDub(va)

last = v2#.hist_levels
prefetch

