import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v38_angle"))
{
    v38o = v38

    v38_m = v38.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v38 = v38.convertToRGB32(interlaced=false, matrix="PC.709")

    v38 = v38.ExInpaint(mask = v38_m)
    v38 = v38.convertToYV24(interlaced=false, matrix="PC.709")

    v38_m = v38_m.convertToYV24(interlaced=false, matrix="PC.709")
    v38_m = v38_m.gaussResize(v38.width/8, v38.height/8).gaussResize(v38.width, v38.height)
    v38b = v38.gaussResize(v38.width/16, v38.height/16).gaussResize(v38.width, v38.height)
    v38 = v38o.mt_merge(v38b, v38_m, luma = true)
}
else
{
    v38 = v38.fill_wedges(a = v38_angle)

    v38o = v38
    v38_m = v38.prepare_solid_mask(w = 170, h = 160)
    v38 = v38.convertToRGB32(interlaced=false, matrix="PC.709")
    v38 = v38.ExInpaint(mask = v38_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v38 = v38.convertToYV24(interlaced=false, matrix="PC.709")

    v38_m = v38_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v38_m = v38_m.gaussResize(v38.width/8, v38.height/8).gaussResize(v38.width, v38.height)
    v38b = v38.gaussResize(v38.width/16, v38.height/16).gaussResize(v38.width, v38.height)
    v38 = v38o.mt_merge(v38b, v38_m, luma = true)
/*
    # 129 -> 130..138
    v38_m = v38_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v38_m = v38_m.gaussResize(vv38.width/8, v38.height/8).gaussResize(v38.width, v38.height)
    v38_129 = v38.trim(129, -1)
    v38 = v38.trim(0, 129) + v38.trim(130, 138).mt_merge(v38_129.loop(10), v38_m, luma = true) + v38.trim(139, 0)
*/
    v38 = v38.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v38, audio_rate = 48000, channels = 2).killVideo
v38 = v38.audioDub(va)

last = v38
prefetch

