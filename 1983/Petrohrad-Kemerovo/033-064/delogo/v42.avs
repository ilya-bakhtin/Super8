import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v42_angle"))
{
    v42o = v42

    v42_m = v42.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v42 = v42.convertToRGB32(interlaced=false, matrix="PC.709")

    v42 = v42.ExInpaint(mask = v42_m)
    v42 = v42.convertToYV24(interlaced=false, matrix="PC.709")

    v42_m = v42_m.convertToYV24(interlaced=false, matrix="PC.709")
    v42_m = v42_m.gaussResize(v42.width/8, v42.height/8).gaussResize(v42.width, v42.height)
    v42b = v42.gaussResize(v42.width/16, v42.height/16).gaussResize(v42.width, v42.height)
    v42 = v42o.mt_merge(v42b, v42_m, luma = true)
}
else
{
    v42 = v42.fill_wedges(a = v42_angle)

    v42o = v42
    v42_m = v42.prepare_solid_mask(w = 160, h = 170)
    v42 = v42.convertToRGB32(interlaced=false, matrix="PC.709")
    v42 = v42.ExInpaint(mask = v42_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v42 = v42.convertToYV24(interlaced=false, matrix="PC.709")

    v42_m = v42_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v42_m = v42_m.gaussResize(v42.width/8, v42.height/8).gaussResize(v42.width, v42.height)
    v42b = v42.gaussResize(v42.width/16, v42.height/16).gaussResize(v42.width, v42.height)
    v42 = v42o.mt_merge(v42b, v42_m, luma = true)
/*
    # 129 -> 130..138
    v42_m = v42_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v42_m = v42_m.gaussResize(vv42.width/8, v42.height/8).gaussResize(v42.width, v42.height)
    v42_129 = v42.trim(129, -1)
    v42 = v42.trim(0, 129) + v42.trim(130, 138).mt_merge(v42_129.loop(10), v42_m, luma = true) + v42.trim(139, 0)
*/
    v42 = v42.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v42, audio_rate = 48000, channels = 2).killVideo
v42 = v42.audioDub(va)

last = v42
prefetch

