import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v91_angle"))
{
/*
    v91o = v91

    v91_m = v91.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v91 = v91.convertToRGB32(interlaced=false, matrix="PC.709")

    v91 = v91.ExInpaint(mask = v91_m)
    v91 = v91.convertToYV24(interlaced=false, matrix="PC.709")

    v91_m = v91_m.convertToYV24(interlaced=false, matrix="PC.709")
    v91_m = v91_m.gaussResize(v91.width/8, v91.height/8).gaussResize(v91.width, v91.height)
    v91b = v91.gaussResize(v91.width/16, v91.height/16).gaussResize(v91.width, v91.height)
    v91 = v91o.mt_merge(v91b, v91_m, luma = true)
*/
}
else
{
    v91 = v91.fill_wedges(a = v91_angle)

    v91o = v91
    v91_m = v91.prepare_solid_mask(w = 160, h = 170)
    v91 = v91.convertToRGB32(interlaced=false, matrix="PC.709")
    v91 = v91.ExInpaint(mask = v91_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v91 = v91.convertToYV24(interlaced=false, matrix="PC.709")

    v91_m = v91_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v91_m = v91_m.gaussResize(v91.width/8, v91.height/8).gaussResize(v91.width, v91.height)
    v91b = v91.gaussResize(v91.width/16, v91.height/16).gaussResize(v91.width, v91.height)
    v91 = v91o.mt_merge(v91b, v91_m, luma = true)
/*
    # 129 -> 130..138
    v91_m = v91_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v91_m = v91_m.gaussResize(vv91.width/8, v91.height/8).gaussResize(v91.width, v91.height)
    v91_129 = v91.trim(129, -1)
    v91 = v91.trim(0, 129) + v91.trim(130, 138).mt_merge(v91_129.loop(10), v91_m, luma = true) + v91.trim(139, 0)
*/
    #v91 = v91.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v91, audio_rate = 48000, channels = 2).killVideo
v91 = v91.audioDub(va)

last = v91
prefetch

