import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

#v63 = v63.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v63 = v63.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v63_angle"))
{
    v63 = v63.fill_wedges(a = v63_angle)

    v63o = v63
    v63_m = v63.prepare_solid_mask(w = 160, h = 170)
    v63 = v63.convertToRGB32(interlaced=false, matrix="PC.709")
    v63 = v63.ExInpaint(mask = v63_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v63 = v63.convertToYV24(interlaced=false, matrix="PC.709")

    v63_m = v63_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v63_m = v63_m.gaussResize(v63.width/8, v63.height/8).gaussResize(v63.width, v63.height)
    v63b = v63.gaussResize(v63.width/16, v63.height/16).gaussResize(v63.width, v63.height)
    v63 = v63o.mt_merge(v63b, v63_m, luma = true)
/*
    # 129 -> 130..138
    v63_m = v63_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v63_m = v63_m.gaussResize(vv63.width/8, v63.height/8).gaussResize(v63.width, v63.height)
    v63_129 = v63.trim(129, -1)
    v63 = v63.trim(0, 129) + v63.trim(130, 138).mt_merge(v63_129.loop(10), v63_m, luma = true) + v63.trim(139, 0)
*/
    #v63 = v63.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v63, audio_rate = 48000, channels = 2).killVideo
v63 = v63.audioDub(va)

last = v63#.hist_levels
prefetch

