import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v7_0 = v7_0.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v7_0 = v7_0.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v7_0_angle"))
{
    v7_0o = v7_0

    v7_0_m = v7_0.PrepareMask(mask_w = 50, mask_h = 45, dw1 = 20, dh1 = 15)#(mask_tolerance = 200)
    v7_0 = v7_0.convertToRGB32(interlaced=false, matrix="PC.709")
#return v7_0.interleave(v7_0_m)

    v7_0 = v7_0.ExInpaint(mask = v7_0_m)
    v7_0 = v7_0.convertToYV24(interlaced=false, matrix="PC.709")

    v7_0_m = v7_0_m.convertToYV24(interlaced=false, matrix="PC.709")
    v7_0_m = v7_0_m.gaussResize(v7_0.width/8, v7_0.height/8).gaussResize(v7_0.width, v7_0.height)
    v7_0b = v7_0.gaussResize(v7_0.width/16, v7_0.height/16).gaussResize(v7_0.width, v7_0.height)
    v7_0 = v7_0o.mt_merge(v7_0b, v7_0_m, luma = true)
}
else
{
    flip = false
    if (v7_0_angle < 0)
    {
        v7_0 = v7_0.flipHorizontal()
        v7_0_angle = -v7_0_angle
        flip = true
    }

    v7_0 = v7_0.rotate(-v7_0_angle)
    v7_0 = v7_0.fill_wedges(a = v7_0_angle)

    v7_0o = v7_0
    if (flip)
    {
        v7_0_m = v7_0.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v7_0_m = v7_0.prepare_solid_mask(w = 170, h = 120)
        v7_0 = v7_0.convertToRGB32(interlaced=false, matrix="PC.709")
        v7_0 = v7_0.ExInpaint(mask = v7_0_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v7_0 = v7_0.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v7_0_m = v7_0_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v7_0_m = v7_0_m.gaussResize(v7_0.width/8, v7_0.height/8).gaussResize(v7_0.width, v7_0.height)
    v7_0b = v7_0.gaussResize(v7_0.width/16, v7_0.height/16).gaussResize(v7_0.width, v7_0.height)
    v7_0 = v7_0o.mt_merge(v7_0b, v7_0_m, luma = true)
    if (flip)
    {
        v7_0 = v7_0.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v7_0_m = v7_0_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v7_0_m = v7_0_m.gaussResize(vv7_0.width/8, v7_0.height/8).gaussResize(v7_0.width, v7_0.height)
    v7_0_129 = v7_0.trim(129, -1)
    v7_0 = v7_0.trim(0, 129) + v7_0.trim(130, 138).mt_merge(v7_0_129.loop(10), v7_0_m, luma = true) + v7_0.trim(139, 0)
*/
    #v7_0 = v7_0.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v7_0, audio_rate = 48000, channels = 2).killVideo
v7_0 = v7_0.audioDub(va)

last = v7_0#.hist_levels
prefetch

