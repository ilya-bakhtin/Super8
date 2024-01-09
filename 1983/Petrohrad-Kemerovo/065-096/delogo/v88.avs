import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v88_angle"))
{
/*
    v88o = v88

    v88_m = v88.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v88 = v88.convertToRGB32(interlaced=false, matrix="PC.709")

    v88 = v88.ExInpaint(mask = v88_m)
    v88 = v88.convertToYV24(interlaced=false, matrix="PC.709")

    v88_m = v88_m.convertToYV24(interlaced=false, matrix="PC.709")
    v88_m = v88_m.gaussResize(v88.width/8, v88.height/8).gaussResize(v88.width, v88.height)
    v88b = v88.gaussResize(v88.width/16, v88.height/16).gaussResize(v88.width, v88.height)
    v88 = v88o.mt_merge(v88b, v88_m, luma = true)
*/
}
else
{
    v88 = v88.fill_wedges(a = v88_angle)

    v88o = v88
    v88_m = v88.prepare_solid_mask(w = 160, h = 170)
    v88 = v88.convertToRGB32(interlaced=false, matrix="PC.709")
    v88 = v88.ExInpaint(mask = v88_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v88 = v88.convertToYV24(interlaced=false, matrix="PC.709")

    v88_m = v88_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v88_m = v88_m.gaussResize(v88.width/8, v88.height/8).gaussResize(v88.width, v88.height)
    v88b = v88.gaussResize(v88.width/16, v88.height/16).gaussResize(v88.width, v88.height)
    v88 = v88o.mt_merge(v88b, v88_m, luma = true)
/*
    # 129 -> 130..138
    v88_m = v88_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v88_m = v88_m.gaussResize(vv88.width/8, v88.height/8).gaussResize(v88.width, v88.height)
    v88_129 = v88.trim(129, -1)
    v88 = v88.trim(0, 129) + v88.trim(130, 138).mt_merge(v88_129.loop(10), v88_m, luma = true) + v88.trim(139, 0)
*/
    #v88 = v88.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v88, audio_rate = 48000, channels = 2).killVideo
v88 = v88.audioDub(va)

last = v88
prefetch

