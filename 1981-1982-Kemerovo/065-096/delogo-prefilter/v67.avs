import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v67 = v67.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v67 = v67.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v67_angle"))
{
    v67o = v67

    v67_m = v67.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v67 = v67.convertToRGB32(interlaced=false, matrix="PC.709")

    v67 = v67.ExInpaint(mask = v67_m)
    v67 = v67.convertToYV24(interlaced=false, matrix="PC.709")

    v67_m = v67_m.convertToYV24(interlaced=false, matrix="PC.709")
    v67_m = v67_m.gaussResize(v67.width/8, v67.height/8).gaussResize(v67.width, v67.height)
    v67b = v67.gaussResize(v67.width/16, v67.height/16).gaussResize(v67.width, v67.height)
    v67 = v67o.mt_merge(v67b, v67_m, luma = true)
}
else
{
    flip = false
    if (v67_angle < 0)
    {
        v67 = v67.flipHorizontal()
        v67_angle = -v67_angle
        flip = true
    }

    v67 = v67.rotate(-v67_angle)
    v67 = v67.fill_wedges(a = v67_angle)

    v67o = v67
    if (flip)
    {
        v67_m = v67.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v67_m = v67.prepare_solid_mask(w = 170, h = 120)
        v67 = v67.convertToRGB32(interlaced=false, matrix="PC.709")
        v67 = v67.ExInpaint(mask = v67_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v67 = v67.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v67_m = v67_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v67_m = v67_m.gaussResize(v67.width/8, v67.height/8).gaussResize(v67.width, v67.height)
    v67b = v67.gaussResize(v67.width/16, v67.height/16).gaussResize(v67.width, v67.height)
    v67 = v67o.mt_merge(v67b, v67_m, luma = true)
    if (flip)
    {
        v67 = v67.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v67_m = v67_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v67_m = v67_m.gaussResize(vv67.width/8, v67.height/8).gaussResize(v67.width, v67.height)
    v67_129 = v67.trim(129, -1)
    v67 = v67.trim(0, 129) + v67.trim(130, 138).mt_merge(v67_129.loop(10), v67_m, luma = true) + v67.trim(139, 0)
*/
    #v67 = v67.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v67, audio_rate = 48000, channels = 2).killVideo
v67 = v67.audioDub(va)

last = v67#.hist_levels
prefetch

