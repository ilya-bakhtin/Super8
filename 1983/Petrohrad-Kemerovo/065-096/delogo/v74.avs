import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v74_angle"))
{
    v74o = v74

    v74_m = v74.PrepareMask(mask_w = 150, mask_h = 110, mask_tolerance = 200)

    v74 = v74.convertToRGB32(interlaced=false, matrix="PC.709")

    v74 = v74.ExInpaint(mask = v74_m)
    v74 = v74.convertToYV24(interlaced=false, matrix="PC.709")

    v74_m = v74_m.convertToYV24(interlaced=false, matrix="PC.709")
    v74_m = v74_m.gaussResize(v74.width/8, v74.height/8).gaussResize(v74.width, v74.height)
    v74b = v74.gaussResize(v74.width/16, v74.height/16).gaussResize(v74.width, v74.height)
    v74 = v74o.mt_merge(v74b, v74_m, luma = true)
}
else
{
    v74 = v74.fill_wedges(a = v74_angle)

    v74o = v74
    v74_m = v74.prepare_solid_mask(w = 160, h = 170)
    v74 = v74.convertToRGB32(interlaced=false, matrix="PC.709")
    v74 = v74.ExInpaint(mask = v74_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v74 = v74.convertToYV24(interlaced=false, matrix="PC.709")

    v74_m = v74_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v74_m = v74_m.gaussResize(v74.width/8, v74.height/8).gaussResize(v74.width, v74.height)
    v74b = v74.gaussResize(v74.width/16, v74.height/16).gaussResize(v74.width, v74.height)
    v74 = v74o.mt_merge(v74b, v74_m, luma = true)
/*
    # 129 -> 130..138
    v74_m = v74_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v74_m = v74_m.gaussResize(vv74.width/8, v74.height/8).gaussResize(v74.width, v74.height)
    v74_129 = v74.trim(129, -1)
    v74 = v74.trim(0, 129) + v74.trim(130, 138).mt_merge(v74_129.loop(10), v74_m, luma = true) + v74.trim(139, 0)
*/
}
v74 = v74.crop(78, 28, 0, -28)#.adjustBorders

va = BlankClip(v74, audio_rate = 48000, channels = 2).killVideo
v74 = v74.audioDub(va)

last = v74
prefetch

