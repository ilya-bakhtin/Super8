import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v50_angle"))
{
    v50o = v50

    v50_m = v50.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v50 = v50.convertToRGB32(interlaced=false, matrix="PC.709")

    v50 = v50.ExInpaint(mask = v50_m)
    v50 = v50.convertToYV24(interlaced=false, matrix="PC.709")

    v50_m = v50_m.convertToYV24(interlaced=false, matrix="PC.709")
    v50_m = v50_m.gaussResize(v50.width/8, v50.height/8).gaussResize(v50.width, v50.height)
    v50b = v50.gaussResize(v50.width/16, v50.height/16).gaussResize(v50.width, v50.height)
    v50 = v50o.mt_merge(v50b, v50_m, luma = true)
}
else
{
    v50 = v50.fill_wedges(a = v50_angle, t_dh = 10, r_dw = 20)

    v50o = v50
    v50_m = v50.prepare_solid_mask(w = 140, h = 180)
    v50 = v50.convertToRGB32(interlaced=false, matrix="PC.709")
    v50 = v50.ExInpaint(mask = v50_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v50 = v50.convertToYV24(interlaced=false, matrix="PC.709")

    v50_m = v50_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v50_m = v50_m.gaussResize(v50.width/8, v50.height/8).gaussResize(v50.width, v50.height)
    v50b = v50.gaussResize(v50.width/16, v50.height/16).gaussResize(v50.width, v50.height)
    v50 = v50o.mt_merge(v50b, v50_m, luma = true)
/*
    # 129 -> 130..138
    v50_m = v50_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v50_m = v50_m.gaussResize(vv50.width/8, v50.height/8).gaussResize(v50.width, v50.height)
    v50_129 = v50.trim(129, -1)
    v50 = v50.trim(0, 129) + v50.trim(130, 138).mt_merge(v50_129.loop(10), v50_m, luma = true) + v50.trim(139, 0)
*/
    v50 = v50.crop(80, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v50, audio_rate = 48000, channels = 2).killVideo
v50 = v50.audioDub(va)

last = v50
prefetch

