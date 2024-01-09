import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v58_angle"))
{
    v58o = v58

    v58_m = v58.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 200)

    v58 = v58.convertToRGB32(interlaced=false, matrix="PC.709")

    v58 = v58.ExInpaint(mask = v58_m)
    v58 = v58.convertToYV24(interlaced=false, matrix="PC.709")

    v58_m = v58_m.convertToYV24(interlaced=false, matrix="PC.709")
    v58_m = v58_m.gaussResize(v58.width/8, v58.height/8).gaussResize(v58.width, v58.height)
    v58b = v58.gaussResize(v58.width/16, v58.height/16).gaussResize(v58.width, v58.height)
    v58 = v58o.mt_merge(v58b, v58_m, luma = true)
}
else
{
    v58 = v58.fill_wedges(a = v58_angle)

    v58o = v58
    v58_m = v58.prepare_solid_mask(w = 160, h = 170)
    v58 = v58.convertToRGB32(interlaced=false, matrix="PC.709")
    v58 = v58.ExInpaint(mask = v58_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v58 = v58.convertToYV24(interlaced=false, matrix="PC.709")

    v58_m = v58_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v58_m = v58_m.gaussResize(v58.width/8, v58.height/8).gaussResize(v58.width, v58.height)
    v58b = v58.gaussResize(v58.width/16, v58.height/16).gaussResize(v58.width, v58.height)
    v58 = v58o.mt_merge(v58b, v58_m, luma = true)
/*
    # 129 -> 130..138
    v58_m = v58_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v58_m = v58_m.gaussResize(vv58.width/8, v58.height/8).gaussResize(v58.width, v58.height)
    v58_129 = v58.trim(129, -1)
    v58 = v58.trim(0, 129) + v58.trim(130, 138).mt_merge(v58_129.loop(10), v58_m, luma = true) + v58.trim(139, 0)
*/
}
v58 = v58.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v58, audio_rate = 48000, channels = 2).killVideo
v58 = v58.audioDub(va)

last = v58
prefetch

