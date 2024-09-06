import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v28 = v28.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v28 = v28.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v28_angle"))
{
    v28o = v28

    v28_m = v28.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v28 = v28.convertToRGB32(interlaced=false, matrix="PC.709")

    v28 = v28.ExInpaint(mask = v28_m)
    v28 = v28.convertToYV24(interlaced=false, matrix="PC.709")

    v28_m = v28_m.convertToYV24(interlaced=false, matrix="PC.709")
    v28_m = v28_m.gaussResize(v28.width/8, v28.height/8).gaussResize(v28.width, v28.height)
    v28b = v28.gaussResize(v28.width/16, v28.height/16).gaussResize(v28.width, v28.height)
    v28 = v28o.mt_merge(v28b, v28_m, luma = true)
}
else
{
    flip = false
    if (v28_angle < 0)
    {
        v28 = v28.flipHorizontal()
        v28_angle = -v28_angle
        flip = true
    }

    v28 = v28.rotate(-v28_angle)
    v28 = v28.fill_wedges(a = v28_angle)

    v28o = v28
    if (flip)
    {
        v28_m = v28.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v28_m = v28.prepare_solid_mask(w = 170, h = 120)
        v28 = v28.convertToRGB32(interlaced=false, matrix="PC.709")
        v28 = v28.ExInpaint(mask = v28_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v28 = v28.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v28_m = v28_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v28_m = v28_m.gaussResize(v28.width/8, v28.height/8).gaussResize(v28.width, v28.height)
    v28b = v28.gaussResize(v28.width/16, v28.height/16).gaussResize(v28.width, v28.height)
    v28 = v28o.mt_merge(v28b, v28_m, luma = true)
    if (flip)
    {
        v28 = v28.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v28_m = v28_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v28_m = v28_m.gaussResize(vv28.width/8, v28.height/8).gaussResize(v28.width, v28.height)
    v28_129 = v28.trim(129, -1)
    v28 = v28.trim(0, 129) + v28.trim(130, 138).mt_merge(v28_129.loop(10), v28_m, luma = true) + v28.trim(139, 0)
*/
    #v28 = v28.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v28, audio_rate = 48000, channels = 2).killVideo
v28 = v28.audioDub(va)

last = v28#.hist_levels
prefetch

