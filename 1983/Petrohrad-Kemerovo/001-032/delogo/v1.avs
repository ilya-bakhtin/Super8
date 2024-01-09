import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v1_angle"))
{
    v1o = v1

    v1_m = v1.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v1 = v1.convertToRGB32(interlaced=false, matrix="PC.709")

    v1 = v1.ExInpaint(mask = v1_m)
    v1 = v1.convertToYV24(interlaced=false, matrix="PC.709")

    v1_m = v1_m.convertToYV24(interlaced=false, matrix="PC.709")
    v1_m = v1_m.gaussResize(v1.width/8, v1.height/8).gaussResize(v1.width, v1.height)
    v1b = v1.gaussResize(v1.width/16, v1.height/16).gaussResize(v1.width, v1.height)
    v1 = v1o.mt_merge(v1b, v1_m, luma = true)
}
else
{
    v1 = v1.fill_wedges(a = v1_angle)

    v1o = v1
    v1_m = v1.prepare_solid_mask(w = 160, h = 170)
    v1 = v1.convertToRGB32(interlaced=false, matrix="PC.709")
    v1 = v1.ExInpaint(mask = v1_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v1 = v1.convertToYV24(interlaced=false, matrix="PC.709")

    v1_m = v1_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v1_m = v1_m.gaussResize(v1.width/8, v1.height/8).gaussResize(v1.width, v1.height)
    v1b = v1.gaussResize(v1.width/16, v1.height/16).gaussResize(v1.width, v1.height)
    v1 = v1o.mt_merge(v1b, v1_m, luma = true)
/*
    # 129 -> 130..138
    v1_m = v1_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v1_m = v1_m.gaussResize(vv1.width/8, v1.height/8).gaussResize(v1.width, v1.height)
    v1_129 = v1.trim(129, -1)
    v1 = v1.trim(0, 129) + v1.trim(130, 138).mt_merge(v1_129.loop(10), v1_m, luma = true) + v1.trim(139, 0)
*/
    #v1 = v1.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v1, audio_rate = 48000, channels = 2).killVideo
v1 = v1.audioDub(va)

last = v1
prefetch

