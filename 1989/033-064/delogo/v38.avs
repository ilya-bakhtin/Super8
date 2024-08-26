import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v38 = v38.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v38 = v38.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v38_angle"))
{
    v38 = v38.fill_wedges(a = v38_angle)

    v38o = v38
    v38_m = v38.prepare_solid_mask(w = 160, h = 170)
    v38 = v38.convertToRGB32(interlaced=false, matrix="PC.709")
    v38 = v38.ExInpaint(mask = v38_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v38 = v38.convertToYV24(interlaced=false, matrix="PC.709")

    v38_m = v38_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v38_m = v38_m.gaussResize(v38.width/8, v38.height/8).gaussResize(v38.width, v38.height)
    v38b = v38.gaussResize(v38.width/16, v38.height/16).gaussResize(v38.width, v38.height)
    v38 = v38o.mt_merge(v38b, v38_m, luma = true)
/*
    # 129 -> 130..138
    v38_m = v38_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v38_m = v38_m.gaussResize(vv38.width/8, v38.height/8).gaussResize(v38.width, v38.height)
    v38_129 = v38.trim(129, -1)
    v38 = v38.trim(0, 129) + v38.trim(130, 138).mt_merge(v38_129.loop(10), v38_m, luma = true) + v38.trim(139, 0)
*/
    #v38 = v38.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v38, audio_rate = 48000, channels = 2).killVideo
v38 = v38.audioDub(va)

last = v38#.hist_levels
prefetch

