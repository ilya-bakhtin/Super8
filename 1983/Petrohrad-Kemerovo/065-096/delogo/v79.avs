import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v79_angle"))
{
    v79o = v79

    v79_m = v79.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v79 = v79.convertToRGB32(interlaced=false, matrix="PC.709")

    v79 = v79.ExInpaint(mask = v79_m)
    v79 = v79.convertToYV24(interlaced=false, matrix="PC.709")

    v79_m = v79_m.convertToYV24(interlaced=false, matrix="PC.709")
    v79_m = v79_m.gaussResize(v79.width/8, v79.height/8).gaussResize(v79.width, v79.height)
    v79b = v79.gaussResize(v79.width/16, v79.height/16).gaussResize(v79.width, v79.height)
    v79 = v79o.mt_merge(v79b, v79_m, luma = true)
}
else
{
    v79 = v79.fill_wedges(a = v79_angle)

    v79o = v79
    v79_m = v79.prepare_solid_mask(w = 150, h = 180)
    v79 = v79.convertToRGB32(interlaced=false, matrix="PC.709")
    v79 = v79.ExInpaint(mask = v79_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v79 = v79.convertToYV24(interlaced=false, matrix="PC.709")

    v79_m = v79_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v79_m = v79_m.gaussResize(v79.width/8, v79.height/8).gaussResize(v79.width, v79.height)
    v79b = v79.gaussResize(v79.width/16, v79.height/16).gaussResize(v79.width, v79.height)
    v79 = v79o.mt_merge(v79b, v79_m, luma = true)
/*
    # 129 -> 130..138
    v79_m = v79_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v79_m = v79_m.gaussResize(vv79.width/8, v79.height/8).gaussResize(v79.width, v79.height)
    v79_129 = v79.trim(129, -1)
    v79 = v79.trim(0, 129) + v79.trim(130, 138).mt_merge(v79_129.loop(10), v79_m, luma = true) + v79.trim(139, 0)
*/
    v79 = v79.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v79, audio_rate = 48000, channels = 2).killVideo
v79 = v79.audioDub(va)

last = v79
prefetch

