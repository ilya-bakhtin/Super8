import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v54_angle"))
{
    v54o = v54

    v54_m = v54.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 200)

    v54 = v54.convertToRGB32(interlaced=false, matrix="PC.709")

    v54 = v54.ExInpaint(mask = v54_m)
    v54 = v54.convertToYV24(interlaced=false, matrix="PC.709")

    v54_m = v54_m.convertToYV24(interlaced=false, matrix="PC.709")
    v54_m = v54_m.gaussResize(v54.width/8, v54.height/8).gaussResize(v54.width, v54.height)
    v54b = v54.gaussResize(v54.width/16, v54.height/16).gaussResize(v54.width, v54.height)
    v54 = v54o.mt_merge(v54b, v54_m, luma = true)
}
else
{
    v54 = v54.fill_wedges(a = v54_angle)

    v54o = v54
    v54_m = v54.prepare_solid_mask(w = 160, h = 170)
    v54 = v54.convertToRGB32(interlaced=false, matrix="PC.709")
    v54 = v54.ExInpaint(mask = v54_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v54 = v54.convertToYV24(interlaced=false, matrix="PC.709")

    v54_m = v54_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v54_m = v54_m.gaussResize(v54.width/8, v54.height/8).gaussResize(v54.width, v54.height)
    v54b = v54.gaussResize(v54.width/16, v54.height/16).gaussResize(v54.width, v54.height)
    v54 = v54o.mt_merge(v54b, v54_m, luma = true)
/*
    # 129 -> 130..138
    v54_m = v54_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v54_m = v54_m.gaussResize(vv54.width/8, v54.height/8).gaussResize(v54.width, v54.height)
    v54_129 = v54.trim(129, -1)
    v54 = v54.trim(0, 129) + v54.trim(130, 138).mt_merge(v54_129.loop(10), v54_m, luma = true) + v54.trim(139, 0)
*/
}
v54 = v54.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v54, audio_rate = 48000, channels = 2).killVideo
v54 = v54.audioDub(va)

last = v54
prefetch

