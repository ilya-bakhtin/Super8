import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v0 = v0.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v0 = v0.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v0_angle"))
{
    v0o = v0

    v0_m = v0.PrepareMask(mask_w = 50, mask_h = 45, dw1 = 20, dh1 = 15)#(mask_tolerance = 200)
    v0 = v0.convertToRGB32(interlaced=false, matrix="PC.709")
#return v0.interleave(v0_m)

    v0 = v0.ExInpaint(mask = v0_m)
    v0 = v0.convertToYV24(interlaced=false, matrix="PC.709")

    v0_m = v0_m.convertToYV24(interlaced=false, matrix="PC.709")
    v0_m = v0_m.gaussResize(v0.width/8, v0.height/8).gaussResize(v0.width, v0.height)
    v0b = v0.gaussResize(v0.width/16, v0.height/16).gaussResize(v0.width, v0.height)
    v0 = v0o.mt_merge(v0b, v0_m, luma = true)
}
else
{
    flip = false
    if (v0_angle < 0)
    {
        v0 = v0.flipHorizontal()
        v0_angle = -v0_angle
        flip = true
    }

    v0 = v0.rotate(-v0_angle)
    v0 = v0.fill_wedges(a = v0_angle)

    v0o = v0
    if (flip)
    {
        v0_m = v0.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v0_m = v0.prepare_solid_mask(w = 170, h = 120)
        v0 = v0.convertToRGB32(interlaced=false, matrix="PC.709")
        v0 = v0.ExInpaint(mask = v0_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v0 = v0.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v0_m = v0_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v0_m = v0_m.gaussResize(v0.width/8, v0.height/8).gaussResize(v0.width, v0.height)
    v0b = v0.gaussResize(v0.width/16, v0.height/16).gaussResize(v0.width, v0.height)
    v0 = v0o.mt_merge(v0b, v0_m, luma = true)
    if (flip)
    {
        v0 = v0.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v0_m = v0_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v0_m = v0_m.gaussResize(vv0.width/8, v0.height/8).gaussResize(v0.width, v0.height)
    v0_129 = v0.trim(129, -1)
    v0 = v0.trim(0, 129) + v0.trim(130, 138).mt_merge(v0_129.loop(10), v0_m, luma = true) + v0.trim(139, 0)
*/
    #v0 = v0.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v0, audio_rate = 48000, channels = 2).killVideo
v0 = v0.audioDub(va)

last = v0#.hist_levels
prefetch

