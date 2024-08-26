import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v61 = v61.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v61 = v61.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v61_angle"))
{
    v61 = v61.fill_wedges(a = v61_angle)

    v61o = v61
    v61_m = v61.prepare_solid_mask(w = 160, h = 170)
    v61 = v61.convertToRGB32(interlaced=false, matrix="PC.709")
    v61 = v61.ExInpaint(mask = v61_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v61 = v61.convertToYV24(interlaced=false, matrix="PC.709")

    v61_m = v61_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v61_m = v61_m.gaussResize(v61.width/8, v61.height/8).gaussResize(v61.width, v61.height)
    v61b = v61.gaussResize(v61.width/16, v61.height/16).gaussResize(v61.width, v61.height)
    v61 = v61o.mt_merge(v61b, v61_m, luma = true)
/*
    # 129 -> 130..138
    v61_m = v61_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v61_m = v61_m.gaussResize(vv61.width/8, v61.height/8).gaussResize(v61.width, v61.height)
    v61_129 = v61.trim(129, -1)
    v61 = v61.trim(0, 129) + v61.trim(130, 138).mt_merge(v61_129.loop(10), v61_m, luma = true) + v61.trim(139, 0)
*/
    #v61 = v61.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v61, audio_rate = 48000, channels = 2).killVideo
v61 = v61.audioDub(va)

#last = v61.histogram
last = v61#.hist_levels
prefetch

