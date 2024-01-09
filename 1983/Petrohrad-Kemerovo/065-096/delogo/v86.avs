import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v86_angle"))
{
    v86o = v86

    v86_m = v86.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v86 = v86.convertToRGB32(interlaced=false, matrix="PC.709")

    v86 = v86.ExInpaint(mask = v86_m)
    v86 = v86.convertToYV24(interlaced=false, matrix="PC.709")

    v86_m = v86_m.convertToYV24(interlaced=false, matrix="PC.709")
    v86_m = v86_m.gaussResize(v86.width/8, v86.height/8).gaussResize(v86.width, v86.height)
    v86b = v86.gaussResize(v86.width/16, v86.height/16).gaussResize(v86.width, v86.height)
    v86 = v86o.mt_merge(v86b, v86_m, luma = true)
}
else
{
    v86 = v86.fill_wedges(a = v86_angle)

    v86o = v86
    v86_m = v86.prepare_solid_mask(w = 160, h = 170)
    v86 = v86.convertToRGB32(interlaced=false, matrix="PC.709")
    v86 = v86.ExInpaint(mask = v86_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v86 = v86.convertToYV24(interlaced=false, matrix="PC.709")

    v86_m = v86_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v86_m = v86_m.gaussResize(v86.width/8, v86.height/8).gaussResize(v86.width, v86.height)
    v86b = v86.gaussResize(v86.width/16, v86.height/16).gaussResize(v86.width, v86.height)
    v86 = v86o.mt_merge(v86b, v86_m, luma = true)
/*
    # 129 -> 130..138
    v86_m = v86_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v86_m = v86_m.gaussResize(vv86.width/8, v86.height/8).gaussResize(v86.width, v86.height)
    v86_129 = v86.trim(129, -1)
    v86 = v86.trim(0, 129) + v86.trim(130, 138).mt_merge(v86_129.loop(10), v86_m, luma = true) + v86.trim(139, 0)
*/
}
v86 = v86.crop(78, 0, 0, -56)#.adjustBorders

va = BlankClip(v86, audio_rate = 48000, channels = 2).killVideo
v86 = v86.audioDub(va)

last = v86
prefetch

