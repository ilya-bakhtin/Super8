import("..\..\s8_functions.avs")
import("..\1987-Alexej-armada.avs")
/*
v8 = v8.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v8 = v8.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v8_angle"))
{
    v8o = v8

    v8_m = v8.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v8 = v8.convertToRGB32(interlaced=false, matrix="PC.709")

    v8 = v8.ExInpaint(mask = v8_m)
    v8 = v8.convertToYV24(interlaced=false, matrix="PC.709")

    v8_m = v8_m.convertToYV24(interlaced=false, matrix="PC.709")
    v8_m = v8_m.gaussResize(v8.width/8, v8.height/8).gaussResize(v8.width, v8.height)
    v8b = v8.gaussResize(v8.width/16, v8.height/16).gaussResize(v8.width, v8.height)
    v8 = v8o.mt_merge(v8b, v8_m, luma = true)
}
else
{
    flip = false
    if (v8_angle < 0)
    {
        v8 = v8.flipHorizontal()
        v8_angle = -v8_angle
        flip = true
    }

    v8 = v8.rotate(-v8_angle)
    v8 = v8.fill_wedges(a = v8_angle)

    v8o = v8
    if (flip)
    {
        v8_m = v8.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v8_m = v8.prepare_solid_mask(w = 170, h = 120)
        v8 = v8.convertToRGB32(interlaced=false, matrix="PC.709")
        v8 = v8.ExInpaint(mask = v8_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v8 = v8.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v8_m = v8_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v8_m = v8_m.gaussResize(v8.width/8, v8.height/8).gaussResize(v8.width, v8.height)
    v8b = v8.gaussResize(v8.width/16, v8.height/16).gaussResize(v8.width, v8.height)
    v8 = v8o.mt_merge(v8b, v8_m, luma = true)
    if (flip)
    {
        v8 = v8.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v8_m = v8_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v8_m = v8_m.gaussResize(vv8.width/8, v8.height/8).gaussResize(v8.width, v8.height)
    v8_129 = v8.trim(129, -1)
    v8 = v8.trim(0, 129) + v8.trim(130, 138).mt_merge(v8_129.loop(10), v8_m, luma = true) + v8.trim(139, 0)
*/
    #v8 = v8.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v8, audio_rate = 48000, channels = 2).killVideo
v8 = v8.audioDub(va)

last = v8#.hist_levels
prefetch

