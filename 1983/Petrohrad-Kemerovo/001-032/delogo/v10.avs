import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v10_angle"))
{
    v10o = v10

    v10_m = v10.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v10 = v10.convertToRGB32(interlaced=false, matrix="PC.709")

    v10 = v10.ExInpaint(mask = v10_m)
    v10 = v10.convertToYV24(interlaced=false, matrix="PC.709")

    v10_m = v10_m.convertToYV24(interlaced=false, matrix="PC.709")
    v10_m = v10_m.gaussResize(v10.width/8, v10.height/8).gaussResize(v10.width, v10.height)
    v10b = v10.gaussResize(v10.width/16, v10.height/16).gaussResize(v10.width, v10.height)
    v10 = v10o.mt_merge(v10b, v10_m, luma = true)
}
else
{
    v10 = v10.fill_wedges(a = v10_angle)

    v10o = v10
    v10_m = v10.prepare_solid_mask(w = 140, h = 170)
    v10 = v10.convertToRGB32(interlaced=false, matrix="PC.709")
    v10 = v10.ExInpaint(mask = v10_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v10 = v10.convertToYV24(interlaced=false, matrix="PC.709")

    v10_m = v10_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v10_m = v10_m.gaussResize(v10.width/8, v10.height/8).gaussResize(v10.width, v10.height)
    v10b = v10.gaussResize(v10.width/16, v10.height/16).gaussResize(v10.width, v10.height)
    v10 = v10o.mt_merge(v10b, v10_m, luma = true)
/*
    # 129 -> 130..138
    v10_m = v10_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v10_m = v10_m.gaussResize(vv10.width/8, v10.height/8).gaussResize(v10.width, v10.height)
    v10_129 = v10.trim(129, -1)
    v10 = v10.trim(0, 129) + v10.trim(130, 138).mt_merge(v10_129.loop(10), v10_m, luma = true) + v10.trim(139, 0)
*/
    v10 = v10.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v10, audio_rate = 48000, channels = 2).killVideo
v10 = v10.audioDub(va)

last = v10
prefetch

