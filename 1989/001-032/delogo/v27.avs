import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v27 = v27.autolevels(output_low = 0, output_high = 255, input_low = 70, input_high = 225, autolevel = false)
v27 = v27.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v27_angle"))
{
    v27 = v27.fill_wedges(a = v27_angle)

    v27o = v27
    v27_m = v27.prepare_solid_mask(w = 160, h = 170)
    v27 = v27.convertToRGB32(interlaced=false, matrix="PC.709")
    v27 = v27.ExInpaint(mask = v27_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v27 = v27.convertToYV24(interlaced=false, matrix="PC.709")

    v27_m = v27_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v27_m = v27_m.gaussResize(v27.width/8, v27.height/8).gaussResize(v27.width, v27.height)
    v27b = v27.gaussResize(v27.width/16, v27.height/16).gaussResize(v27.width, v27.height)
    v27 = v27o.mt_merge(v27b, v27_m, luma = true)
/*
    # 129 -> 130..138
    v27_m = v27_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v27_m = v27_m.gaussResize(vv27.width/8, v27.height/8).gaussResize(v27.width, v27.height)
    v27_129 = v27.trim(129, -1)
    v27 = v27.trim(0, 129) + v27.trim(130, 138).mt_merge(v27_129.loop(10), v27_m, luma = true) + v27.trim(139, 0)
*/
    #v27 = v27.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v27, audio_rate = 48000, channels = 2).killVideo
v27 = v27.audioDub(va)

last = v27#.hist_levels
prefetch

