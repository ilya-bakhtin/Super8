import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v102, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v102.audioDub(va).prefetch
}

v102o = v102
#v102 = v102.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v102 = v102.deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45).\
            deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45)
#return v102o.interleave(v102).prefetch
return v102.audioDub(va).prefetch

if (!varExist("v102_angle"))
{
    v102o = v102

    v102_m = v102.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v102 = v102.convertToRGB32(interlaced=false, matrix="PC.709")

    v102 = v102.ExInpaint(mask = v102_m)
    v102 = v102.convertToYV24(interlaced=false, matrix="PC.709")

    v102_m = v102_m.convertToYV24(interlaced=false, matrix="PC.709")
    v102_m = v102_m.gaussResize(v102.width/8, v102.height/8).gaussResize(v102.width, v102.height)
    v102b = v102.gaussResize(v102.width/16, v102.height/16).gaussResize(v102.width, v102.height)
    v102 = v102o.mt_merge(v102b, v102_m, luma = true)
}
else
{
    flip = false
    if (v102_angle < 0)
    {
        v102 = v102.flipHorizontal()
        v102_angle = -v102_angle
        flip = true
    }

    v102 = v102.rotate(-v102_angle)
    v102 = v102.fill_wedges(a = v102_angle)

    v102o = v102
    if (flip)
    {
        v102_m = v102.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v102_m = v102.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v102_m = v102.prepare_solid_mask(w = 170, h = 120)
        v102 = v102.convertToRGB32(interlaced=false, matrix="PC.709")
        v102 = v102.ExInpaint(mask = v102_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v102 = v102.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v102_m = v102_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v102_m = v102_m.gaussResize(v102.width/8, v102.height/8).gaussResize(v102.width, v102.height)
    v102b = v102.gaussResize(v102.width/16, v102.height/16).gaussResize(v102.width, v102.height)
    v102 = v102o.mt_merge(v102b, v102_m, luma = true)
    if (flip)
    {
        v102 = v102.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v102_m = v102_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v102_m = v102_m.gaussResize(vv102.width/8, v102.height/8).gaussResize(v102.width, v102.height)
    v102_129 = v102.trim(129, -1)
    v102 = v102.trim(0, 129) + v102.trim(130, 138).mt_merge(v102_129.loop(10), v102_m, luma = true) + v102.trim(139, 0)
*/
    #v102 = v102.crop(78, 0, 0, -56)#.adjustBorders
}

v102 = v102.audioDub(va)

last = v102#.hist_levels
prefetch

