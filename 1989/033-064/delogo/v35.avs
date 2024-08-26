import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v35 = v35.autolevels(output_low = 0, output_high = 255, input_low = 130, input_high = 225, autolevel = false)
v35 = v35.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v35_angle"))
{
    v35 = v35.rotate(-v35_angle)

    v35 = v35.fill_wedges(a = v35_angle)

    v35o = v35
    v35_m = v35.prepare_solid_mask(w = 60, h = 100)
    v35 = v35.convertToRGB32(interlaced=false, matrix="PC.709")
    v35 = v35.ExInpaint(mask = v35_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v35 = v35.convertToYV24(interlaced=false, matrix="PC.709")

    v35_m = v35_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v35_m = v35_m.gaussResize(v35.width/8, v35.height/8).gaussResize(v35.width, v35.height)
    v35b = v35.gaussResize(v35.width/16, v35.height/16).gaussResize(v35.width, v35.height)
    v35 = v35o.mt_merge(v35b, v35_m, luma = true)
/*
    # 129 -> 130..138
    v35_m = v35_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v35_m = v35_m.gaussResize(vv35.width/8, v35.height/8).gaussResize(v35.width, v35.height)
    v35_129 = v35.trim(129, -1)
    v35 = v35.trim(0, 129) + v35.trim(130, 138).mt_merge(v35_129.loop(10), v35_m, luma = true) + v35.trim(139, 0)
*/
    v35 = v35.crop(78, 0, 0, -54)#.adjustBorders
}

va = BlankClip(v35, audio_rate = 48000, channels = 2).killVideo
v35 = v35.audioDub(va)

last = v35#.hist_levels
prefetch

