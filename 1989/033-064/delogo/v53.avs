import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v53 = v53.autolevels(output_low = 0, output_high = 255, input_low = 90, input_high = 230, autolevel = false)
v53 = v53.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v53_angle"))
{
    v53 = v53.fill_wedges(a = v53_angle)

    v53o = v53
    v53_m = v53.prepare_solid_mask(w = 160, h = 170)
    v53 = v53.convertToRGB32(interlaced=false, matrix="PC.709")
    v53 = v53.ExInpaint(mask = v53_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v53 = v53.convertToYV24(interlaced=false, matrix="PC.709")

    v53_m = v53_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v53_m = v53_m.gaussResize(v53.width/8, v53.height/8).gaussResize(v53.width, v53.height)
    v53b = v53.gaussResize(v53.width/16, v53.height/16).gaussResize(v53.width, v53.height)
    v53 = v53o.mt_merge(v53b, v53_m, luma = true)
/*
    # 129 -> 130..138
    v53_m = v53_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v53_m = v53_m.gaussResize(vv53.width/8, v53.height/8).gaussResize(v53.width, v53.height)
    v53_129 = v53.trim(129, -1)
    v53 = v53.trim(0, 129) + v53.trim(130, 138).mt_merge(v53_129.loop(10), v53_m, luma = true) + v53.trim(139, 0)
*/
    #v53 = v53.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v53, audio_rate = 48000, channels = 2).killVideo
v53 = v53.audioDub(va)

last = v53#.hist_levels
prefetch

