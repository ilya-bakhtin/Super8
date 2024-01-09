import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v56_angle"))
{
    v56o = v56

    v56_m = v56.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 200)

    v56 = v56.convertToRGB32(interlaced=false, matrix="PC.709")

    v56 = v56.ExInpaint(mask = v56_m)
    v56 = v56.convertToYV24(interlaced=false, matrix="PC.709")

    v56_m = v56_m.convertToYV24(interlaced=false, matrix="PC.709")
    v56_m = v56_m.gaussResize(v56.width/8, v56.height/8).gaussResize(v56.width, v56.height)
    v56b = v56.gaussResize(v56.width/16, v56.height/16).gaussResize(v56.width, v56.height)
    v56 = v56o.mt_merge(v56b, v56_m, luma = true)
}
else
{
    v56 = v56.fill_wedges(a = v56_angle)

    v56o = v56
    v56_m = v56.prepare_solid_mask(w = 160, h = 170)
    v56 = v56.convertToRGB32(interlaced=false, matrix="PC.709")
    v56 = v56.ExInpaint(mask = v56_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v56 = v56.convertToYV24(interlaced=false, matrix="PC.709")

    v56_m = v56_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v56_m = v56_m.gaussResize(v56.width/8, v56.height/8).gaussResize(v56.width, v56.height)
    v56b = v56.gaussResize(v56.width/16, v56.height/16).gaussResize(v56.width, v56.height)
    v56 = v56o.mt_merge(v56b, v56_m, luma = true)
/*
    # 129 -> 130..138
    v56_m = v56_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v56_m = v56_m.gaussResize(vv56.width/8, v56.height/8).gaussResize(v56.width, v56.height)
    v56_129 = v56.trim(129, -1)
    v56 = v56.trim(0, 129) + v56.trim(130, 138).mt_merge(v56_129.loop(10), v56_m, luma = true) + v56.trim(139, 0)
*/
}
v56 = v56.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v56, audio_rate = 48000, channels = 2).killVideo
v56 = v56.audioDub(va)

last = v56
prefetch

