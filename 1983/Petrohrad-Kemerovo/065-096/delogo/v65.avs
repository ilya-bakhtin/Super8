import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v65_angle"))
{
    v65o = v65

    v65_m = v65.PrepareMask(mask_w = 140, mask_h = 100, mask_tolerance = 200)

    v65 = v65.convertToRGB32(interlaced=false, matrix="PC.709")

    v65 = v65.ExInpaint(mask = v65_m)
    v65 = v65.convertToYV24(interlaced=false, matrix="PC.709")

    v65_m = v65_m.convertToYV24(interlaced=false, matrix="PC.709")
    v65_m = v65_m.gaussResize(v65.width/8, v65.height/8).gaussResize(v65.width, v65.height)
    v65b = v65.gaussResize(v65.width/16, v65.height/16).gaussResize(v65.width, v65.height)
    v65 = v65o.mt_merge(v65b, v65_m, luma = true)
}
else
{
    v65 = v65.fill_wedges(a = v65_angle)

    v65o = v65
    v65_m = v65.prepare_solid_mask(w = 160, h = 170)
    v65 = v65.convertToRGB32(interlaced=false, matrix="PC.709")
    v65 = v65.ExInpaint(mask = v65_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v65 = v65.convertToYV24(interlaced=false, matrix="PC.709")

    v65_m = v65_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v65_m = v65_m.gaussResize(v65.width/8, v65.height/8).gaussResize(v65.width, v65.height)
    v65b = v65.gaussResize(v65.width/16, v65.height/16).gaussResize(v65.width, v65.height)
    v65 = v65o.mt_merge(v65b, v65_m, luma = true)
/*
    # 129 -> 130..138
    v65_m = v65_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v65_m = v65_m.gaussResize(vv65.width/8, v65.height/8).gaussResize(v65.width, v65.height)
    v65_129 = v65.trim(129, -1)
    v65 = v65.trim(0, 129) + v65.trim(130, 138).mt_merge(v65_129.loop(10), v65_m, luma = true) + v65.trim(139, 0)
*/
}
v65 = v65.crop(78, 28, 0, -28)#.adjustBorders

va = BlankClip(v65, audio_rate = 48000, channels = 2).killVideo
v65 = v65.audioDub(va)

last = v65
prefetch

