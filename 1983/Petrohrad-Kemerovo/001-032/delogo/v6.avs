import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v6_angle"))
{
    v6o = v6

    v6_m = v6.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v6 = v6.convertToRGB32(interlaced=false, matrix="PC.709")

    v6 = v6.ExInpaint(mask = v6_m)
    v6 = v6.convertToYV24(interlaced=false, matrix="PC.709")

    v6_m = v6_m.convertToYV24(interlaced=false, matrix="PC.709")
    v6_m = v6_m.gaussResize(v6.width/8, v6.height/8).gaussResize(v6.width, v6.height)
    v6b = v6.gaussResize(v6.width/16, v6.height/16).gaussResize(v6.width, v6.height)
    v6 = v6o.mt_merge(v6b, v6_m, luma = true)
}
else
{
    v6 = v6.fill_wedges(a = v6_angle)

    v6o = v6
    v6_m = v6.prepare_solid_mask(w = 160, h = 170)
    v6 = v6.convertToRGB32(interlaced=false, matrix="PC.709")
    v6 = v6.ExInpaint(mask = v6_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v6 = v6.convertToYV24(interlaced=false, matrix="PC.709")

    v6_m = v6_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v6_m = v6_m.gaussResize(v6.width/8, v6.height/8).gaussResize(v6.width, v6.height)
    v6b = v6.gaussResize(v6.width/16, v6.height/16).gaussResize(v6.width, v6.height)
    v6 = v6o.mt_merge(v6b, v6_m, luma = true)
/*
    # 129 -> 130..138
    v6_m = v6_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v6_m = v6_m.gaussResize(vv6.width/8, v6.height/8).gaussResize(v6.width, v6.height)
    v6_129 = v6.trim(129, -1)
    v6 = v6.trim(0, 129) + v6.trim(130, 138).mt_merge(v6_129.loop(10), v6_m, luma = true) + v6.trim(139, 0)
*/
    v6 = v6.crop(78, 0, 0, -54)#.adjustBorders
}

va = BlankClip(v6, audio_rate = 48000, channels = 2).killVideo
v6 = v6.audioDub(va)

last = v6
prefetch

