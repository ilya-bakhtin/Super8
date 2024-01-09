import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v24_angle"))
{
    v24o = v24

    v24_m = v24.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v24 = v24.convertToRGB32(interlaced=false, matrix="PC.709")

    v24 = v24.ExInpaint(mask = v24_m)
    v24 = v24.convertToYV24(interlaced=false, matrix="PC.709")

    v24_m = v24_m.convertToYV24(interlaced=false, matrix="PC.709")
    v24_m = v24_m.gaussResize(v24.width/8, v24.height/8).gaussResize(v24.width, v24.height)
    v24b = v24.gaussResize(v24.width/16, v24.height/16).gaussResize(v24.width, v24.height)
    v24 = v24o.mt_merge(v24b, v24_m, luma = true)
}
else
{
    v24 = v24.fill_wedges(a = v24_angle)

    v24o = v24
    v24_m = v24.prepare_solid_mask(w = 150, h = 180)
    v24 = v24.convertToRGB32(interlaced=false, matrix="PC.709")
    v24 = v24.ExInpaint(mask = v24_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v24 = v24.convertToYV24(interlaced=false, matrix="PC.709")

    v24_m = v24_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v24_m = v24_m.gaussResize(v24.width/8, v24.height/8).gaussResize(v24.width, v24.height)
    v24b = v24.gaussResize(v24.width/16, v24.height/16).gaussResize(v24.width, v24.height)
    v24 = v24o.mt_merge(v24b, v24_m, luma = true)
/*
    # 129 -> 130..138
    v24_m = v24_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v24_m = v24_m.gaussResize(vv24.width/8, v24.height/8).gaussResize(v24.width, v24.height)
    v24_129 = v24.trim(129, -1)
    v24 = v24.trim(0, 129) + v24.trim(130, 138).mt_merge(v24_129.loop(10), v24_m, luma = true) + v24.trim(139, 0)
*/
    v24 = v24.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v24, audio_rate = 48000, channels = 2).killVideo
v24 = v24.audioDub(va)

last = v24
prefetch

