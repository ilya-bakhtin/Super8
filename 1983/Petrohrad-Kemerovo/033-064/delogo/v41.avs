import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v41_angle"))
{
    v41o = v41

    v41_m = v41.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v41 = v41.convertToRGB32(interlaced=false, matrix="PC.709")

    v41 = v41.ExInpaint(mask = v41_m)
    v41 = v41.convertToYV24(interlaced=false, matrix="PC.709")

    v41_m = v41_m.convertToYV24(interlaced=false, matrix="PC.709")
    v41_m = v41_m.gaussResize(v41.width/8, v41.height/8).gaussResize(v41.width, v41.height)
    v41b = v41.gaussResize(v41.width/16, v41.height/16).gaussResize(v41.width, v41.height)
    v41 = v41o.mt_merge(v41b, v41_m, luma = true)
}
else
{
    v41 = v41.fill_wedges(a = v41_angle)

    v41o = v41
    v41_m = v41.prepare_solid_mask(w = 140, h = 180)
    v41 = v41.convertToRGB32(interlaced=false, matrix="PC.709")
    v41 = v41.ExInpaint(mask = v41_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v41 = v41.convertToYV24(interlaced=false, matrix="PC.709")

    v41_m = v41_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v41_m = v41_m.gaussResize(v41.width/8, v41.height/8).gaussResize(v41.width, v41.height)
    v41b = v41.gaussResize(v41.width/16, v41.height/16).gaussResize(v41.width, v41.height)
    v41 = v41o.mt_merge(v41b, v41_m, luma = true)
/*
    # 129 -> 130..138
    v41_m = v41_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v41_m = v41_m.gaussResize(vv41.width/8, v41.height/8).gaussResize(v41.width, v41.height)
    v41_129 = v41.trim(129, -1)
    v41 = v41.trim(0, 129) + v41.trim(130, 138).mt_merge(v41_129.loop(10), v41_m, luma = true) + v41.trim(139, 0)
*/
    v41 = v41.crop(80, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v41, audio_rate = 48000, channels = 2).killVideo
v41 = v41.audioDub(va)

last = v41
prefetch

