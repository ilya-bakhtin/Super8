import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v87 = v87.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v87 = v87.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v87_angle"))
{
    v87o = v87

    v87_m = v87.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v87 = v87.convertToRGB32(interlaced=false, matrix="PC.709")

    v87 = v87.ExInpaint(mask = v87_m)
    v87 = v87.convertToYV24(interlaced=false, matrix="PC.709")

    v87_m = v87_m.convertToYV24(interlaced=false, matrix="PC.709")
    v87_m = v87_m.gaussResize(v87.width/8, v87.height/8).gaussResize(v87.width, v87.height)
    v87b = v87.gaussResize(v87.width/16, v87.height/16).gaussResize(v87.width, v87.height)
    v87 = v87o.mt_merge(v87b, v87_m, luma = true)
}
else
{
    flip = false
    if (v87_angle < 0)
    {
        v87 = v87.flipHorizontal()
        v87_angle = -v87_angle
        flip = true
    }

    v87 = v87.rotate(-v87_angle)
    v87 = v87.fill_wedges(a = v87_angle)

    v87o = v87
    if (flip)
    {
        v87_m = v87.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v87_m = v87.prepare_solid_mask(w = 170, h = 120)
        v87 = v87.convertToRGB32(interlaced=false, matrix="PC.709")
        v87 = v87.ExInpaint(mask = v87_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v87 = v87.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v87_m = v87_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v87_m = v87_m.gaussResize(v87.width/8, v87.height/8).gaussResize(v87.width, v87.height)
    v87b = v87.gaussResize(v87.width/16, v87.height/16).gaussResize(v87.width, v87.height)
    v87 = v87o.mt_merge(v87b, v87_m, luma = true)
    if (flip)
    {
        v87 = v87.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v87_m = v87_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v87_m = v87_m.gaussResize(vv87.width/8, v87.height/8).gaussResize(v87.width, v87.height)
    v87_129 = v87.trim(129, -1)
    v87 = v87.trim(0, 129) + v87.trim(130, 138).mt_merge(v87_129.loop(10), v87_m, luma = true) + v87.trim(139, 0)
*/
    #v87 = v87.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v87, audio_rate = 48000, channels = 2).killVideo
v87 = v87.audioDub(va)

last = v87#.hist_levels
prefetch

