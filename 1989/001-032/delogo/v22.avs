import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v22 = v22.autolevels(output_low = 0, output_high = 255, input_low = 70, input_high = 230, autolevel = false)
v22 = v22.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v22_angle"))
{
    v22 = v22.fill_wedges(a = v22_angle)

    v22o = v22
    v22_m = v22.prepare_solid_mask(w = 160, h = 170)
    v22 = v22.convertToRGB32(interlaced=false, matrix="PC.709")
    v22 = v22.ExInpaint(mask = v22_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v22 = v22.convertToYV24(interlaced=false, matrix="PC.709")

    v22_m = v22_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v22_m = v22_m.gaussResize(v22.width/8, v22.height/8).gaussResize(v22.width, v22.height)
    v22b = v22.gaussResize(v22.width/16, v22.height/16).gaussResize(v22.width, v22.height)
    v22 = v22o.mt_merge(v22b, v22_m, luma = true)
/*
    # 129 -> 130..138
    v22_m = v22_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v22_m = v22_m.gaussResize(vv22.width/8, v22.height/8).gaussResize(v22.width, v22.height)
    v22_129 = v22.trim(129, -1)
    v22 = v22.trim(0, 129) + v22.trim(130, 138).mt_merge(v22_129.loop(10), v22_m, luma = true) + v22.trim(139, 0)
*/
    #v22 = v22.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v22, audio_rate = 48000, channels = 2).killVideo
v22 = v22.audioDub(va)

last = v22#.hist_levels
prefetch

