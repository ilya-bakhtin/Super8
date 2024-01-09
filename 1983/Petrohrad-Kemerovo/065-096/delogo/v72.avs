import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v72_angle"))
{
    v72o = v72

    v72_m = v72.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v72 = v72.convertToRGB32(interlaced=false, matrix="PC.709")

    v72 = v72.ExInpaint(mask = v72_m)
    v72 = v72.convertToYV24(interlaced=false, matrix="PC.709")

    v72_m = v72_m.convertToYV24(interlaced=false, matrix="PC.709")
    v72_m = v72_m.gaussResize(v72.width/8, v72.height/8).gaussResize(v72.width, v72.height)
    v72b = v72.gaussResize(v72.width/16, v72.height/16).gaussResize(v72.width, v72.height)
    v72 = v72o.mt_merge(v72b, v72_m, luma = true)
}
else
{
    v72 = v72.fill_wedges(a = v72_angle)

    v72o = v72
    v72_m = v72.prepare_solid_mask(w = 160, h = 170)
    v72 = v72.convertToRGB32(interlaced=false, matrix="PC.709")
    v72 = v72.ExInpaint(mask = v72_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v72 = v72.convertToYV24(interlaced=false, matrix="PC.709")

    v72_m = v72_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v72_m = v72_m.gaussResize(v72.width/8, v72.height/8).gaussResize(v72.width, v72.height)
    v72b = v72.gaussResize(v72.width/16, v72.height/16).gaussResize(v72.width, v72.height)
    v72 = v72o.mt_merge(v72b, v72_m, luma = true)
/*
    # 129 -> 130..138
    v72_m = v72_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v72_m = v72_m.gaussResize(vv72.width/8, v72.height/8).gaussResize(v72.width, v72.height)
    v72_129 = v72.trim(129, -1)
    v72 = v72.trim(0, 129) + v72.trim(130, 138).mt_merge(v72_129.loop(10), v72_m, luma = true) + v72.trim(139, 0)
*/
    v72 = v72.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v72, audio_rate = 48000, channels = 2).killVideo
v72 = v72.audioDub(va)

last = v72
prefetch

