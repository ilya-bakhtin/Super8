import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v48 = v48.autolevels(output_low = 0, output_high = 255, input_low = 50, input_high = 230, autolevel = false)
v48 = v48.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v48_angle"))
{
    v48 = v48.fill_wedges(a = v48_angle)

    v48o = v48
    v48_m = v48.prepare_solid_mask(w = 160, h = 170)
    v48 = v48.convertToRGB32(interlaced=false, matrix="PC.709")
    v48 = v48.ExInpaint(mask = v48_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v48 = v48.convertToYV24(interlaced=false, matrix="PC.709")

    v48_m = v48_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v48_m = v48_m.gaussResize(v48.width/8, v48.height/8).gaussResize(v48.width, v48.height)
    v48b = v48.gaussResize(v48.width/16, v48.height/16).gaussResize(v48.width, v48.height)
    v48 = v48o.mt_merge(v48b, v48_m, luma = true)
/*
    # 129 -> 130..138
    v48_m = v48_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v48_m = v48_m.gaussResize(vv48.width/8, v48.height/8).gaussResize(v48.width, v48.height)
    v48_129 = v48.trim(129, -1)
    v48 = v48.trim(0, 129) + v48.trim(130, 138).mt_merge(v48_129.loop(10), v48_m, luma = true) + v48.trim(139, 0)
*/
    #v48 = v48.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v48, audio_rate = 48000, channels = 2).killVideo
v48 = v48.audioDub(va)

last = v48#.histogram#.hist_levels
prefetch

