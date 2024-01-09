import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("v51_angle"))
{
    v51o = v51

    v51_m = v51.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v51 = v51.convertToRGB32(interlaced=false, matrix="PC.709")

    v51 = v51.ExInpaint(mask = v51_m)
    v51 = v51.convertToYV24(interlaced=false, matrix="PC.709")

    v51_m = v51_m.convertToYV24(interlaced=false, matrix="PC.709")
    v51_m = v51_m.gaussResize(v51.width/8, v51.height/8).gaussResize(v51.width, v51.height)
    v51b = v51.gaussResize(v51.width/16, v51.height/16).gaussResize(v51.width, v51.height)
    v51 = v51o.mt_merge(v51b, v51_m, luma = true)
}
else
{
    v51 = v51.fill_wedges(a = v51_angle)

    v51o = v51
    v51_m = v51.prepare_solid_mask(w = 160, h = 170)
    v51 = v51.convertToRGB32(interlaced=false, matrix="PC.709")
    v51 = v51.ExInpaint(mask = v51_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    v51 = v51.convertToYV24(interlaced=false, matrix="PC.709")

    v51_m = v51_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v51_m = v51_m.gaussResize(v51.width/8, v51.height/8).gaussResize(v51.width, v51.height)
    v51b = v51.gaussResize(v51.width/16, v51.height/16).gaussResize(v51.width, v51.height)
    v51 = v51o.mt_merge(v51b, v51_m, luma = true)
/*
    # 129 -> 130..138
    v51_m = v51_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v51_m = v51_m.gaussResize(vv51.width/8, v51.height/8).gaussResize(v51.width, v51.height)
    v51_129 = v51.trim(129, -1)
    v51 = v51.trim(0, 129) + v51.trim(130, 138).mt_merge(v51_129.loop(10), v51_m, luma = true) + v51.trim(139, 0)
*/
    v51 = v51.crop(80, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v51, audio_rate = 48000, channels = 2).killVideo
v51 = v51.audioDub(va)

last = v51
prefetch

