import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v66_angle"))
{
    v66o = v66

    v66_m = v66.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v66 = v66.convertToRGB32(interlaced=false, matrix="PC.709")

    v66 = v66.ExInpaint(mask = v66_m)
    v66 = v66.convertToYV24(interlaced=false, matrix="PC.709")

    v66_m = v66_m.convertToYV24(interlaced=false, matrix="PC.709")
    v66_m = v66_m.gaussResize(v66.width/8, v66.height/8).gaussResize(v66.width, v66.height)
    v66b = v66.gaussResize(v66.width/16, v66.height/16).gaussResize(v66.width, v66.height)
    v66 = v66o.mt_merge(v66b, v66_m, luma = true)
}
else
{
    v66 = v66.fill_wedges(a = v66_angle)

    v66o = v66
    v66_m = v66.prepare_solid_mask(w = 170, h = 120)
    v66 = v66.convertToRGB32(interlaced=false, matrix="PC.709")
    v66 = v66.ExInpaint(mask = v66_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v66 = v66.convertToYV24(interlaced=false, matrix="PC.709")

    v66_m = v66_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v66_m = v66_m.gaussResize(v66.width/8, v66.height/8).gaussResize(v66.width, v66.height)
    v66b = v66.gaussResize(v66.width/16, v66.height/16).gaussResize(v66.width, v66.height)
    v66 = v66o.mt_merge(v66b, v66_m, luma = true)
/*
    # 129 -> 130..138
    v66_m = v66_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v66_m = v66_m.gaussResize(vv66.width/8, v66.height/8).gaussResize(v66.width, v66.height)
    v66_129 = v66.trim(129, -1)
    v66 = v66.trim(0, 129) + v66.trim(130, 138).mt_merge(v66_129.loop(10), v66_m, luma = true) + v66.trim(139, 0)
*/
    v66 = v66.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v66, audio_rate = 48000, channels = 2).killVideo
v66 = v66.audioDub(va)

last = v66
prefetch

