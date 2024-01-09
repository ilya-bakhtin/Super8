import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v18_angle"))
{
    v18o = v18

    v18_m = v18.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v18 = v18.convertToRGB32(interlaced=false, matrix="PC.709")

    v18 = v18.ExInpaint(mask = v18_m)
    v18 = v18.convertToYV24(interlaced=false, matrix="PC.709")

    v18_m = v18_m.convertToYV24(interlaced=false, matrix="PC.709")
    v18_m = v18_m.gaussResize(v18.width/8, v18.height/8).gaussResize(v18.width, v18.height)
    v18b = v18.gaussResize(v18.width/16, v18.height/16).gaussResize(v18.width, v18.height)
    v18 = v18o.mt_merge(v18b, v18_m, luma = true)
}
else
{
    v18 = v18.fill_wedges(a = v18_angle)

    v18o = v18
    v18_m = v18.prepare_solid_mask(w = 160, h = 170)
    v18 = v18.convertToRGB32(interlaced=false, matrix="PC.709")
    v18 = v18.ExInpaint(mask = v18_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v18 = v18.convertToYV24(interlaced=false, matrix="PC.709")

    v18_m = v18_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v18_m = v18_m.gaussResize(v18.width/8, v18.height/8).gaussResize(v18.width, v18.height)
    v18b = v18.gaussResize(v18.width/16, v18.height/16).gaussResize(v18.width, v18.height)
    v18 = v18o.mt_merge(v18b, v18_m, luma = true)
/*
    # 129 -> 130..138
    v18_m = v18_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v18_m = v18_m.gaussResize(vv18.width/8, v18.height/8).gaussResize(v18.width, v18.height)
    v18_129 = v18.trim(129, -1)
    v18 = v18.trim(0, 129) + v18.trim(130, 138).mt_merge(v18_129.loop(10), v18_m, luma = true) + v18.trim(139, 0)
*/
    v18 = v18.crop(78, 0, 0, -54)#.adjustBorders
}

va = BlankClip(v18, audio_rate = 48000, channels = 2).killVideo
v18 = v18.audioDub(va)

last = v18
prefetch

