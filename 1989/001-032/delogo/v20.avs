import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v20 = v20.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v20 = v20.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v20_angle"))
{
    v20 = v20.fill_wedges(a = v20_angle)

    v20o = v20
    v20_m = v20.prepare_solid_mask(w = 160, h = 170)
    v20 = v20.convertToRGB32(interlaced=false, matrix="PC.709")
    v20 = v20.ExInpaint(mask = v20_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v20 = v20.convertToYV24(interlaced=false, matrix="PC.709")

    v20_m = v20_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v20_m = v20_m.gaussResize(v20.width/8, v20.height/8).gaussResize(v20.width, v20.height)
    v20b = v20.gaussResize(v20.width/16, v20.height/16).gaussResize(v20.width, v20.height)
    v20 = v20o.mt_merge(v20b, v20_m, luma = true)
/*
    # 129 -> 130..138
    v20_m = v20_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v20_m = v20_m.gaussResize(vv20.width/8, v20.height/8).gaussResize(v20.width, v20.height)
    v20_129 = v20.trim(129, -1)
    v20 = v20.trim(0, 129) + v20.trim(130, 138).mt_merge(v20_129.loop(10), v20_m, luma = true) + v20.trim(139, 0)
*/
    #v20 = v20.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v20, audio_rate = 48000, channels = 2).killVideo
v20 = v20.audioDub(va)

last = v20#.hist_levels
prefetch

