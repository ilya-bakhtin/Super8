import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v13_angle"))
{
    v13o = v13

    v13_m = v13.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v13 = v13.convertToRGB32(interlaced=false, matrix="PC.709")

    v13 = v13.ExInpaint(mask = v13_m)
    v13 = v13.convertToYV24(interlaced=false, matrix="PC.709")

    v13_m = v13_m.convertToYV24(interlaced=false, matrix="PC.709")
    v13_m = v13_m.gaussResize(v13.width/8, v13.height/8).gaussResize(v13.width, v13.height)
    v13b = v13.gaussResize(v13.width/16, v13.height/16).gaussResize(v13.width, v13.height)
    v13 = v13o.mt_merge(v13b, v13_m, luma = true)
}
else
{
    v13 = v13.animate(20, 58, "do_v13_update", 5., 2.)
    v13 = v13.crop(78, 0, 0, -56)#.adjustBorders
}

function do_v13_update(clip v13, float a)
{
    v13 = v13.fill_wedges(a = a)

    v13o = v13
    v13_m = v13.prepare_solid_mask(w = 160, h = 170)
    v13 = v13.convertToRGB32(interlaced=false, matrix="PC.709")
    v13 = v13.ExInpaint(mask = v13_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v13 = v13.convertToYV24(interlaced=false, matrix="PC.709")

    v13_m = v13_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v13_m = v13_m.gaussResize(v13.width/8, v13.height/8).gaussResize(v13.width, v13.height)
    v13b = v13.gaussResize(v13.width/16, v13.height/16).gaussResize(v13.width, v13.height)
    v13 = v13o.mt_merge(v13b, v13_m, luma = true)
/*
    # 129 -> 130..138
    v13_m = v13_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v13_m = v13_m.gaussResize(vv13.width/8, v13.height/8).gaussResize(v13.width, v13.height)
    v13_129 = v13.trim(129, -1)
    v13 = v13.trim(0, 129) + v13.trim(130, 138).mt_merge(v13_129.loop(10), v13_m, luma = true) + v13.trim(139, 0)
*/
    return v13
}

va = BlankClip(v13, audio_rate = 48000, channels = 2).killVideo
v13 = v13.audioDub(va)

last = v13
prefetch

