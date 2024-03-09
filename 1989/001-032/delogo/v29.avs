import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

function levels_1(clip c, int input_low, int input_high)
{
    return c.autolevels(output_low = 0, output_high = 255, input_low = input_low, input_high = input_high, autolevel = false)
}
#v29 = v29.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v29 = v29.animate(280, 290, "levels_1", 100, 225, 30, 230)
v29 = v29.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v29_angle"))
{
    v29 = v29.fill_wedges(a = v29_angle)

    v29o = v29
    v29_m = v29.prepare_solid_mask(w = 160, h = 170)
    v29 = v29.convertToRGB32(interlaced=false, matrix="PC.709")
    v29 = v29.ExInpaint(mask = v29_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v29 = v29.convertToYV24(interlaced=false, matrix="PC.709")

    v29_m = v29_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v29_m = v29_m.gaussResize(v29.width/8, v29.height/8).gaussResize(v29.width, v29.height)
    v29b = v29.gaussResize(v29.width/16, v29.height/16).gaussResize(v29.width, v29.height)
    v29 = v29o.mt_merge(v29b, v29_m, luma = true)
/*
    # 129 -> 130..138
    v29_m = v29_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v29_m = v29_m.gaussResize(vv29.width/8, v29.height/8).gaussResize(v29.width, v29.height)
    v29_129 = v29.trim(129, -1)
    v29 = v29.trim(0, 129) + v29.trim(130, 138).mt_merge(v29_129.loop(10), v29_m, luma = true) + v29.trim(139, 0)
*/
    #v29 = v29.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v29, audio_rate = 48000, channels = 2).killVideo
v29 = v29.audioDub(va)

last = v29#.hist_levels
prefetch

