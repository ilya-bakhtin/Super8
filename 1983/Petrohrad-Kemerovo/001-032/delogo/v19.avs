import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v19_angle"))
{
    v19o = v19

    v19_m = v19.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v19 = v19.convertToRGB32(interlaced=false, matrix="PC.709")

    v19 = v19.ExInpaint(mask = v19_m)
    v19 = v19.convertToYV24(interlaced=false, matrix="PC.709")

    v19_m = v19_m.convertToYV24(interlaced=false, matrix="PC.709")
    v19_m = v19_m.gaussResize(v19.width/8, v19.height/8).gaussResize(v19.width, v19.height)
    v19b = v19.gaussResize(v19.width/16, v19.height/16).gaussResize(v19.width, v19.height)
    v19 = v19o.mt_merge(v19b, v19_m, luma = true)
}
else
{
    v19 = v19.fill_wedges(a = v19_angle)

    v19o = v19
    v19_m = v19.prepare_solid_mask(w = 160, h = 170)
    v19 = v19.convertToRGB32(interlaced=false, matrix="PC.709")
    v19 = v19.ExInpaint(mask = v19_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v19 = v19.convertToYV24(interlaced=false, matrix="PC.709")

    v19_m = v19_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v19_m = v19_m.gaussResize(v19.width/8, v19.height/8).gaussResize(v19.width, v19.height)
    v19b = v19.gaussResize(v19.width/16, v19.height/16).gaussResize(v19.width, v19.height)
    v19 = v19o.mt_merge(v19b, v19_m, luma = true)
/*
    # 129 -> 130..138
    v19_m = v19_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v19_m = v19_m.gaussResize(vv19.width/8, v19.height/8).gaussResize(v19.width, v19.height)
    v19_129 = v19.trim(129, -1)
    v19 = v19.trim(0, 129) + v19.trim(130, 138).mt_merge(v19_129.loop(10), v19_m, luma = true) + v19.trim(139, 0)
*/
    v19 = v19.crop(78, 0, 0, -54)#.adjustBorders
}

va = BlankClip(v19, audio_rate = 48000, channels = 2).killVideo
v19 = v19.audioDub(va)

last = v19
prefetch

