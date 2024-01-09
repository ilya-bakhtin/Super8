import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v77_angle"))
{
    v77o = v77

    v77_m = v77.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v77 = v77.convertToRGB32(interlaced=false, matrix="PC.709")

    v77 = v77.ExInpaint(mask = v77_m)
    v77 = v77.convertToYV24(interlaced=false, matrix="PC.709")

    v77_m = v77_m.convertToYV24(interlaced=false, matrix="PC.709")
    v77_m = v77_m.gaussResize(v77.width/8, v77.height/8).gaussResize(v77.width, v77.height)
    v77b = v77.gaussResize(v77.width/16, v77.height/16).gaussResize(v77.width, v77.height)
    v77 = v77o.mt_merge(v77b, v77_m, luma = true)
}
else
{
    v77 = v77.fill_wedges(a = v77_angle)

    v77o = v77
    v77_m = v77.prepare_solid_mask(w = 140, h = 180)
    v77 = v77.convertToRGB32(interlaced=false, matrix="PC.709")
    v77 = v77.ExInpaint(mask = v77_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v77 = v77.convertToYV24(interlaced=false, matrix="PC.709")

    v77_m = v77_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v77_m = v77_m.gaussResize(v77.width/8, v77.height/8).gaussResize(v77.width, v77.height)
    v77b = v77.gaussResize(v77.width/16, v77.height/16).gaussResize(v77.width, v77.height)
    v77 = v77o.mt_merge(v77b, v77_m, luma = true)
/*
    # 129 -> 130..138
    v77_m = v77_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v77_m = v77_m.gaussResize(vv77.width/8, v77.height/8).gaussResize(v77.width, v77.height)
    v77_129 = v77.trim(129, -1)
    v77 = v77.trim(0, 129) + v77.trim(130, 138).mt_merge(v77_129.loop(10), v77_m, luma = true) + v77.trim(139, 0)
*/
    v77 = v77.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v77, audio_rate = 48000, channels = 2).killVideo
v77 = v77.audioDub(va)

last = v77
prefetch

