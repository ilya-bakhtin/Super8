import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v82_angle"))
{
    v82o = v82

    v82_m = v82.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v82 = v82.convertToRGB32(interlaced=false, matrix="PC.709")

    v82 = v82.ExInpaint(mask = v82_m)
    v82 = v82.convertToYV24(interlaced=false, matrix="PC.709")

    v82_m = v82_m.convertToYV24(interlaced=false, matrix="PC.709")
    v82_m = v82_m.gaussResize(v82.width/8, v82.height/8).gaussResize(v82.width, v82.height)
    v82b = v82.gaussResize(v82.width/16, v82.height/16).gaussResize(v82.width, v82.height)
    v82 = v82o.mt_merge(v82b, v82_m, luma = true)
}
else
{
    v82 = v82.fill_wedges(a = v82_angle)

    v82o = v82
    v82_m = v82.prepare_solid_mask(w = 140, h = 180)
    v82 = v82.convertToRGB32(interlaced=false, matrix="PC.709")
    v82 = v82.ExInpaint(mask = v82_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v82 = v82.convertToYV24(interlaced=false, matrix="PC.709")

    v82_m = v82_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v82_m = v82_m.gaussResize(v82.width/8, v82.height/8).gaussResize(v82.width, v82.height)
    v82b = v82.gaussResize(v82.width/16, v82.height/16).gaussResize(v82.width, v82.height)
    v82 = v82o.mt_merge(v82b, v82_m, luma = true)
/*
    # 129 -> 130..138
    v82_m = v82_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v82_m = v82_m.gaussResize(vv82.width/8, v82.height/8).gaussResize(v82.width, v82.height)
    v82_129 = v82.trim(129, -1)
    v82 = v82.trim(0, 129) + v82.trim(130, 138).mt_merge(v82_129.loop(10), v82_m, luma = true) + v82.trim(139, 0)
*/
    v82 = v82.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v82, audio_rate = 48000, channels = 2).killVideo
v82 = v82.audioDub(va)

last = v82
prefetch

