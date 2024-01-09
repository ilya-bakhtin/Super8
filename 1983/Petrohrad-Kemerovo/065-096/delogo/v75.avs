import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v75_angle"))
{
    v75o = v75

    v75_m = v75.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v75 = v75.convertToRGB32(interlaced=false, matrix="PC.709")

    v75 = v75.ExInpaint(mask = v75_m)
    v75 = v75.convertToYV24(interlaced=false, matrix="PC.709")

    v75_m = v75_m.convertToYV24(interlaced=false, matrix="PC.709")
    v75_m = v75_m.gaussResize(v75.width/8, v75.height/8).gaussResize(v75.width, v75.height)
    v75b = v75.gaussResize(v75.width/16, v75.height/16).gaussResize(v75.width, v75.height)
    v75 = v75o.mt_merge(v75b, v75_m, luma = true)
}
else
{
    v75 = v75.fill_wedges(a = v75_angle)

    v75o = v75
    v75_m = v75.prepare_solid_mask(w = 160, h = 170)
    v75 = v75.convertToRGB32(interlaced=false, matrix="PC.709")
    v75 = v75.ExInpaint(mask = v75_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v75 = v75.convertToYV24(interlaced=false, matrix="PC.709")

    v75_m = v75_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v75_m = v75_m.gaussResize(v75.width/8, v75.height/8).gaussResize(v75.width, v75.height)
    v75b = v75.gaussResize(v75.width/16, v75.height/16).gaussResize(v75.width, v75.height)
    v75 = v75o.mt_merge(v75b, v75_m, luma = true)
/*
    # 129 -> 130..138
    v75_m = v75_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v75_m = v75_m.gaussResize(vv75.width/8, v75.height/8).gaussResize(v75.width, v75.height)
    v75_129 = v75.trim(129, -1)
    v75 = v75.trim(0, 129) + v75.trim(130, 138).mt_merge(v75_129.loop(10), v75_m, luma = true) + v75.trim(139, 0)
*/
}
v75 = v75.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v75, audio_rate = 48000, channels = 2).killVideo
v75 = v75.audioDub(va)

last = v75
prefetch

