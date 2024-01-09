import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v52_angle"))
{
    v52o = v52

    v52_m = v52.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v52 = v52.convertToRGB32(interlaced=false, matrix="PC.709")

    v52 = v52.ExInpaint(mask = v52_m)
    v52 = v52.convertToYV24(interlaced=false, matrix="PC.709")

    v52_m = v52_m.convertToYV24(interlaced=false, matrix="PC.709")
    v52_m = v52_m.gaussResize(v52.width/8, v52.height/8).gaussResize(v52.width, v52.height)
    v52b = v52.gaussResize(v52.width/16, v52.height/16).gaussResize(v52.width, v52.height)
    v52 = v52o.mt_merge(v52b, v52_m, luma = true)
}
else
{
    v52 = v52.fill_wedges(a = v52_angle)

    v52o = v52
    v52_m = v52.prepare_solid_mask(w = 160, h = 170)
    v52 = v52.convertToRGB32(interlaced=false, matrix="PC.709")
    v52 = v52.ExInpaint(mask = v52_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v52 = v52.convertToYV24(interlaced=false, matrix="PC.709")

    v52_m = v52_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v52_m = v52_m.gaussResize(v52.width/8, v52.height/8).gaussResize(v52.width, v52.height)
    v52b = v52.gaussResize(v52.width/16, v52.height/16).gaussResize(v52.width, v52.height)
    v52 = v52o.mt_merge(v52b, v52_m, luma = true)
/*
    # 129 -> 130..138
    v52_m = v52_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v52_m = v52_m.gaussResize(vv52.width/8, v52.height/8).gaussResize(v52.width, v52.height)
    v52_129 = v52.trim(129, -1)
    v52 = v52.trim(0, 129) + v52.trim(130, 138).mt_merge(v52_129.loop(10), v52_m, luma = true) + v52.trim(139, 0)
*/
    v52 = v52.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v52, audio_rate = 48000, channels = 2).killVideo
v52 = v52.audioDub(va)

last = v52
prefetch

