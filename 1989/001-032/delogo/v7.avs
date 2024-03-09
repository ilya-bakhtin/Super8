import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v7 = v7.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v7 = v7.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v7_angle"))
{
    v7 = v7.fill_wedges(a = v7_angle)

    v7o = v7
    v7_m = v7.prepare_solid_mask(w = 160, h = 170)
    v7 = v7.convertToRGB32(interlaced=false, matrix="PC.709")
    v7 = v7.ExInpaint(mask = v7_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v7 = v7.convertToYV24(interlaced=false, matrix="PC.709")

    v7_m = v7_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v7_m = v7_m.gaussResize(v7.width/8, v7.height/8).gaussResize(v7.width, v7.height)
    v7b = v7.gaussResize(v7.width/16, v7.height/16).gaussResize(v7.width, v7.height)
    v7 = v7o.mt_merge(v7b, v7_m, luma = true)
/*
    # 129 -> 130..138
    v7_m = v7_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v7_m = v7_m.gaussResize(vv7.width/8, v7.height/8).gaussResize(v7.width, v7.height)
    v7_129 = v7.trim(129, -1)
    v7 = v7.trim(0, 129) + v7.trim(130, 138).mt_merge(v7_129.loop(10), v7_m, luma = true) + v7.trim(139, 0)
*/
    #v7 = v7.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v7, audio_rate = 48000, channels = 2).killVideo
v7 = v7.audioDub(va)

last = v7#.hist_levels
prefetch

