import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v44 = v44.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v44 = v44.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v44_angle"))
{
    v44 = v44.fill_wedges(a = v44_angle)

    v44o = v44
    v44_m = v44.prepare_solid_mask(w = 160, h = 170)
    v44 = v44.convertToRGB32(interlaced=false, matrix="PC.709")
    v44 = v44.ExInpaint(mask = v44_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v44 = v44.convertToYV24(interlaced=false, matrix="PC.709")

    v44_m = v44_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v44_m = v44_m.gaussResize(v44.width/8, v44.height/8).gaussResize(v44.width, v44.height)
    v44b = v44.gaussResize(v44.width/16, v44.height/16).gaussResize(v44.width, v44.height)
    v44 = v44o.mt_merge(v44b, v44_m, luma = true)
/*
    # 129 -> 130..138
    v44_m = v44_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v44_m = v44_m.gaussResize(vv44.width/8, v44.height/8).gaussResize(v44.width, v44.height)
    v44_129 = v44.trim(129, -1)
    v44 = v44.trim(0, 129) + v44.trim(130, 138).mt_merge(v44_129.loop(10), v44_m, luma = true) + v44.trim(139, 0)
*/
    #v44 = v44.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v44, audio_rate = 48000, channels = 2).killVideo
v44 = v44.audioDub(va)

last = v44#.hist_levels
prefetch

