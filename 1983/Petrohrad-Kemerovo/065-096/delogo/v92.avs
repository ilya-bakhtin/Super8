import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v92_angle"))
{
/*
    v92o = v92

    v92_m = v92.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v92 = v92.convertToRGB32(interlaced=false, matrix="PC.709")

    v92 = v92.ExInpaint(mask = v92_m)
    v92 = v92.convertToYV24(interlaced=false, matrix="PC.709")

    v92_m = v92_m.convertToYV24(interlaced=false, matrix="PC.709")
    v92_m = v92_m.gaussResize(v92.width/8, v92.height/8).gaussResize(v92.width, v92.height)
    v92b = v92.gaussResize(v92.width/16, v92.height/16).gaussResize(v92.width, v92.height)
    v92 = v92o.mt_merge(v92b, v92_m, luma = true)
*/
}
else
{
    v92 = v92.fill_wedges(a = v92_angle)

    v92o = v92
    v92_m = v92.prepare_solid_mask(w = 160, h = 170)
    v92 = v92.convertToRGB32(interlaced=false, matrix="PC.709")
    v92 = v92.ExInpaint(mask = v92_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v92 = v92.convertToYV24(interlaced=false, matrix="PC.709")

    v92_m = v92_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v92_m = v92_m.gaussResize(v92.width/8, v92.height/8).gaussResize(v92.width, v92.height)
    v92b = v92.gaussResize(v92.width/16, v92.height/16).gaussResize(v92.width, v92.height)
    v92 = v92o.mt_merge(v92b, v92_m, luma = true)
/*
    # 129 -> 130..138
    v92_m = v92_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v92_m = v92_m.gaussResize(vv92.width/8, v92.height/8).gaussResize(v92.width, v92.height)
    v92_129 = v92.trim(129, -1)
    v92 = v92.trim(0, 129) + v92.trim(130, 138).mt_merge(v92_129.loop(10), v92_m, luma = true) + v92.trim(139, 0)
*/
    #v92 = v92.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v92, audio_rate = 48000, channels = 2).killVideo
v92 = v92.audioDub(va)

last = v92
prefetch

