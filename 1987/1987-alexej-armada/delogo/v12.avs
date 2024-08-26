import("..\..\s8_functions.avs")
import("..\1987-Alexej-armada.avs")
/*
v12 = v12.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v12 = v12.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v12_angle"))
{
    v12o = v12

    v12_m = v12.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v12 = v12.convertToRGB32(interlaced=false, matrix="PC.709")

    v12 = v12.ExInpaint(mask = v12_m)
    v12 = v12.convertToYV24(interlaced=false, matrix="PC.709")

    v12_m = v12_m.convertToYV24(interlaced=false, matrix="PC.709")
    v12_m = v12_m.gaussResize(v12.width/8, v12.height/8).gaussResize(v12.width, v12.height)
    v12b = v12.gaussResize(v12.width/16, v12.height/16).gaussResize(v12.width, v12.height)
    v12 = v12o.mt_merge(v12b, v12_m, luma = true)
}
else
{
    flip = false
    if (v12_angle < 0)
    {
        v12 = v12.flipHorizontal()
        v12_angle = -v12_angle
        flip = true
    }

    v12 = v12.rotate(-v12_angle)
    v12 = v12.fill_wedges(a = v12_angle)

    v12o = v12
    if (flip)
    {
        v12_m = v12.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v12_m = v12.prepare_solid_mask(w = 170, h = 120)
        v12 = v12.convertToRGB32(interlaced=false, matrix="PC.709")
        v12 = v12.ExInpaint(mask = v12_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v12 = v12.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v12_m = v12_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v12_m = v12_m.gaussResize(v12.width/8, v12.height/8).gaussResize(v12.width, v12.height)
    v12b = v12.gaussResize(v12.width/16, v12.height/16).gaussResize(v12.width, v12.height)
    v12 = v12o.mt_merge(v12b, v12_m, luma = true)
    if (flip)
    {
        v12 = v12.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v12_m = v12_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v12_m = v12_m.gaussResize(vv12.width/8, v12.height/8).gaussResize(v12.width, v12.height)
    v12_129 = v12.trim(129, -1)
    v12 = v12.trim(0, 129) + v12.trim(130, 138).mt_merge(v12_129.loop(10), v12_m, luma = true) + v12.trim(139, 0)
*/
    #v12 = v12.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v12, audio_rate = 48000, channels = 2).killVideo
v12 = v12.audioDub(va)

last = v12#.hist_levels
prefetch

