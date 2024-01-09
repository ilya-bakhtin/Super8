import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v3_angle"))
{
    v3o = v3

    v3_m = v3.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v3 = v3.convertToRGB32(interlaced=false, matrix="PC.709")

    v3 = v3.ExInpaint(mask = v3_m)
    v3 = v3.convertToYV24(interlaced=false, matrix="PC.709")

    v3_m = v3_m.convertToYV24(interlaced=false, matrix="PC.709")
    v3_m = v3_m.gaussResize(v3.width/8, v3.height/8).gaussResize(v3.width, v3.height)
    v3b = v3.gaussResize(v3.width/16, v3.height/16).gaussResize(v3.width, v3.height)
    v3 = v3o.mt_merge(v3b, v3_m, luma = true)
}
else
{
    v3 = v3.fill_wedges(a = v3_angle)

    v3o = v3
    v3_m = v3.prepare_solid_mask(w = 160, h = 170)
    v3 = v3.convertToRGB32(interlaced=false, matrix="PC.709")
    v3 = v3.ExInpaint(mask = v3_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v3 = v3.convertToYV24(interlaced=false, matrix="PC.709")

    v3_m = v3_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v3_m = v3_m.gaussResize(v3.width/8, v3.height/8).gaussResize(v3.width, v3.height)
    v3b = v3.gaussResize(v3.width/16, v3.height/16).gaussResize(v3.width, v3.height)
    v3 = v3o.mt_merge(v3b, v3_m, luma = true)
/*
    # 129 -> 130..138
    v3_m = v3_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v3_m = v3_m.gaussResize(vv3.width/8, v3.height/8).gaussResize(v3.width, v3.height)
    v3_129 = v3.trim(129, -1)
    v3 = v3.trim(0, 129) + v3.trim(130, 138).mt_merge(v3_129.loop(10), v3_m, luma = true) + v3.trim(139, 0)
*/
    #v3 = v3.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v3, audio_rate = 48000, channels = 2).killVideo
v3 = v3.audioDub(va)

last = v3
prefetch

