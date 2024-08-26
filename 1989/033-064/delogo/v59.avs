import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v59 = v59.autolevels(output_low = 0, output_high = 255, input_low = 70, input_high = 230, autolevel = false)
v59 = v59.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v59_angle"))
{
    v59 = v59.fill_wedges(a = v59_angle)

    v59o = v59
    v59_m = v59.prepare_solid_mask(w = 160, h = 170)
    v59 = v59.convertToRGB32(interlaced=false, matrix="PC.709")
    v59 = v59.ExInpaint(mask = v59_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v59 = v59.convertToYV24(interlaced=false, matrix="PC.709")

    v59_m = v59_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v59_m = v59_m.gaussResize(v59.width/8, v59.height/8).gaussResize(v59.width, v59.height)
    v59b = v59.gaussResize(v59.width/16, v59.height/16).gaussResize(v59.width, v59.height)
    v59 = v59o.mt_merge(v59b, v59_m, luma = true)
/*
    # 129 -> 130..138
    v59_m = v59_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v59_m = v59_m.gaussResize(vv59.width/8, v59.height/8).gaussResize(v59.width, v59.height)
    v59_129 = v59.trim(129, -1)
    v59 = v59.trim(0, 129) + v59.trim(130, 138).mt_merge(v59_129.loop(10), v59_m, luma = true) + v59.trim(139, 0)
*/
    #v59 = v59.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v59, audio_rate = 48000, channels = 2).killVideo
v59 = v59.audioDub(va)

#last = v59.histogram
last = v59#.hist_levels
prefetch
