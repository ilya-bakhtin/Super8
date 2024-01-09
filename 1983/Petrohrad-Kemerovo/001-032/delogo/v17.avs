import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v17_angle"))
{
    v17o = v17

    v17_m = v17.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v17 = v17.convertToRGB32(interlaced=false, matrix="PC.709")

    v17 = v17.ExInpaint(mask = v17_m)
    v17 = v17.convertToYV24(interlaced=false, matrix="PC.709")

    v17_m = v17_m.convertToYV24(interlaced=false, matrix="PC.709")
    v17_m = v17_m.gaussResize(v17.width/8, v17.height/8).gaussResize(v17.width, v17.height)
    v17b = v17.gaussResize(v17.width/16, v17.height/16).gaussResize(v17.width, v17.height)
    v17 = v17o.mt_merge(v17b, v17_m, luma = true)
}
else
{
    v17 = v17.fill_wedges(a = v17_angle)

    v17o = v17
    v17_m = v17.prepare_solid_mask(w = 160, h = 170)
    v17 = v17.convertToRGB32(interlaced=false, matrix="PC.709")
    v17 = v17.ExInpaint(mask = v17_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v17 = v17.convertToYV24(interlaced=false, matrix="PC.709")

    v17_m = v17_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v17_m = v17_m.gaussResize(v17.width/8, v17.height/8).gaussResize(v17.width, v17.height)
    v17b = v17.gaussResize(v17.width/16, v17.height/16).gaussResize(v17.width, v17.height)
    v17 = v17o.mt_merge(v17b, v17_m, luma = true)
/*
    # 129 -> 130..138
    v17_m = v17_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v17_m = v17_m.gaussResize(vv17.width/8, v17.height/8).gaussResize(v17.width, v17.height)
    v17_129 = v17.trim(129, -1)
    v17 = v17.trim(0, 129) + v17.trim(130, 138).mt_merge(v17_129.loop(10), v17_m, luma = true) + v17.trim(139, 0)
*/
    #v17 = v17.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

last = v17
prefetch

