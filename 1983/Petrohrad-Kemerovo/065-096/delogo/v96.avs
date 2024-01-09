import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v96_angle"))
{
/*
    v96o = v96

    v96_m = v96.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v96 = v96.convertToRGB32(interlaced=false, matrix="PC.709")

    v96 = v96.ExInpaint(mask = v96_m)
    v96 = v96.convertToYV24(interlaced=false, matrix="PC.709")

    v96_m = v96_m.convertToYV24(interlaced=false, matrix="PC.709")
    v96_m = v96_m.gaussResize(v96.width/8, v96.height/8).gaussResize(v96.width, v96.height)
    v96b = v96.gaussResize(v96.width/16, v96.height/16).gaussResize(v96.width, v96.height)
    v96 = v96o.mt_merge(v96b, v96_m, luma = true)
*/
}
else
{
    v96 = v96.fill_wedges(a = v96_angle)

    v96o = v96
    v96_m = v96.prepare_solid_mask(w = 160, h = 170)
    v96 = v96.convertToRGB32(interlaced=false, matrix="PC.709")
    v96 = v96.ExInpaint(mask = v96_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v96 = v96.convertToYV24(interlaced=false, matrix="PC.709")

    v96_m = v96_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v96_m = v96_m.gaussResize(v96.width/8, v96.height/8).gaussResize(v96.width, v96.height)
    v96b = v96.gaussResize(v96.width/16, v96.height/16).gaussResize(v96.width, v96.height)
    v96 = v96o.mt_merge(v96b, v96_m, luma = true)
/*
    # 129 -> 130..138
    v96_m = v96_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v96_m = v96_m.gaussResize(vv96.width/8, v96.height/8).gaussResize(v96.width, v96.height)
    v96_129 = v96.trim(129, -1)
    v96 = v96.trim(0, 129) + v96.trim(130, 138).mt_merge(v96_129.loop(10), v96_m, luma = true) + v96.trim(139, 0)
*/
    #v96 = v96.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v96, audio_rate = 48000, channels = 2).killVideo
v96 = v96.audioDub(va)

last = v96
prefetch

