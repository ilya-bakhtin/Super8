import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v64_angle"))
{
    v64o = v64

    v64_m = v64.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 200)

    v64 = v64.convertToRGB32(interlaced=false, matrix="PC.709")

    v64 = v64.ExInpaint(mask = v64_m)
    v64 = v64.convertToYV24(interlaced=false, matrix="PC.709")

    v64_m = v64_m.convertToYV24(interlaced=false, matrix="PC.709")
    v64_m = v64_m.gaussResize(v64.width/8, v64.height/8).gaussResize(v64.width, v64.height)
    v64b = v64.gaussResize(v64.width/16, v64.height/16).gaussResize(v64.width, v64.height)
    v64 = v64o.mt_merge(v64b, v64_m, luma = true)
}
else
{
    v64 = v64.fill_wedges(a = v64_angle)

    v64o = v64
    v64_m = v64.prepare_solid_mask(w = 160, h = 170)
    v64 = v64.convertToRGB32(interlaced=false, matrix="PC.709")
    v64 = v64.ExInpaint(mask = v64_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v64 = v64.convertToYV24(interlaced=false, matrix="PC.709")

    v64_m = v64_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v64_m = v64_m.gaussResize(v64.width/8, v64.height/8).gaussResize(v64.width, v64.height)
    v64b = v64.gaussResize(v64.width/16, v64.height/16).gaussResize(v64.width, v64.height)
    v64 = v64o.mt_merge(v64b, v64_m, luma = true)
/*
    # 129 -> 130..138
    v64_m = v64_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v64_m = v64_m.gaussResize(vv64.width/8, v64.height/8).gaussResize(v64.width, v64.height)
    v64_129 = v64.trim(129, -1)
    v64 = v64.trim(0, 129) + v64.trim(130, 138).mt_merge(v64_129.loop(10), v64_m, luma = true) + v64.trim(139, 0)
*/
}
v64 = v64.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v64, audio_rate = 48000, channels = 2).killVideo
v64 = v64.audioDub(va)

last = v64
prefetch

