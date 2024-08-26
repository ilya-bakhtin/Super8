import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v45 = v45.autolevels(output_low = 0, output_high = 255, input_low = 40, input_high = 230, autolevel = false)
v45 = v45.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v45_angle"))
{
    v45 = v45.fill_wedges(a = v45_angle)

    v45o = v45
    v45_m = v45.prepare_solid_mask(w = 160, h = 170)
    v45 = v45.convertToRGB32(interlaced=false, matrix="PC.709")
    v45 = v45.ExInpaint(mask = v45_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v45 = v45.convertToYV24(interlaced=false, matrix="PC.709")

    v45_m = v45_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v45_m = v45_m.gaussResize(v45.width/8, v45.height/8).gaussResize(v45.width, v45.height)
    v45b = v45.gaussResize(v45.width/16, v45.height/16).gaussResize(v45.width, v45.height)
    v45 = v45o.mt_merge(v45b, v45_m, luma = true)
/*
    # 129 -> 130..138
    v45_m = v45_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v45_m = v45_m.gaussResize(vv45.width/8, v45.height/8).gaussResize(v45.width, v45.height)
    v45_129 = v45.trim(129, -1)
    v45 = v45.trim(0, 129) + v45.trim(130, 138).mt_merge(v45_129.loop(10), v45_m, luma = true) + v45.trim(139, 0)
*/
    #v45 = v45.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v45, audio_rate = 48000, channels = 2).killVideo
v45 = v45.audioDub(va)

last = v45#.hist_levels
prefetch

