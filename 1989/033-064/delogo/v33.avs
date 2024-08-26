import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v33 = v33.autolevels(output_low = 0, output_high = 255, input_low = 100, input_high = 225, autolevel = false)
v33 = v33.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v33_angle"))
{
    v33 = v33.fill_wedges(a = v33_angle)

    v33o = v33
    v33_m = v33.prepare_solid_mask(w = 160, h = 170)
    v33 = v33.convertToRGB32(interlaced=false, matrix="PC.709")
    v33 = v33.ExInpaint(mask = v33_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v33 = v33.convertToYV24(interlaced=false, matrix="PC.709")

    v33_m = v33_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v33_m = v33_m.gaussResize(v33.width/8, v33.height/8).gaussResize(v33.width, v33.height)
    v33b = v33.gaussResize(v33.width/16, v33.height/16).gaussResize(v33.width, v33.height)
    v33 = v33o.mt_merge(v33b, v33_m, luma = true)
/*
    # 129 -> 130..138
    v33_m = v33_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v33_m = v33_m.gaussResize(vv33.width/8, v33.height/8).gaussResize(v33.width, v33.height)
    v33_129 = v33.trim(129, -1)
    v33 = v33.trim(0, 129) + v33.trim(130, 138).mt_merge(v33_129.loop(10), v33_m, luma = true) + v33.trim(139, 0)
*/
    #v33 = v33.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v33, audio_rate = 48000, channels = 2).killVideo
v33 = v33.audioDub(va)

last = v33#.hist_levels
prefetch

