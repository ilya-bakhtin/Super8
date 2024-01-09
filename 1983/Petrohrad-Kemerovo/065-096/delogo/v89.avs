import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

/*
if (!varExist("v89_angle"))
{
    v89o = v89

    v89_m = v89.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v89 = v89.convertToRGB32(interlaced=false, matrix="PC.709")

    v89 = v89.ExInpaint(mask = v89_m)
    v89 = v89.convertToYV24(interlaced=false, matrix="PC.709")

    v89_m = v89_m.convertToYV24(interlaced=false, matrix="PC.709")
    v89_m = v89_m.gaussResize(v89.width/8, v89.height/8).gaussResize(v89.width, v89.height)
    v89b = v89.gaussResize(v89.width/16, v89.height/16).gaussResize(v89.width, v89.height)
    v89 = v89o.mt_merge(v89b, v89_m, luma = true)
}
else
{
    v89 = v89.fill_wedges(a = v89_angle)

    v89o = v89
    v89_m = v89.prepare_solid_mask(w = 160, h = 170)
    v89 = v89.convertToRGB32(interlaced=false, matrix="PC.709")
    v89 = v89.ExInpaint(mask = v89_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v89 = v89.convertToYV24(interlaced=false, matrix="PC.709")

    v89_m = v89_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v89_m = v89_m.gaussResize(v89.width/8, v89.height/8).gaussResize(v89.width, v89.height)
    v89b = v89.gaussResize(v89.width/16, v89.height/16).gaussResize(v89.width, v89.height)
    v89 = v89o.mt_merge(v89b, v89_m, luma = true)

    # 129 -> 130..138
    v89_m = v89_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v89_m = v89_m.gaussResize(vv89.width/8, v89.height/8).gaussResize(v89.width, v89.height)
    v89_129 = v89.trim(129, -1)
    v89 = v89.trim(0, 129) + v89.trim(130, 138).mt_merge(v89_129.loop(10), v89_m, luma = true) + v89.trim(139, 0)

    #v89 = v89.crop(78, 0, 0, -56)#.adjustBorders
}
*/

va = BlankClip(v89, audio_rate = 48000, channels = 2).killVideo
v89 = v89.audioDub(va)

last = v89
#prefetch
return last