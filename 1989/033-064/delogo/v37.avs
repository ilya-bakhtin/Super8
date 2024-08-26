import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v37 = v37.autolevels(output_low = 0, output_high = 255, input_low = 70, input_high = 225, autolevel = false)
v37 = v37.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v37_angle"))
{
    v37 = v37.rotate(-v37_angle)
    v37 = v37.fill_wedges(a = v37_angle)

    v37o = v37
    v37_m = v37.prepare_solid_mask(w = 20, h = 20)
    v37 = v37.convertToRGB32(interlaced=false, matrix="PC.709")
    v37 = v37.ExInpaint(mask = v37_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v37 = v37.convertToYV24(interlaced=false, matrix="PC.709")

    v37_m = v37_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v37_m = v37_m.gaussResize(v37.width/8, v37.height/8).gaussResize(v37.width, v37.height)
    v37b = v37.gaussResize(v37.width/16, v37.height/16).gaussResize(v37.width, v37.height)
    v37 = v37o.mt_merge(v37b, v37_m, luma = true)
/*
    # 129 -> 130..138
    v37_m = v37_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v37_m = v37_m.gaussResize(vv37.width/8, v37.height/8).gaussResize(v37.width, v37.height)
    v37_129 = v37.trim(129, -1)
    v37 = v37.trim(0, 129) + v37.trim(130, 138).mt_merge(v37_129.loop(10), v37_m, luma = true) + v37.trim(139, 0)
*/
    v37 = v37.crop(78, 0, 0, -54)#.adjustBorders
}

va = BlankClip(v37, audio_rate = 48000, channels = 2).killVideo
v37 = v37.audioDub(va)

last = v37#.hist_levels
prefetch

