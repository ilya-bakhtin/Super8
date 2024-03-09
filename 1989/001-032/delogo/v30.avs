import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

function levels_l(clip c, int input_low, int input_high)
{
    return c.autolevels(output_low = 0, output_high = 255, input_low = input_low, input_high = input_high, autolevel = false)
}
#v30 = v30.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v30 = v30.animate(211, 214, "levels_l", 60, 225, 30, 230)
v30 = v30.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v30_angle"))
{
    v30 = v30.fill_wedges(a = v30_angle)

    v30o = v30
    v30_m = v30.prepare_solid_mask(w = 160, h = 170)
    v30 = v30.convertToRGB32(interlaced=false, matrix="PC.709")
    v30 = v30.ExInpaint(mask = v30_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v30 = v30.convertToYV24(interlaced=false, matrix="PC.709")

    v30_m = v30_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v30_m = v30_m.gaussResize(v30.width/8, v30.height/8).gaussResize(v30.width, v30.height)
    v30b = v30.gaussResize(v30.width/16, v30.height/16).gaussResize(v30.width, v30.height)
    v30 = v30o.mt_merge(v30b, v30_m, luma = true)
/*
    # 129 -> 130..138
    v30_m = v30_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v30_m = v30_m.gaussResize(vv30.width/8, v30.height/8).gaussResize(v30.width, v30.height)
    v30_129 = v30.trim(129, -1)
    v30 = v30.trim(0, 129) + v30.trim(130, 138).mt_merge(v30_129.loop(10), v30_m, luma = true) + v30.trim(139, 0)
*/
    #v30 = v30.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v30, audio_rate = 48000, channels = 2).killVideo
v30 = v30.audioDub(va)

last = v30#.hist_levels
prefetch

