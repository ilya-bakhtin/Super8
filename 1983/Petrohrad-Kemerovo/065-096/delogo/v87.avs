import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v87_angle"))
{
/*
    v87o = v87

    v87_m = v87.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v87 = v87.convertToRGB32(interlaced=false, matrix="PC.709")

    v87 = v87.ExInpaint(mask = v87_m)
    v87 = v87.convertToYV24(interlaced=false, matrix="PC.709")

    v87_m = v87_m.convertToYV24(interlaced=false, matrix="PC.709")
    v87_m = v87_m.gaussResize(v87.width/8, v87.height/8).gaussResize(v87.width, v87.height)
    v87b = v87.gaussResize(v87.width/16, v87.height/16).gaussResize(v87.width, v87.height)
    v87 = v87o.mt_merge(v87b, v87_m, luma = true)
*/
}
else
{
    v87 = v87.fill_wedges(a = v87_angle)

    v87o = v87
    v87_m = v87.prepare_solid_mask(w = 160, h = 170)
    v87 = v87.convertToRGB32(interlaced=false, matrix="PC.709")
    v87 = v87.ExInpaint(mask = v87_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v87 = v87.convertToYV24(interlaced=false, matrix="PC.709")

    v87_m = v87_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v87_m = v87_m.gaussResize(v87.width/8, v87.height/8).gaussResize(v87.width, v87.height)
    v87b = v87.gaussResize(v87.width/16, v87.height/16).gaussResize(v87.width, v87.height)
    v87 = v87o.mt_merge(v87b, v87_m, luma = true)
/*
    # 129 -> 130..138
    v87_m = v87_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v87_m = v87_m.gaussResize(vv87.width/8, v87.height/8).gaussResize(v87.width, v87.height)
    v87_129 = v87.trim(129, -1)
    v87 = v87.trim(0, 129) + v87.trim(130, 138).mt_merge(v87_129.loop(10), v87_m, luma = true) + v87.trim(139, 0)
*/
    #v87 = v87.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v87, audio_rate = 48000, channels = 2).killVideo
v87 = v87.audioDub(va)

last = v87
prefetch

