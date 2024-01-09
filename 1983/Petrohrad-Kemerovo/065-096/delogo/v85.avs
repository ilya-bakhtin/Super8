import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v85_angle"))
{
    v85o = v85

    v85_m = v85.PrepareMask(mask_w = 150, mask_h = 100)#(mask_tolerance = 200)

    v85 = v85.convertToRGB32(interlaced=false, matrix="PC.709")

    v85 = v85.ExInpaint(mask = v85_m)
    v85 = v85.convertToYV24(interlaced=false, matrix="PC.709")

    v85_m = v85_m.convertToYV24(interlaced=false, matrix="PC.709")
    v85_m = v85_m.gaussResize(v85.width/8, v85.height/8).gaussResize(v85.width, v85.height)
    v85b = v85.gaussResize(v85.width/16, v85.height/16).gaussResize(v85.width, v85.height)
    v85 = v85o.mt_merge(v85b, v85_m, luma = true)
}
else
{
    v85 = v85.fill_wedges(a = v85_angle)

    v85o = v85
    v85_m = v85.prepare_solid_mask(w = 160, h = 170)
    v85 = v85.convertToRGB32(interlaced=false, matrix="PC.709")
    v85 = v85.ExInpaint(mask = v85_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v85 = v85.convertToYV24(interlaced=false, matrix="PC.709")

    v85_m = v85_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v85_m = v85_m.gaussResize(v85.width/8, v85.height/8).gaussResize(v85.width, v85.height)
    v85b = v85.gaussResize(v85.width/16, v85.height/16).gaussResize(v85.width, v85.height)
    v85 = v85o.mt_merge(v85b, v85_m, luma = true)
/*
    # 129 -> 130..138
    v85_m = v85_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v85_m = v85_m.gaussResize(vv85.width/8, v85.height/8).gaussResize(v85.width, v85.height)
    v85_129 = v85.trim(129, -1)
    v85 = v85.trim(0, 129) + v85.trim(130, 138).mt_merge(v85_129.loop(10), v85_m, luma = true) + v85.trim(139, 0)
*/
}
v85 = v85.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v85, audio_rate = 48000, channels = 2).killVideo
v85 = v85.audioDub(va)

last = v85
prefetch

