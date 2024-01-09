import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v76_angle"))
{
    v76o = v76

    v76_m = v76.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v76 = v76.convertToRGB32(interlaced=false, matrix="PC.709")

    v76 = v76.ExInpaint(mask = v76_m)
    v76 = v76.convertToYV24(interlaced=false, matrix="PC.709")

    v76_m = v76_m.convertToYV24(interlaced=false, matrix="PC.709")
    v76_m = v76_m.gaussResize(v76.width/8, v76.height/8).gaussResize(v76.width, v76.height)
    v76b = v76.gaussResize(v76.width/16, v76.height/16).gaussResize(v76.width, v76.height)
    v76 = v76o.mt_merge(v76b, v76_m, luma = true)
}
else
{
    v76 = v76.fill_wedges(a = v76_angle)

    v76o = v76
    v76_m = v76.prepare_solid_mask(w = 150, h = 180)
    v76 = v76.convertToRGB32(interlaced=false, matrix="PC.709")
    v76 = v76.ExInpaint(mask = v76_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v76 = v76.convertToYV24(interlaced=false, matrix="PC.709")

    v76_m = v76_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v76_m = v76_m.gaussResize(v76.width/8, v76.height/8).gaussResize(v76.width, v76.height)
    v76b = v76.gaussResize(v76.width/16, v76.height/16).gaussResize(v76.width, v76.height)
    v76 = v76o.mt_merge(v76b, v76_m, luma = true)
/*
    # 129 -> 130..138
    v76_m = v76_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v76_m = v76_m.gaussResize(vv76.width/8, v76.height/8).gaussResize(v76.width, v76.height)
    v76_129 = v76.trim(129, -1)
    v76 = v76.trim(0, 129) + v76.trim(130, 138).mt_merge(v76_129.loop(10), v76_m, luma = true) + v76.trim(139, 0)
*/
    v76 = v76.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v76, audio_rate = 48000, channels = 2).killVideo
v76 = v76.audioDub(va)

last = v76
prefetch

