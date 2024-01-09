import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v36_angle"))
{
    v36o = v36

    v36_m = v36.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v36 = v36.convertToRGB32(interlaced=false, matrix="PC.709")

    v36 = v36.ExInpaint(mask = v36_m)
    v36 = v36.convertToYV24(interlaced=false, matrix="PC.709")

    v36_m = v36_m.convertToYV24(interlaced=false, matrix="PC.709")
    v36_m = v36_m.gaussResize(v36.width/8, v36.height/8).gaussResize(v36.width, v36.height)
    v36b = v36.gaussResize(v36.width/16, v36.height/16).gaussResize(v36.width, v36.height)
    v36 = v36o.mt_merge(v36b, v36_m, luma = true)
}
else
{
    v36 = v36.fill_wedges(a = v36_angle)

    v36o = v36
    v36_m = v36.prepare_solid_mask(w = 160, h = 160)
    v36 = v36.convertToRGB32(interlaced=false, matrix="PC.709")
    v36 = v36.ExInpaint(mask = v36_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v36 = v36.convertToYV24(interlaced=false, matrix="PC.709")

    v36_m = v36_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v36_m = v36_m.gaussResize(v36.width/8, v36.height/8).gaussResize(v36.width, v36.height)
    v36b = v36.gaussResize(v36.width/16, v36.height/16).gaussResize(v36.width, v36.height)
    v36 = v36o.mt_merge(v36b, v36_m, luma = true)
/*
    # 129 -> 130..138
    v36_m = v36_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v36_m = v36_m.gaussResize(vv36.width/8, v36.height/8).gaussResize(v36.width, v36.height)
    v36_129 = v36.trim(129, -1)
    v36 = v36.trim(0, 129) + v36.trim(130, 138).mt_merge(v36_129.loop(10), v36_m, luma = true) + v36.trim(139, 0)
*/
    v36 = v36.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v36, audio_rate = 48000, channels = 2).killVideo
v36 = v36.audioDub(va)

last = v36
prefetch

