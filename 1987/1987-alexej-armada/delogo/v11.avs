import("..\..\s8_functions.avs")
import("..\1987-Alexej-armada.avs")
/*
v11 = v11.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v11 = v11.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v11_angle"))
{
    v11o = v11

    v11_m = v11.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v11 = v11.convertToRGB32(interlaced=false, matrix="PC.709")

    v11 = v11.ExInpaint(mask = v11_m)
    v11 = v11.convertToYV24(interlaced=false, matrix="PC.709")

    v11_m = v11_m.convertToYV24(interlaced=false, matrix="PC.709")
    v11_m = v11_m.gaussResize(v11.width/8, v11.height/8).gaussResize(v11.width, v11.height)
    v11b = v11.gaussResize(v11.width/16, v11.height/16).gaussResize(v11.width, v11.height)
    v11 = v11o.mt_merge(v11b, v11_m, luma = true)
}
else
{
    flip = false
    if (v11_angle < 0)
    {
        v11 = v11.flipHorizontal()
        v11_angle = -v11_angle
        flip = true
    }

    v11 = v11.rotate(-v11_angle)
    v11 = v11.fill_wedges(a = v11_angle)

    v11o = v11
    if (flip)
    {
        v11_m = v11.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v11_m = v11.prepare_solid_mask(w = 170, h = 120)
        v11 = v11.convertToRGB32(interlaced=false, matrix="PC.709")
        v11 = v11.ExInpaint(mask = v11_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v11 = v11.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v11_m = v11_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v11_m = v11_m.gaussResize(v11.width/8, v11.height/8).gaussResize(v11.width, v11.height)
    v11b = v11.gaussResize(v11.width/16, v11.height/16).gaussResize(v11.width, v11.height)
    v11 = v11o.mt_merge(v11b, v11_m, luma = true)
    if (flip)
    {
        v11 = v11.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v11_m = v11_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v11_m = v11_m.gaussResize(vv11.width/8, v11.height/8).gaussResize(v11.width, v11.height)
    v11_129 = v11.trim(129, -1)
    v11 = v11.trim(0, 129) + v11.trim(130, 138).mt_merge(v11_129.loop(10), v11_m, luma = true) + v11.trim(139, 0)
*/
    #v11 = v11.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v11, audio_rate = 48000, channels = 2).killVideo
v11 = v11.audioDub(va)

last = v11#.hist_levels
prefetch

