import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v32 = v32.autolevels(output_low = 0, output_high = 255, input_low = 130, input_high = 225, autolevel = false)
v32 = v32.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v32_angle"))
{
    v32 = v32.fill_wedges(a = v32_angle)

    v32o = v32
    v32_m = v32.prepare_solid_mask(w = 160, h = 170)
    v32 = v32.convertToRGB32(interlaced=false, matrix="PC.709")
    v32 = v32.ExInpaint(mask = v32_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v32 = v32.convertToYV24(interlaced=false, matrix="PC.709")

    v32_m = v32_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v32_m = v32_m.gaussResize(v32.width/8, v32.height/8).gaussResize(v32.width, v32.height)
    v32b = v32.gaussResize(v32.width/16, v32.height/16).gaussResize(v32.width, v32.height)
    v32 = v32o.mt_merge(v32b, v32_m, luma = true)
/*
    # 129 -> 130..138
    v32_m = v32_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v32_m = v32_m.gaussResize(vv32.width/8, v32.height/8).gaussResize(v32.width, v32.height)
    v32_129 = v32.trim(129, -1)
    v32 = v32.trim(0, 129) + v32.trim(130, 138).mt_merge(v32_129.loop(10), v32_m, luma = true) + v32.trim(139, 0)
*/
    #v32 = v32.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v32, audio_rate = 48000, channels = 2).killVideo
v32 = v32.audioDub(va)

last = v32#.histogram#.hist_levels
prefetch

