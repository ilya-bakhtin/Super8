import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v34_angle"))
{
    v34o = v34

    v34_m = v34.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v34 = v34.convertToRGB32(interlaced=false, matrix="PC.709")

    v34 = v34.ExInpaint(mask = v34_m)
    v34 = v34.convertToYV24(interlaced=false, matrix="PC.709")

    v34_m = v34_m.convertToYV24(interlaced=false, matrix="PC.709")
    v34_m = v34_m.gaussResize(v34.width/8, v34.height/8).gaussResize(v34.width, v34.height)
    v34b = v34.gaussResize(v34.width/16, v34.height/16).gaussResize(v34.width, v34.height)
    v34 = v34o.mt_merge(v34b, v34_m, luma = true)
}
else
{
    v34 = v34.fill_wedges(a = v34_angle)

    v34o = v34
    v34_m = v34.prepare_solid_mask(w = 180, h = 140)
    v34 = v34.convertToRGB32(interlaced=false, matrix="PC.709")
    v34 = v34.ExInpaint(mask = v34_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v34 = v34.convertToYV24(interlaced=false, matrix="PC.709")

    v34_m = v34_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v34_m = v34_m.gaussResize(v34.width/8, v34.height/8).gaussResize(v34.width, v34.height)
    v34b = v34.gaussResize(v34.width/16, v34.height/16).gaussResize(v34.width, v34.height)
    v34 = v34o.mt_merge(v34b, v34_m, luma = true)
/*
    # 129 -> 130..138
    v34_m = v34_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v34_m = v34_m.gaussResize(vv34.width/8, v34.height/8).gaussResize(v34.width, v34.height)
    v34_129 = v34.trim(129, -1)
    v34 = v34.trim(0, 129) + v34.trim(130, 138).mt_merge(v34_129.loop(10), v34_m, luma = true) + v34.trim(139, 0)
*/
    v34 = v34.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v34, audio_rate = 48000, channels = 2).killVideo
v34 = v34.audioDub(va)

last = v34
prefetch

