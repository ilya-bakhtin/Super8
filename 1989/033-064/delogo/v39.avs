import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v39 = v39.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v39 = v39.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v39_angle"))
{
    v39 = v39.fill_wedges(a = v39_angle)

    v39o = v39
    v39_m = v39.prepare_solid_mask(w = 160, h = 170)
    v39 = v39.convertToRGB32(interlaced=false, matrix="PC.709")
    v39 = v39.ExInpaint(mask = v39_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v39 = v39.convertToYV24(interlaced=false, matrix="PC.709")

    v39_m = v39_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v39_m = v39_m.gaussResize(v39.width/8, v39.height/8).gaussResize(v39.width, v39.height)
    v39b = v39.gaussResize(v39.width/16, v39.height/16).gaussResize(v39.width, v39.height)
    v39 = v39o.mt_merge(v39b, v39_m, luma = true)
/*
    # 129 -> 130..138
    v39_m = v39_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v39_m = v39_m.gaussResize(vv39.width/8, v39.height/8).gaussResize(v39.width, v39.height)
    v39_129 = v39.trim(129, -1)
    v39 = v39.trim(0, 129) + v39.trim(130, 138).mt_merge(v39_129.loop(10), v39_m, luma = true) + v39.trim(139, 0)
*/
    #v39 = v39.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v39, audio_rate = 48000, channels = 2).killVideo
v39 = v39.audioDub(va)

last = v39#.hist_levels
prefetch

