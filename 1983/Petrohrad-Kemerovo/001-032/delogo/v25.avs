import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v25_angle"))
{
    v25o = v25

    v25_m = v25.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v25 = v25.convertToRGB32(interlaced=false, matrix="PC.709")

    v25 = v25.ExInpaint(mask = v25_m)
    v25 = v25.convertToYV24(interlaced=false, matrix="PC.709")

    v25_m = v25_m.convertToYV24(interlaced=false, matrix="PC.709")
    v25_m = v25_m.gaussResize(v25.width/8, v25.height/8).gaussResize(v25.width, v25.height)
    v25b = v25.gaussResize(v25.width/16, v25.height/16).gaussResize(v25.width, v25.height)
    v25 = v25o.mt_merge(v25b, v25_m, luma = true)
}
else
{
    v25 = v25.fill_wedges(a = v25_angle, t_dh = 20, r_dw = 20)

    v25o = v25
    v25_m = v25.prepare_solid_mask(w = 140, h = 200)
    v25 = v25.convertToRGB32(interlaced=false, matrix="PC.709")
    v25 = v25.ExInpaint(mask = v25_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v25 = v25.convertToYV24(interlaced=false, matrix="PC.709")

    v25_m = v25_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v25_m = v25_m.gaussResize(v25.width/8, v25.height/8).gaussResize(v25.width, v25.height)
    v25b = v25.gaussResize(v25.width/16, v25.height/16).gaussResize(v25.width, v25.height)
    v25 = v25o.mt_merge(v25b, v25_m, luma = true)
/*
    # 129 -> 130..138
    v25_m = v25_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v25_m = v25_m.gaussResize(vv25.width/8, v25.height/8).gaussResize(v25.width, v25.height)
    v25_129 = v25.trim(129, -1)
    v25 = v25.trim(0, 129) + v25.trim(130, 138).mt_merge(v25_129.loop(10), v25_m, luma = true) + v25.trim(139, 0)
*/
    v25 = v25.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v25, audio_rate = 48000, channels = 2).killVideo
v25 = v25.audioDub(va)

last = v25
prefetch

