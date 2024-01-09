import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v37_angle"))
{
    v37o = v37

    v37_m = v37.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v37 = v37.convertToRGB32(interlaced=false, matrix="PC.709")

    v37 = v37.ExInpaint(mask = v37_m)
    v37 = v37.convertToYV24(interlaced=false, matrix="PC.709")

    v37_m = v37_m.convertToYV24(interlaced=false, matrix="PC.709")
    v37_m = v37_m.gaussResize(v37.width/8, v37.height/8).gaussResize(v37.width, v37.height)
    v37b = v37.gaussResize(v37.width/16, v37.height/16).gaussResize(v37.width, v37.height)
    v37 = v37o.mt_merge(v37b, v37_m, luma = true)
}
else
{
    v37 = v37.fill_wedges(a = v37_angle)

    v37o = v37
    v37_m = v37.prepare_solid_mask(w = 140, h = 180)
    v37 = v37.convertToRGB32(interlaced=false, matrix="PC.709")
    v37 = v37.ExInpaint(mask = v37_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v37 = v37.convertToYV24(interlaced=false, matrix="PC.709")

    v37_m = v37_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v37_m = v37_m.gaussResize(v37.width/8, v37.height/8).gaussResize(v37.width, v37.height)
    v37b = v37.gaussResize(v37.width/16, v37.height/16).gaussResize(v37.width, v37.height)
    v37 = v37o.mt_merge(v37b, v37_m, luma = true)
/*
    # 129 -> 130..138
    v37_m = v37_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v37_m = v37_m.gaussResize(vv37.width/8, v37.height/8).gaussResize(v37.width, v37.height)
    v37_129 = v37.trim(129, -1)
    v37 = v37.trim(0, 129) + v37.trim(130, 138).mt_merge(v37_129.loop(10), v37_m, luma = true) + v37.trim(139, 0)
*/
    v37 = v37.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v37, audio_rate = 48000, channels = 2).killVideo
v37 = v37.audioDub(va)

last = v37
prefetch

