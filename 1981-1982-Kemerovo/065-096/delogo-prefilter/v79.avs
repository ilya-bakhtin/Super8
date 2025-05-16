import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v79 = v79.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v79 = v79.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v79_angle"))
{
    v79o = v79

    v79_m = v79.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v79 = v79.convertToRGB32(interlaced=false, matrix="PC.709")

    v79 = v79.ExInpaint(mask = v79_m)
    v79 = v79.convertToYV24(interlaced=false, matrix="PC.709")

    v79_m = v79_m.convertToYV24(interlaced=false, matrix="PC.709")
    v79_m = v79_m.gaussResize(v79.width/8, v79.height/8).gaussResize(v79.width, v79.height)
    v79b = v79.gaussResize(v79.width/16, v79.height/16).gaussResize(v79.width, v79.height)
    v79 = v79o.mt_merge(v79b, v79_m, luma = true)
}
else
{
    flip = false
    if (v79_angle < 0)
    {
        v79 = v79.flipHorizontal()
        v79_angle = -v79_angle
        flip = true
    }

    v79 = v79.rotate(-v79_angle)
    v79 = v79.fill_wedges(a = v79_angle)

    v79o = v79
    if (flip)
    {
        v79_m = v79.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v79_m = v79.prepare_solid_mask(w = 170, h = 120)
        v79 = v79.convertToRGB32(interlaced=false, matrix="PC.709")
        v79 = v79.ExInpaint(mask = v79_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v79 = v79.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v79_m = v79_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v79_m = v79_m.gaussResize(v79.width/8, v79.height/8).gaussResize(v79.width, v79.height)
    v79b = v79.gaussResize(v79.width/16, v79.height/16).gaussResize(v79.width, v79.height)
    v79 = v79o.mt_merge(v79b, v79_m, luma = true)
    if (flip)
    {
        v79 = v79.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v79_m = v79_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v79_m = v79_m.gaussResize(vv79.width/8, v79.height/8).gaussResize(v79.width, v79.height)
    v79_129 = v79.trim(129, -1)
    v79 = v79.trim(0, 129) + v79.trim(130, 138).mt_merge(v79_129.loop(10), v79_m, luma = true) + v79.trim(139, 0)
*/
    #v79 = v79.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v79, audio_rate = 48000, channels = 2).killVideo
v79 = v79.audioDub(va)

last = v79#.hist_levels
prefetch

