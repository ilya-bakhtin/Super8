import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v94_angle"))
{
/*
    v94o = v94

    v94_m = v94.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v94 = v94.convertToRGB32(interlaced=false, matrix="PC.709")

    v94 = v94.ExInpaint(mask = v94_m)
    v94 = v94.convertToYV24(interlaced=false, matrix="PC.709")

    v94_m = v94_m.convertToYV24(interlaced=false, matrix="PC.709")
    v94_m = v94_m.gaussResize(v94.width/8, v94.height/8).gaussResize(v94.width, v94.height)
    v94b = v94.gaussResize(v94.width/16, v94.height/16).gaussResize(v94.width, v94.height)
    v94 = v94o.mt_merge(v94b, v94_m, luma = true)
*/
}
else
{
    v94 = v94.fill_wedges(a = v94_angle)

    v94o = v94
    v94_m = v94.prepare_solid_mask(w = 160, h = 170)
    v94 = v94.convertToRGB32(interlaced=false, matrix="PC.709")
    v94 = v94.ExInpaint(mask = v94_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v94 = v94.convertToYV24(interlaced=false, matrix="PC.709")

    v94_m = v94_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v94_m = v94_m.gaussResize(v94.width/8, v94.height/8).gaussResize(v94.width, v94.height)
    v94b = v94.gaussResize(v94.width/16, v94.height/16).gaussResize(v94.width, v94.height)
    v94 = v94o.mt_merge(v94b, v94_m, luma = true)
/*
    # 129 -> 130..138
    v94_m = v94_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v94_m = v94_m.gaussResize(vv94.width/8, v94.height/8).gaussResize(v94.width, v94.height)
    v94_129 = v94.trim(129, -1)
    v94 = v94.trim(0, 129) + v94.trim(130, 138).mt_merge(v94_129.loop(10), v94_m, luma = true) + v94.trim(139, 0)
*/
    #v94 = v94.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v94, audio_rate = 48000, channels = 2).killVideo
v94 = v94.audioDub(va)

last = v94
prefetch

