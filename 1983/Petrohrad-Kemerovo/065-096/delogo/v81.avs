import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v81_angle"))
{
    v81o = v81

    v81_m = v81.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v81 = v81.convertToRGB32(interlaced=false, matrix="PC.709")

    v81 = v81.ExInpaint(mask = v81_m)
    v81 = v81.convertToYV24(interlaced=false, matrix="PC.709")

    v81_m = v81_m.convertToYV24(interlaced=false, matrix="PC.709")
    v81_m = v81_m.gaussResize(v81.width/8, v81.height/8).gaussResize(v81.width, v81.height)
    v81b = v81.gaussResize(v81.width/16, v81.height/16).gaussResize(v81.width, v81.height)
    v81 = v81o.mt_merge(v81b, v81_m, luma = true)
}
else
{
    v81 = v81.fill_wedges(a = v81_angle)

    v81o = v81
    v81_m = v81.prepare_solid_mask(w = 150, h = 170)
    v81 = v81.convertToRGB32(interlaced=false, matrix="PC.709")
    v81 = v81.ExInpaint(mask = v81_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v81 = v81.convertToYV24(interlaced=false, matrix="PC.709")

    v81_m = v81_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v81_m = v81_m.gaussResize(v81.width/8, v81.height/8).gaussResize(v81.width, v81.height)
    v81b = v81.gaussResize(v81.width/16, v81.height/16).gaussResize(v81.width, v81.height)
    v81 = v81o.mt_merge(v81b, v81_m, luma = true)
/*
    # 129 -> 130..138
    v81_m = v81_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v81_m = v81_m.gaussResize(vv81.width/8, v81.height/8).gaussResize(v81.width, v81.height)
    v81_129 = v81.trim(129, -1)
    v81 = v81.trim(0, 129) + v81.trim(130, 138).mt_merge(v81_129.loop(10), v81_m, luma = true) + v81.trim(139, 0)
*/
    v81 = v81.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v81, audio_rate = 48000, channels = 2).killVideo
v81 = v81.audioDub(va)

last = v81
prefetch

