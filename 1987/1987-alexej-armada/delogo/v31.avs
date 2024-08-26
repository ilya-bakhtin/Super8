import("..\..\s8_functions.avs")
import("..\1987-Alexej-armada.avs")
/*
v31 = v31.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v31 = v31.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v31_angle"))
{
    v31o = v31

    v31_m = v31.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

    v31 = v31.convertToRGB32(interlaced=false, matrix="PC.709")

    v31 = v31.ExInpaint(mask = v31_m)
    v31 = v31.convertToYV24(interlaced=false, matrix="PC.709")

    v31_m = v31_m.convertToYV24(interlaced=false, matrix="PC.709")
    v31_m = v31_m.gaussResize(v31.width/8, v31.height/8).gaussResize(v31.width, v31.height)
    v31b = v31.gaussResize(v31.width/16, v31.height/16).gaussResize(v31.width, v31.height)
    v31 = v31o.mt_merge(v31b, v31_m, luma = true)
}
else
{
    flip = false
    if (v31_angle < 0)
    {
        v31 = v31.flipHorizontal()
        v31_angle = -v31_angle
        flip = true
    }

    v31 = v31.rotate(-v31_angle)
    v31 = v31.fill_wedges(a = v31_angle)

    v31o = v31
    if (flip)
    {
        v31_m = v31.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v31_m = v31.prepare_solid_mask(w = 170, h = 120)
        v31 = v31.convertToRGB32(interlaced=false, matrix="PC.709")
        v31 = v31.ExInpaint(mask = v31_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v31 = v31.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v31_m = v31_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v31_m = v31_m.gaussResize(v31.width/8, v31.height/8).gaussResize(v31.width, v31.height)
    v31b = v31.gaussResize(v31.width/16, v31.height/16).gaussResize(v31.width, v31.height)
    v31 = v31o.mt_merge(v31b, v31_m, luma = true)
    if (flip)
    {
        v31 = v31.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v31_m = v31_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v31_m = v31_m.gaussResize(vv31.width/8, v31.height/8).gaussResize(v31.width, v31.height)
    v31_129 = v31.trim(129, -1)
    v31 = v31.trim(0, 129) + v31.trim(130, 138).mt_merge(v31_129.loop(10), v31_m, luma = true) + v31.trim(139, 0)
*/
    #v31 = v31.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v31, audio_rate = 48000, channels = 2).killVideo
v31 = v31.audioDub(va)

last = v31#.hist_levels
prefetch

