import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v60_angle"))
{
    v60o = v60

    v60_m = v60.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 200)

    v60 = v60.convertToRGB32(interlaced=false, matrix="PC.709")

    v60 = v60.ExInpaint(mask = v60_m)
    v60 = v60.convertToYV24(interlaced=false, matrix="PC.709")

    v60_m = v60_m.convertToYV24(interlaced=false, matrix="PC.709")
    v60_m = v60_m.gaussResize(v60.width/8, v60.height/8).gaussResize(v60.width, v60.height)
    v60b = v60.gaussResize(v60.width/16, v60.height/16).gaussResize(v60.width, v60.height)
    v60 = v60o.mt_merge(v60b, v60_m, luma = true)
}
else
{
    v60 = v60.fill_wedges(a = v60_angle)

    v60o = v60
    v60_m = v60.prepare_solid_mask(w = 160, h = 170)
    v60 = v60.convertToRGB32(interlaced=false, matrix="PC.709")
    v60 = v60.ExInpaint(mask = v60_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v60 = v60.convertToYV24(interlaced=false, matrix="PC.709")

    v60_m = v60_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v60_m = v60_m.gaussResize(v60.width/8, v60.height/8).gaussResize(v60.width, v60.height)
    v60b = v60.gaussResize(v60.width/16, v60.height/16).gaussResize(v60.width, v60.height)
    v60 = v60o.mt_merge(v60b, v60_m, luma = true)
/*
    # 129 -> 130..138
    v60_m = v60_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v60_m = v60_m.gaussResize(vv60.width/8, v60.height/8).gaussResize(v60.width, v60.height)
    v60_129 = v60.trim(129, -1)
    v60 = v60.trim(0, 129) + v60.trim(130, 138).mt_merge(v60_129.loop(10), v60_m, luma = true) + v60.trim(139, 0)
*/
}
v60 = v60.crop(78, 20, 0, -36)#.adjustBorders

va = BlankClip(v60, audio_rate = 48000, channels = 2).killVideo
v60 = v60.audioDub(va)

last = v60
prefetch

