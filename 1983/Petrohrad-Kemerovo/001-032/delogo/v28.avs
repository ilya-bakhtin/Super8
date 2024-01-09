import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v28_angle"))
{
    v28o = v28

    v28_m = v28.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v28 = v28.convertToRGB32(interlaced=false, matrix="PC.709")

    v28 = v28.ExInpaint(mask = v28_m)
    v28 = v28.convertToYV24(interlaced=false, matrix="PC.709")

    v28_m = v28_m.convertToYV24(interlaced=false, matrix="PC.709")
    v28_m = v28_m.gaussResize(v28.width/8, v28.height/8).gaussResize(v28.width, v28.height)
    v28b = v28.gaussResize(v28.width/16, v28.height/16).gaussResize(v28.width, v28.height)
    v28 = v28o.mt_merge(v28b, v28_m, luma = true)
}
else
{
    v28 = v28.fill_wedges(a = v28_angle)

    v28o = v28
    v28_m = v28.prepare_solid_mask(w = 160, h = 170)
    v28 = v28.convertToRGB32(interlaced=false, matrix="PC.709")
    v28 = v28.ExInpaint(mask = v28_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v28 = v28.convertToYV24(interlaced=false, matrix="PC.709")

    v28_m = v28_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v28_m = v28_m.gaussResize(v28.width/8, v28.height/8).gaussResize(v28.width, v28.height)
    v28b = v28.gaussResize(v28.width/16, v28.height/16).gaussResize(v28.width, v28.height)
    v28 = v28o.mt_merge(v28b, v28_m, luma = true)
/*
    # 129 -> 130..138
    v28_m = v28_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v28_m = v28_m.gaussResize(vv28.width/8, v28.height/8).gaussResize(v28.width, v28.height)
    v28_129 = v28.trim(129, -1)
    v28 = v28.trim(0, 129) + v28.trim(130, 138).mt_merge(v28_129.loop(10), v28_m, luma = true) + v28.trim(139, 0)
*/
    v28 = v28.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v28, audio_rate = 48000, channels = 2).killVideo
v28 = v28.audioDub(va)

last = v28
prefetch

