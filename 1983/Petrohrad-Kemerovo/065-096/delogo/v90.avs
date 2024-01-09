import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v90_angle"))
{
/*
    v90o = v90

    v90_m = v90.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v90 = v90.convertToRGB32(interlaced=false, matrix="PC.709")

    v90 = v90.ExInpaint(mask = v90_m)
    v90 = v90.convertToYV24(interlaced=false, matrix="PC.709")

    v90_m = v90_m.convertToYV24(interlaced=false, matrix="PC.709")
    v90_m = v90_m.gaussResize(v90.width/8, v90.height/8).gaussResize(v90.width, v90.height)
    v90b = v90.gaussResize(v90.width/16, v90.height/16).gaussResize(v90.width, v90.height)
    v90 = v90o.mt_merge(v90b, v90_m, luma = true)
*/
}
else
{
    v90 = v90.fill_wedges(a = v90_angle)

    v90o = v90
    v90_m = v90.prepare_solid_mask(w = 160, h = 170)
    v90 = v90.convertToRGB32(interlaced=false, matrix="PC.709")
    v90 = v90.ExInpaint(mask = v90_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v90 = v90.convertToYV24(interlaced=false, matrix="PC.709")

    v90_m = v90_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v90_m = v90_m.gaussResize(v90.width/8, v90.height/8).gaussResize(v90.width, v90.height)
    v90b = v90.gaussResize(v90.width/16, v90.height/16).gaussResize(v90.width, v90.height)
    v90 = v90o.mt_merge(v90b, v90_m, luma = true)
/*
    # 129 -> 130..138
    v90_m = v90_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v90_m = v90_m.gaussResize(vv90.width/8, v90.height/8).gaussResize(v90.width, v90.height)
    v90_129 = v90.trim(129, -1)
    v90 = v90.trim(0, 129) + v90.trim(130, 138).mt_merge(v90_129.loop(10), v90_m, luma = true) + v90.trim(139, 0)
*/
    #v90 = v90.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v90, audio_rate = 48000, channels = 2).killVideo
v90 = v90.audioDub(va)

last = v90
prefetch

