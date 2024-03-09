import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v21 = v21.autolevels(output_low = 0, output_high = 255, input_low = 50, input_high = 225, autolevel = false)
v21 = v21.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v21_angle"))
{
    v21 = v21.fill_wedges(a = v21_angle)

    v21o = v21
    v21_m = v21.prepare_solid_mask(w = 160, h = 170)
    v21 = v21.convertToRGB32(interlaced=false, matrix="PC.709")
    v21 = v21.ExInpaint(mask = v21_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v21 = v21.convertToYV24(interlaced=false, matrix="PC.709")

    v21_m = v21_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v21_m = v21_m.gaussResize(v21.width/8, v21.height/8).gaussResize(v21.width, v21.height)
    v21b = v21.gaussResize(v21.width/16, v21.height/16).gaussResize(v21.width, v21.height)
    v21 = v21o.mt_merge(v21b, v21_m, luma = true)
/*
    # 129 -> 130..138
    v21_m = v21_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v21_m = v21_m.gaussResize(vv21.width/8, v21.height/8).gaussResize(v21.width, v21.height)
    v21_129 = v21.trim(129, -1)
    v21 = v21.trim(0, 129) + v21.trim(130, 138).mt_merge(v21_129.loop(10), v21_m, luma = true) + v21.trim(139, 0)
*/
    #v21 = v21.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v21, audio_rate = 48000, channels = 2).killVideo
v21 = v21.audioDub(va)

last = v21#.hist_levels
prefetch

