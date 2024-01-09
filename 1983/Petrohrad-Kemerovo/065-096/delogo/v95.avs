import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v95_angle"))
{
/*
    v95o = v95

    v95_m = v95.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v95 = v95.convertToRGB32(interlaced=false, matrix="PC.709")

    v95 = v95.ExInpaint(mask = v95_m)
    v95 = v95.convertToYV24(interlaced=false, matrix="PC.709")

    v95_m = v95_m.convertToYV24(interlaced=false, matrix="PC.709")
    v95_m = v95_m.gaussResize(v95.width/8, v95.height/8).gaussResize(v95.width, v95.height)
    v95b = v95.gaussResize(v95.width/16, v95.height/16).gaussResize(v95.width, v95.height)
    v95 = v95o.mt_merge(v95b, v95_m, luma = true)
*/
}
else
{
    v95 = v95.fill_wedges(a = v95_angle)

    v95o = v95
    v95_m = v95.prepare_solid_mask(w = 160, h = 170)
    v95 = v95.convertToRGB32(interlaced=false, matrix="PC.709")
    v95 = v95.ExInpaint(mask = v95_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v95 = v95.convertToYV24(interlaced=false, matrix="PC.709")

    v95_m = v95_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v95_m = v95_m.gaussResize(v95.width/8, v95.height/8).gaussResize(v95.width, v95.height)
    v95b = v95.gaussResize(v95.width/16, v95.height/16).gaussResize(v95.width, v95.height)
    v95 = v95o.mt_merge(v95b, v95_m, luma = true)
/*
    # 129 -> 130..138
    v95_m = v95_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v95_m = v95_m.gaussResize(vv95.width/8, v95.height/8).gaussResize(v95.width, v95.height)
    v95_129 = v95.trim(129, -1)
    v95 = v95.trim(0, 129) + v95.trim(130, 138).mt_merge(v95_129.loop(10), v95_m, luma = true) + v95.trim(139, 0)
*/
    #v95 = v95.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v95, audio_rate = 48000, channels = 2).killVideo
v95 = v95.audioDub(va)

last = v95
prefetch

