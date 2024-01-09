import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v49_angle"))
{
    v49o = v49

    v49_m = v49.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v49 = v49.convertToRGB32(interlaced=false, matrix="PC.709")

    v49 = v49.ExInpaint(mask = v49_m)
    v49 = v49.convertToYV24(interlaced=false, matrix="PC.709")

    v49_m = v49_m.convertToYV24(interlaced=false, matrix="PC.709")
    v49_m = v49_m.gaussResize(v49.width/8, v49.height/8).gaussResize(v49.width, v49.height)
    v49b = v49.gaussResize(v49.width/16, v49.height/16).gaussResize(v49.width, v49.height)
    v49 = v49o.mt_merge(v49b, v49_m, luma = true)
}
else
{
    v49 = v49.fill_wedges(a = v49_angle, t_dh = 10, r_dw = 20)

    v49o = v49
    v49_m = v49.prepare_solid_mask(w = 140, h = 180)
    v49 = v49.convertToRGB32(interlaced=false, matrix="PC.709")
    v49 = v49.ExInpaint(mask = v49_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v49 = v49.convertToYV24(interlaced=false, matrix="PC.709")

    v49_m = v49_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v49_m = v49_m.gaussResize(v49.width/8, v49.height/8).gaussResize(v49.width, v49.height)
    v49b = v49.gaussResize(v49.width/16, v49.height/16).gaussResize(v49.width, v49.height)
    v49 = v49o.mt_merge(v49b, v49_m, luma = true)
/*
    # 129 -> 130..138
    v49_m = v49_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v49_m = v49_m.gaussResize(vv49.width/8, v49.height/8).gaussResize(v49.width, v49.height)
    v49_129 = v49.trim(129, -1)
    v49 = v49.trim(0, 129) + v49.trim(130, 138).mt_merge(v49_129.loop(10), v49_m, luma = true) + v49.trim(139, 0)
*/
    v49 = v49.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v49, audio_rate = 48000, channels = 2).killVideo
v49 = v49.audioDub(va)

last = v49
prefetch

