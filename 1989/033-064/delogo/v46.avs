import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

function levels_l(clip c, int input_low, int input_high)
{
    return c.autolevels(output_low = 0, output_high = 255, input_low = input_low, input_high = input_high, autolevel = false)
}

#v46 = v46.autolevels(output_low = 0, output_high = 255, input_low = 70, input_high = 230, autolevel = false)
v46 = v46.animate(5, 9, "levels_l", 100, 220, 60, 230)
v46 = v46.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v46_angle"))
{
    v46 = v46.fill_wedges(a = v46_angle)

    v46o = v46
    v46_m = v46.prepare_solid_mask(w = 160, h = 170)
    v46 = v46.convertToRGB32(interlaced=false, matrix="PC.709")
    v46 = v46.ExInpaint(mask = v46_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v46 = v46.convertToYV24(interlaced=false, matrix="PC.709")

    v46_m = v46_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v46_m = v46_m.gaussResize(v46.width/8, v46.height/8).gaussResize(v46.width, v46.height)
    v46b = v46.gaussResize(v46.width/16, v46.height/16).gaussResize(v46.width, v46.height)
    v46 = v46o.mt_merge(v46b, v46_m, luma = true)
/*
    # 129 -> 130..138
    v46_m = v46_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v46_m = v46_m.gaussResize(vv46.width/8, v46.height/8).gaussResize(v46.width, v46.height)
    v46_129 = v46.trim(129, -1)
    v46 = v46.trim(0, 129) + v46.trim(130, 138).mt_merge(v46_129.loop(10), v46_m, luma = true) + v46.trim(139, 0)
*/
    #v46 = v46.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v46, audio_rate = 48000, channels = 2).killVideo
v46 = v46.audioDub(va)

#last = v46.histogram
last = v46#.hist_levels
prefetch

