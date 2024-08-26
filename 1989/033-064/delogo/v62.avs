import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v62 = v62.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v62 = v62.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v62_angle"))
{
    v62 = v62.fill_wedges(a = v62_angle)

    v62o = v62
    v62_m = v62.prepare_solid_mask(w = 160, h = 170)
    v62 = v62.convertToRGB32(interlaced=false, matrix="PC.709")
    v62 = v62.ExInpaint(mask = v62_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v62 = v62.convertToYV24(interlaced=false, matrix="PC.709")

    v62_m = v62_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v62_m = v62_m.gaussResize(v62.width/8, v62.height/8).gaussResize(v62.width, v62.height)
    v62b = v62.gaussResize(v62.width/16, v62.height/16).gaussResize(v62.width, v62.height)
    v62 = v62o.mt_merge(v62b, v62_m, luma = true)
/*
    # 129 -> 130..138
    v62_m = v62_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v62_m = v62_m.gaussResize(vv62.width/8, v62.height/8).gaussResize(v62.width, v62.height)
    v62_129 = v62.trim(129, -1)
    v62 = v62.trim(0, 129) + v62.trim(130, 138).mt_merge(v62_129.loop(10), v62_m, luma = true) + v62.trim(139, 0)
*/
    #v62 = v62.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v62, audio_rate = 48000, channels = 2).killVideo
v62 = v62.audioDub(va)

last = v62#.histogram#.hist_levels
prefetch

