import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v9_angle"))
{
    v9o = v9

    v9_m = v9.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v9 = v9.convertToRGB32(interlaced=false, matrix="PC.709")

    v9 = v9.ExInpaint(mask = v9_m)
    v9 = v9.convertToYV24(interlaced=false, matrix="PC.709")

    v9_m = v9_m.convertToYV24(interlaced=false, matrix="PC.709")
    v9_m = v9_m.gaussResize(v9.width/8, v9.height/8).gaussResize(v9.width, v9.height)
    v9b = v9.gaussResize(v9.width/16, v9.height/16).gaussResize(v9.width, v9.height)
    v9 = v9o.mt_merge(v9b, v9_m, luma = true)
}
else
{
    v9 = v9.fill_wedges(a = v9_angle)

    v9o = v9
    v9_m = v9.prepare_solid_mask(w = 150, h = 180)
    v9 = v9.convertToRGB32(interlaced=false, matrix="PC.709")
    v9 = v9.ExInpaint(mask = v9_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v9 = v9.convertToYV24(interlaced=false, matrix="PC.709")

    v9_m = v9_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v9_m = v9_m.gaussResize(v9.width/8, v9.height/8).gaussResize(v9.width, v9.height)
    v9b = v9.gaussResize(v9.width/16, v9.height/16).gaussResize(v9.width, v9.height)
    v9 = v9o.mt_merge(v9b, v9_m, luma = true)
/*
    # 129 -> 130..138
    v9_m = v9_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v9_m = v9_m.gaussResize(vv9.width/8, v9.height/8).gaussResize(v9.width, v9.height)
    v9_129 = v9.trim(129, -1)
    v9 = v9.trim(0, 129) + v9.trim(130, 138).mt_merge(v9_129.loop(10), v9_m, luma = true) + v9.trim(139, 0)
*/
    v9 = v9.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v9, audio_rate = 48000, channels = 2).killVideo
v9 = v9.audioDub(va)

last = v9
prefetch

