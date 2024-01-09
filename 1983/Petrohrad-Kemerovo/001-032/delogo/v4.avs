import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v4_angle"))
{
    v4o = v4

    v4_m = v4.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v4 = v4.convertToRGB32(interlaced=false, matrix="PC.709")

    v4 = v4.ExInpaint(mask = v4_m)
    v4 = v4.convertToYV24(interlaced=false, matrix="PC.709")

    v4_m = v4_m.convertToYV24(interlaced=false, matrix="PC.709")
    v4_m = v4_m.gaussResize(v4.width/8, v4.height/8).gaussResize(v4.width, v4.height)
    v4b = v4.gaussResize(v4.width/16, v4.height/16).gaussResize(v4.width, v4.height)
    v4 = v4o.mt_merge(v4b, v4_m, luma = true)
}
else
{
    v4 = v4.fill_wedges(a = v4_angle)

    v4o = v4
    v4_m = v4.prepare_solid_mask(w = 160, h = 170)
    v4 = v4.convertToRGB32(interlaced=false, matrix="PC.709")
    v4 = v4.ExInpaint(mask = v4_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v4 = v4.convertToYV24(interlaced=false, matrix="PC.709")

    v4_m = v4_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v4_m = v4_m.gaussResize(v4.width/8, v4.height/8).gaussResize(v4.width, v4.height)
    v4b = v4.gaussResize(v4.width/16, v4.height/16).gaussResize(v4.width, v4.height)
    v4 = v4o.mt_merge(v4b, v4_m, luma = true)
/*
    # 129 -> 130..138
    v4_m = v4_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v4_m = v4_m.gaussResize(vv4.width/8, v4.height/8).gaussResize(v4.width, v4.height)
    v4_129 = v4.trim(129, -1)
    v4 = v4.trim(0, 129) + v4.trim(130, 138).mt_merge(v4_129.loop(10), v4_m, luma = true) + v4.trim(139, 0)
*/
    #v4 = v4.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v4, audio_rate = 48000, channels = 2).killVideo
v4 = v4.audioDub(va)

last = v4
prefetch

