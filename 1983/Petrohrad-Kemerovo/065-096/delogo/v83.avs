import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v83_angle"))
{
    v83o = v83

    v83_m = v83.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v83 = v83.convertToRGB32(interlaced=false, matrix="PC.709")

    v83 = v83.ExInpaint(mask = v83_m)
    v83 = v83.convertToYV24(interlaced=false, matrix="PC.709")

    v83_m = v83_m.convertToYV24(interlaced=false, matrix="PC.709")
    v83_m = v83_m.gaussResize(v83.width/8, v83.height/8).gaussResize(v83.width, v83.height)
    v83b = v83.gaussResize(v83.width/16, v83.height/16).gaussResize(v83.width, v83.height)
    v83 = v83o.mt_merge(v83b, v83_m, luma = true)
}
else
{
    v83 = v83.fill_wedges(a = v83_angle)

    v83o = v83
    v83_m = v83.prepare_solid_mask(w = 140, h = 180)
    v83 = v83.convertToRGB32(interlaced=false, matrix="PC.709")
    v83 = v83.ExInpaint(mask = v83_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v83 = v83.convertToYV24(interlaced=false, matrix="PC.709")

    v83_m = v83_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v83_m = v83_m.gaussResize(v83.width/8, v83.height/8).gaussResize(v83.width, v83.height)
    v83b = v83.gaussResize(v83.width/16, v83.height/16).gaussResize(v83.width, v83.height)
    v83 = v83o.mt_merge(v83b, v83_m, luma = true)
/*
    # 129 -> 130..138
    v83_m = v83_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v83_m = v83_m.gaussResize(vv83.width/8, v83.height/8).gaussResize(v83.width, v83.height)
    v83_129 = v83.trim(129, -1)
    v83 = v83.trim(0, 129) + v83.trim(130, 138).mt_merge(v83_129.loop(10), v83_m, luma = true) + v83.trim(139, 0)
*/
    v83 = v83.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v83, audio_rate = 48000, channels = 2).killVideo
v83 = v83.audioDub(va)

last = v83
prefetch

