import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v84_angle"))
{
    v84o = v84

    v84_m = v84.PrepareMask(mask_w = 150, mask_h = 100)#(mask_tolerance = 200)

    v84 = v84.convertToRGB32(interlaced=false, matrix="PC.709")

    v84 = v84.ExInpaint(mask = v84_m)
    v84 = v84.convertToYV24(interlaced=false, matrix="PC.709")

    v84_m = v84_m.convertToYV24(interlaced=false, matrix="PC.709")
    v84_m = v84_m.gaussResize(v84.width/8, v84.height/8).gaussResize(v84.width, v84.height)
    v84b = v84.gaussResize(v84.width/16, v84.height/16).gaussResize(v84.width, v84.height)
    v84 = v84o.mt_merge(v84b, v84_m, luma = true)
}
else
{
    v84 = v84.fill_wedges(a = v84_angle)

    v84o = v84
    v84_m = v84.prepare_solid_mask(w = 160, h = 170)
    v84 = v84.convertToRGB32(interlaced=false, matrix="PC.709")
    v84 = v84.ExInpaint(mask = v84_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v84 = v84.convertToYV24(interlaced=false, matrix="PC.709")

    v84_m = v84_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v84_m = v84_m.gaussResize(v84.width/8, v84.height/8).gaussResize(v84.width, v84.height)
    v84b = v84.gaussResize(v84.width/16, v84.height/16).gaussResize(v84.width, v84.height)
    v84 = v84o.mt_merge(v84b, v84_m, luma = true)
/*
    # 129 -> 130..138
    v84_m = v84_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v84_m = v84_m.gaussResize(vv84.width/8, v84.height/8).gaussResize(v84.width, v84.height)
    v84_129 = v84.trim(129, -1)
    v84 = v84.trim(0, 129) + v84.trim(130, 138).mt_merge(v84_129.loop(10), v84_m, luma = true) + v84.trim(139, 0)
*/
}
v84 = v84.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v84, audio_rate = 48000, channels = 2).killVideo
v84 = v84.audioDub(va)

last = v84
prefetch

