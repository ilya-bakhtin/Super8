import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v55 = v55.autolevels(output_low = 0, output_high = 255, input_low = 10, input_high = 230, autolevel = false)
v55 = v55.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v55_angle"))
{
    v55 = v55.fill_wedges(a = v55_angle)

    v55o = v55
    v55_m = v55.prepare_solid_mask(w = 160, h = 170)
    v55 = v55.convertToRGB32(interlaced=false, matrix="PC.709")
    v55 = v55.ExInpaint(mask = v55_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v55 = v55.convertToYV24(interlaced=false, matrix="PC.709")

    v55_m = v55_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v55_m = v55_m.gaussResize(v55.width/8, v55.height/8).gaussResize(v55.width, v55.height)
    v55b = v55.gaussResize(v55.width/16, v55.height/16).gaussResize(v55.width, v55.height)
    v55 = v55o.mt_merge(v55b, v55_m, luma = true)
/*
    # 129 -> 130..138
    v55_m = v55_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v55_m = v55_m.gaussResize(vv55.width/8, v55.height/8).gaussResize(v55.width, v55.height)
    v55_129 = v55.trim(129, -1)
    v55 = v55.trim(0, 129) + v55.trim(130, 138).mt_merge(v55_129.loop(10), v55_m, luma = true) + v55.trim(139, 0)
*/
    #v55 = v55.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v55, audio_rate = 48000, channels = 2).killVideo
v55 = v55.audioDub(va)

#last = v55.histogram
last = v55#.hist_levels
prefetch

