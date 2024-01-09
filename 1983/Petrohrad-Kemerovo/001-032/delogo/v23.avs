import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v23_angle"))
{
    v23o = v23

    v23_m = v23.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v23 = v23.convertToRGB32(interlaced=false, matrix="PC.709")

    v23 = v23.ExInpaint(mask = v23_m)
    v23 = v23.convertToYV24(interlaced=false, matrix="PC.709")

    v23_m = v23_m.convertToYV24(interlaced=false, matrix="PC.709")
    v23_m = v23_m.gaussResize(v23.width/8, v23.height/8).gaussResize(v23.width, v23.height)
    v23b = v23.gaussResize(v23.width/16, v23.height/16).gaussResize(v23.width, v23.height)
    v23 = v23o.mt_merge(v23b, v23_m, luma = true)
}
else
{
    v23 = v23.animate(70, 120, "do_update_23", 1., 3.)
}

function do_update_23(clip v23, float a)
{
    v23 = v23.fill_wedges(a = a)

    v23o = v23
    v23_m = v23.prepare_solid_mask(w = 180, h = 150)
    v23 = v23.convertToRGB32(interlaced=false, matrix="PC.709")
    v23 = v23.ExInpaint(mask = v23_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v23 = v23.convertToYV24(interlaced=false, matrix="PC.709")

    v23_m = v23_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v23_m = v23_m.gaussResize(v23.width/8, v23.height/8).gaussResize(v23.width, v23.height)
    v23b = v23.gaussResize(v23.width/16, v23.height/16).gaussResize(v23.width, v23.height)
    v23 = v23o.mt_merge(v23b, v23_m, luma = true)
/*
    # 129 -> 130..138
    v23_m = v23_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v23_m = v23_m.gaussResize(vv23.width/8, v23.height/8).gaussResize(v23.width, v23.height)
    v23_129 = v23.trim(129, -1)
    v23 = v23.trim(0, 129) + v23.trim(130, 138).mt_merge(v23_129.loop(10), v23_m, luma = true) + v23.trim(139, 0)
*/
    #v23 = v23.crop(78, 0, 0, -56)#.adjustBorders
    return v23
}

va = BlankClip(v23, audio_rate = 48000, channels = 2).killVideo
v23 = v23.audioDub(va)

last = v23
prefetch

