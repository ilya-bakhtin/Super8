import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v71_angle"))
{
    v71o = v71

    v71_m = v71.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v71 = v71.convertToRGB32(interlaced=false, matrix="PC.709")

    v71 = v71.ExInpaint(mask = v71_m)
    v71 = v71.convertToYV24(interlaced=false, matrix="PC.709")

    v71_m = v71_m.convertToYV24(interlaced=false, matrix="PC.709")
    v71_m = v71_m.gaussResize(v71.width/8, v71.height/8).gaussResize(v71.width, v71.height)
    v71b = v71.gaussResize(v71.width/16, v71.height/16).gaussResize(v71.width, v71.height)
    v71 = v71o.mt_merge(v71b, v71_m, luma = true)
}
else
{
    v71 = v71.fill_wedges(a = v71_angle)

    v71o = v71
    v71_m = v71.prepare_solid_mask(w = 160, h = 170)
    v71 = v71.convertToRGB32(interlaced=false, matrix="PC.709")
    v71 = v71.ExInpaint(mask = v71_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v71 = v71.convertToYV24(interlaced=false, matrix="PC.709")

    v71_m = v71_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v71_m = v71_m.gaussResize(v71.width/8, v71.height/8).gaussResize(v71.width, v71.height)
    v71b = v71.gaussResize(v71.width/16, v71.height/16).gaussResize(v71.width, v71.height)
    v71 = v71o.mt_merge(v71b, v71_m, luma = true)
/*
    # 129 -> 130..138
    v71_m = v71_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v71_m = v71_m.gaussResize(vv71.width/8, v71.height/8).gaussResize(v71.width, v71.height)
    v71_129 = v71.trim(129, -1)
    v71 = v71.trim(0, 129) + v71.trim(130, 138).mt_merge(v71_129.loop(10), v71_m, luma = true) + v71.trim(139, 0)
*/
}
v71 = v71.crop(78, 28, 0, -28)#.adjustBorders

va = BlankClip(v71, audio_rate = 48000, channels = 2).killVideo
v71 = v71.audioDub(va)

last = v71
prefetch

