import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v43_angle"))
{
    v43o = v43

    v43_m = v43.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v43 = v43.convertToRGB32(interlaced=false, matrix="PC.709")

    v43 = v43.ExInpaint(mask = v43_m)
    v43 = v43.convertToYV24(interlaced=false, matrix="PC.709")

    v43_m = v43_m.convertToYV24(interlaced=false, matrix="PC.709")
    v43_m = v43_m.gaussResize(v43.width/8, v43.height/8).gaussResize(v43.width, v43.height)
    v43b = v43.gaussResize(v43.width/16, v43.height/16).gaussResize(v43.width, v43.height)
    v43 = v43o.mt_merge(v43b, v43_m, luma = true)
}
else
{
    v43 = v43.fill_wedges(a = v43_angle)

    v43o = v43
    v43_m = v43.prepare_solid_mask(w = 170, h = 150)
    v43 = v43.convertToRGB32(interlaced=false, matrix="PC.709")
    v43 = v43.ExInpaint(mask = v43_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v43 = v43.convertToYV24(interlaced=false, matrix="PC.709")

    v43_m = v43_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v43_m = v43_m.gaussResize(v43.width/8, v43.height/8).gaussResize(v43.width, v43.height)
    v43b = v43.gaussResize(v43.width/16, v43.height/16).gaussResize(v43.width, v43.height)
    v43 = v43o.mt_merge(v43b, v43_m, luma = true)
/*
    # 129 -> 130..138
    v43_m = v43_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v43_m = v43_m.gaussResize(vv43.width/8, v43.height/8).gaussResize(v43.width, v43.height)
    v43_129 = v43.trim(129, -1)
    v43 = v43.trim(0, 129) + v43.trim(130, 138).mt_merge(v43_129.loop(10), v43_m, luma = true) + v43.trim(139, 0)
*/
    v43 = v43.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v43, audio_rate = 48000, channels = 2).killVideo
v43 = v43.audioDub(va)

last = v43
prefetch

