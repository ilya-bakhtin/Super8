import("..\..\s8_functions.avs")
import("..\1987-Alexej-armada.avs")
/*
v14 = v14.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v14 = v14.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v14_angle"))
{
    v14o = v14

    v14_m = v14.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v14 = v14.convertToRGB32(interlaced=false, matrix="PC.709")

    v14 = v14.ExInpaint(mask = v14_m)
    v14 = v14.convertToYV24(interlaced=false, matrix="PC.709")

    v14_m = v14_m.convertToYV24(interlaced=false, matrix="PC.709")
    v14_m = v14_m.gaussResize(v14.width/8, v14.height/8).gaussResize(v14.width, v14.height)
    v14b = v14.gaussResize(v14.width/16, v14.height/16).gaussResize(v14.width, v14.height)
    v14 = v14o.mt_merge(v14b, v14_m, luma = true)
}
else
{
    flip = false
    if (v14_angle < 0)
    {
        v14 = v14.flipHorizontal()
        v14_angle = -v14_angle
        flip = true
    }

    v14 = v14.rotate(-v14_angle)
    v14 = v14.fill_wedges(a = v14_angle)

    v14o = v14
    if (flip)
    {
        v14_m = v14.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v14_m = v14.prepare_solid_mask(w = 170, h = 120)
        v14 = v14.convertToRGB32(interlaced=false, matrix="PC.709")
        v14 = v14.ExInpaint(mask = v14_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v14 = v14.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v14_m = v14_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v14_m = v14_m.gaussResize(v14.width/8, v14.height/8).gaussResize(v14.width, v14.height)
    v14b = v14.gaussResize(v14.width/16, v14.height/16).gaussResize(v14.width, v14.height)
    v14 = v14o.mt_merge(v14b, v14_m, luma = true)
    if (flip)
    {
        v14 = v14.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v14_m = v14_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v14_m = v14_m.gaussResize(vv14.width/8, v14.height/8).gaussResize(v14.width, v14.height)
    v14_129 = v14.trim(129, -1)
    v14 = v14.trim(0, 129) + v14.trim(130, 138).mt_merge(v14_129.loop(10), v14_m, luma = true) + v14.trim(139, 0)
*/
    #v14 = v14.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v14, audio_rate = 48000, channels = 2).killVideo
v14 = v14.audioDub(va)

last = v14#.hist_levels
prefetch

