import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v40_angle"))
{
    v40o = v40

    v40_m = v40.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v40 = v40.convertToRGB32(interlaced=false, matrix="PC.709")

    v40 = v40.ExInpaint(mask = v40_m)
    v40 = v40.convertToYV24(interlaced=false, matrix="PC.709")

    v40_m = v40_m.convertToYV24(interlaced=false, matrix="PC.709")
    v40_m = v40_m.gaussResize(v40.width/8, v40.height/8).gaussResize(v40.width, v40.height)
    v40b = v40.gaussResize(v40.width/16, v40.height/16).gaussResize(v40.width, v40.height)
    v40 = v40o.mt_merge(v40b, v40_m, luma = true)
}
else
{
    v40 = v40.fill_wedges(a = v40_angle)

    v40o = v40
    v40_m = v40.prepare_solid_mask(w = 160, h = 150)
    v40 = v40.convertToRGB32(interlaced=false, matrix="PC.709")
    v40 = v40.ExInpaint(mask = v40_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v40 = v40.convertToYV24(interlaced=false, matrix="PC.709")

    v40_m = v40_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v40_m = v40_m.gaussResize(v40.width/8, v40.height/8).gaussResize(v40.width, v40.height)
    v40b = v40.gaussResize(v40.width/16, v40.height/16).gaussResize(v40.width, v40.height)
    v40 = v40o.mt_merge(v40b, v40_m, luma = true)
/*
    # 129 -> 130..138
    v40_m = v40_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v40_m = v40_m.gaussResize(vv40.width/8, v40.height/8).gaussResize(v40.width, v40.height)
    v40_129 = v40.trim(129, -1)
    v40 = v40.trim(0, 129) + v40.trim(130, 138).mt_merge(v40_129.loop(10), v40_m, luma = true) + v40.trim(139, 0)
*/
    v40 = v40.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v40, audio_rate = 48000, channels = 2).killVideo
v40 = v40.audioDub(va)

last = v40
prefetch

