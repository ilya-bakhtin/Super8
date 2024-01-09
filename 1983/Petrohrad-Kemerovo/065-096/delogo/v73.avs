import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v73_angle"))
{
    v73o = v73

    v73_m = v73.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 200)

    v73 = v73.convertToRGB32(interlaced=false, matrix="PC.709")

    v73 = v73.ExInpaint(mask = v73_m)
    v73 = v73.convertToYV24(interlaced=false, matrix="PC.709")

    v73_m = v73_m.convertToYV24(interlaced=false, matrix="PC.709")
    v73_m = v73_m.gaussResize(v73.width/8, v73.height/8).gaussResize(v73.width, v73.height)
    v73b = v73.gaussResize(v73.width/16, v73.height/16).gaussResize(v73.width, v73.height)
    v73 = v73o.mt_merge(v73b, v73_m, luma = true)
}
else
{
    v73 = v73.fill_wedges(a = v73_angle)

    v73o = v73
    v73_m = v73.prepare_solid_mask(w = 160, h = 170)
    v73 = v73.convertToRGB32(interlaced=false, matrix="PC.709")
    v73 = v73.ExInpaint(mask = v73_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v73 = v73.convertToYV24(interlaced=false, matrix="PC.709")

    v73_m = v73_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v73_m = v73_m.gaussResize(v73.width/8, v73.height/8).gaussResize(v73.width, v73.height)
    v73b = v73.gaussResize(v73.width/16, v73.height/16).gaussResize(v73.width, v73.height)
    v73 = v73o.mt_merge(v73b, v73_m, luma = true)
/*
    # 129 -> 130..138
    v73_m = v73_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v73_m = v73_m.gaussResize(vv73.width/8, v73.height/8).gaussResize(v73.width, v73.height)
    v73_129 = v73.trim(129, -1)
    v73 = v73.trim(0, 129) + v73.trim(130, 138).mt_merge(v73_129.loop(10), v73_m, luma = true) + v73.trim(139, 0)
*/
}
v73 = v73.crop(78, 28, 0, -28)#.adjustBorders

va = BlankClip(v73, audio_rate = 48000, channels = 2).killVideo
v73 = v73.audioDub(va)

last = v73
prefetch

