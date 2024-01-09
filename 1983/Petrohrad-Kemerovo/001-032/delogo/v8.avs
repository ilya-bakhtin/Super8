import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v8_angle"))
{
    v8o = v8

    v8_m = v8.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v8 = v8.convertToRGB32(interlaced=false, matrix="PC.709")

    v8 = v8.ExInpaint(mask = v8_m)
    v8 = v8.convertToYV24(interlaced=false, matrix="PC.709")

    v8_m = v8_m.convertToYV24(interlaced=false, matrix="PC.709")
    v8_m = v8_m.gaussResize(v8.width/8, v8.height/8).gaussResize(v8.width, v8.height)
    v8b = v8.gaussResize(v8.width/16, v8.height/16).gaussResize(v8.width, v8.height)
    v8 = v8o.mt_merge(v8b, v8_m, luma = true)
}
else
{
    v8 = v8.fill_wedges(a = v8_angle)

    v8o = v8
    v8_m = v8.prepare_solid_mask(w = 150, h = 180)
    v8 = v8.convertToRGB32(interlaced=false, matrix="PC.709")
    v8 = v8.ExInpaint(mask = v8_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v8 = v8.convertToYV24(interlaced=false, matrix="PC.709")

    v8_m = v8_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v8_m = v8_m.gaussResize(v8.width/8, v8.height/8).gaussResize(v8.width, v8.height)
    v8b = v8.gaussResize(v8.width/16, v8.height/16).gaussResize(v8.width, v8.height)
    v8 = v8o.mt_merge(v8b, v8_m, luma = true)
/*
    # 129 -> 130..138
    v8_m = v8_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v8_m = v8_m.gaussResize(vv8.width/8, v8.height/8).gaussResize(v8.width, v8.height)
    v8_129 = v8.trim(129, -1)
    v8 = v8.trim(0, 129) + v8.trim(130, 138).mt_merge(v8_129.loop(10), v8_m, luma = true) + v8.trim(139, 0)
*/
    v8 = v8.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v8, audio_rate = 48000, channels = 2).killVideo
v8 = v8.audioDub(va)

last = v8
prefetch

