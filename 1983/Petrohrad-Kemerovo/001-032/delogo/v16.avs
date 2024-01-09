import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v16_angle"))
{
    v16o = v16

    v16_m = v16.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v16 = v16.convertToRGB32(interlaced=false, matrix="PC.709")

    v16 = v16.ExInpaint(mask = v16_m)
    v16 = v16.convertToYV24(interlaced=false, matrix="PC.709")

    v16_m = v16_m.convertToYV24(interlaced=false, matrix="PC.709")
    v16_m = v16_m.gaussResize(v16.width/8, v16.height/8).gaussResize(v16.width, v16.height)
    v16b = v16.gaussResize(v16.width/16, v16.height/16).gaussResize(v16.width, v16.height)
    v16 = v16o.mt_merge(v16b, v16_m, luma = true)
}
else
{
    v16 = v16.fill_wedges(a = v16_angle)

    v16o = v16
    v16_m = v16.prepare_solid_mask(w = 150, h = 150)
/*
    v16 = v16.convertToRGB32(interlaced=false, matrix="PC.709")
    v16 = v16.ExInpaint(mask = v16_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v16 = v16.convertToYV24(interlaced=false, matrix="PC.709")
*/
    exp = "sx 150 < x[150,0] x ?"
    v16 = v16.expr(exp, exp, exp)

    v16_m = v16_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v16_m = v16_m.gaussResize(v16.width/8, v16.height/8).gaussResize(v16.width, v16.height)
    v16b = v16.gaussResize(v16.width/16, v16.height/16).gaussResize(v16.width, v16.height)
    v16 = v16o.mt_merge(v16b, v16_m, luma = true)
/*
    # 129 -> 130..138
    v16_m = v16_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v16_m = v16_m.gaussResize(vv16.width/8, v16.height/8).gaussResize(v16.width, v16.height)
    v16_129 = v16.trim(129, -1)
    v16 = v16.trim(0, 129) + v16.trim(130, 138).mt_merge(v16_129.loop(10), v16_m, luma = true) + v16.trim(139, 0)
*/
    v16 = v16.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v16, audio_rate = 48000, channels = 2).killVideo
v16 = v16.audioDub(va)

last = v16
prefetch

