import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v47 = v47.autolevels(output_low = 0, output_high = 255, input_low = 60, input_high = 220, autolevel = false)
v47 = v47.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v47_angle"))
{
    v47 = v47.fill_wedges(a = v47_angle)

    v47o = v47
    v47_m = v47.prepare_solid_mask(w = 160, h = 170)
    v47 = v47.convertToRGB32(interlaced=false, matrix="PC.709")
    v47 = v47.ExInpaint(mask = v47_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v47 = v47.convertToYV24(interlaced=false, matrix="PC.709")

    v47_m = v47_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v47_m = v47_m.gaussResize(v47.width/8, v47.height/8).gaussResize(v47.width, v47.height)
    v47b = v47.gaussResize(v47.width/16, v47.height/16).gaussResize(v47.width, v47.height)
    v47 = v47o.mt_merge(v47b, v47_m, luma = true)
/*
    # 129 -> 130..138
    v47_m = v47_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v47_m = v47_m.gaussResize(vv47.width/8, v47.height/8).gaussResize(v47.width, v47.height)
    v47_129 = v47.trim(129, -1)
    v47 = v47.trim(0, 129) + v47.trim(130, 138).mt_merge(v47_129.loop(10), v47_m, luma = true) + v47.trim(139, 0)
*/
    #v47 = v47.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v47, audio_rate = 48000, channels = 2).killVideo
v47 = v47.audioDub(va)

last = v47#.histogram#hist_levels
prefetch

