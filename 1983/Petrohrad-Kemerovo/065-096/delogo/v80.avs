import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v80_angle"))
{
    v80o = v80

    v80_m = v80.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v80 = v80.convertToRGB32(interlaced=false, matrix="PC.709")

    v80 = v80.ExInpaint(mask = v80_m)
    v80 = v80.convertToYV24(interlaced=false, matrix="PC.709")

    v80_m = v80_m.convertToYV24(interlaced=false, matrix="PC.709")
    v80_m = v80_m.gaussResize(v80.width/8, v80.height/8).gaussResize(v80.width, v80.height)
    v80b = v80.gaussResize(v80.width/16, v80.height/16).gaussResize(v80.width, v80.height)
    v80 = v80o.mt_merge(v80b, v80_m, luma = true)
}
else
{
    v80 = v80.fill_wedges(a = v80_angle)

    v80o = v80
    v80_m = v80.prepare_solid_mask(w = 140, h = 180)
    v80 = v80.convertToRGB32(interlaced=false, matrix="PC.709")
    v80 = v80.ExInpaint(mask = v80_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v80 = v80.convertToYV24(interlaced=false, matrix="PC.709")

    v80_m = v80_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v80_m = v80_m.gaussResize(v80.width/8, v80.height/8).gaussResize(v80.width, v80.height)
    v80b = v80.gaussResize(v80.width/16, v80.height/16).gaussResize(v80.width, v80.height)
    v80 = v80o.mt_merge(v80b, v80_m, luma = true)
/*
    # 129 -> 130..138
    v80_m = v80_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v80_m = v80_m.gaussResize(vv80.width/8, v80.height/8).gaussResize(v80.width, v80.height)
    v80_129 = v80.trim(129, -1)
    v80 = v80.trim(0, 129) + v80.trim(130, 138).mt_merge(v80_129.loop(10), v80_m, luma = true) + v80.trim(139, 0)
*/
    v80 = v80.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v80, audio_rate = 48000, channels = 2).killVideo
v80 = v80.audioDub(va)

last = v80
prefetch

