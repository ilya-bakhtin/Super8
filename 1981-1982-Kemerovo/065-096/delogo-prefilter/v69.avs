import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v69 = v69.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v69 = v69.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v69_angle"))
{
    v69o = v69

    v69_m = v69.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v69 = v69.convertToRGB32(interlaced=false, matrix="PC.709")

    v69 = v69.ExInpaint(mask = v69_m)
    v69 = v69.convertToYV24(interlaced=false, matrix="PC.709")

    v69_m = v69_m.convertToYV24(interlaced=false, matrix="PC.709")
    v69_m = v69_m.gaussResize(v69.width/8, v69.height/8).gaussResize(v69.width, v69.height)
    v69b = v69.gaussResize(v69.width/16, v69.height/16).gaussResize(v69.width, v69.height)
    v69 = v69o.mt_merge(v69b, v69_m, luma = true)
}
else
{
    flip = false
    if (v69_angle < 0)
    {
        v69 = v69.flipHorizontal()
        v69_angle = -v69_angle
        flip = true
    }

    v69 = v69.rotate(-v69_angle)
    v69 = v69.fill_wedges(a = v69_angle)

    v69o = v69
    if (flip)
    {
        v69_m = v69.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v69_m = v69.prepare_solid_mask(w = 170, h = 120)
        v69 = v69.convertToRGB32(interlaced=false, matrix="PC.709")
        v69 = v69.ExInpaint(mask = v69_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v69 = v69.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v69_m = v69_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v69_m = v69_m.gaussResize(v69.width/8, v69.height/8).gaussResize(v69.width, v69.height)
    v69b = v69.gaussResize(v69.width/16, v69.height/16).gaussResize(v69.width, v69.height)
    v69 = v69o.mt_merge(v69b, v69_m, luma = true)
    if (flip)
    {
        v69 = v69.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v69_m = v69_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v69_m = v69_m.gaussResize(vv69.width/8, v69.height/8).gaussResize(v69.width, v69.height)
    v69_129 = v69.trim(129, -1)
    v69 = v69.trim(0, 129) + v69.trim(130, 138).mt_merge(v69_129.loop(10), v69_m, luma = true) + v69.trim(139, 0)
*/
    #v69 = v69.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v69, audio_rate = 48000, channels = 2).killVideo
v69 = v69.audioDub(va)

last = v69#.hist_levels
prefetch

