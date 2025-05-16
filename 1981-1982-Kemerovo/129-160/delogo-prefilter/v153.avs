import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v153, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v153.audioDub(va).prefetch
}

v153o = v153
#v153 = v153.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v153 = v153.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v153o.interleave(v153).prefetch
return v153.audioDub(va).prefetch

if (!varExist("v153_angle"))
{
    v153o = v153

    v153_m = v153.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v153 = v153.convertToRGB32(interlaced=false, matrix="PC.709")

    v153 = v153.ExInpaint(mask = v153_m)
    v153 = v153.convertToYV24(interlaced=false, matrix="PC.709")

    v153_m = v153_m.convertToYV24(interlaced=false, matrix="PC.709")
    v153_m = v153_m.gaussResize(v153.width/8, v153.height/8).gaussResize(v153.width, v153.height)
    v153b = v153.gaussResize(v153.width/16, v153.height/16).gaussResize(v153.width, v153.height)
    v153 = v153o.mt_merge(v153b, v153_m, luma = true)
}
else
{
    flip = false
    if (v153_angle < 0)
    {
        v153 = v153.flipHorizontal()
        v153_angle = -v153_angle
        flip = true
    }

    v153 = v153.rotate(-v153_angle)
    v153 = v153.fill_wedges(a = v153_angle)

    v153o = v153
    if (flip)
    {
        v153_m = v153.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v153_m = v153.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v153_m = v153.prepare_solid_mask(w = 170, h = 120)
        v153 = v153.convertToRGB32(interlaced=false, matrix="PC.709")
        v153 = v153.ExInpaint(mask = v153_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v153 = v153.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v153_m = v153_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v153_m = v153_m.gaussResize(v153.width/8, v153.height/8).gaussResize(v153.width, v153.height)
    v153b = v153.gaussResize(v153.width/16, v153.height/16).gaussResize(v153.width, v153.height)
    v153 = v153o.mt_merge(v153b, v153_m, luma = true)
    if (flip)
    {
        v153 = v153.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v153_m = v153_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v153_m = v153_m.gaussResize(vv153.width/8, v153.height/8).gaussResize(v153.width, v153.height)
    v153_129 = v153.trim(129, -1)
    v153 = v153.trim(0, 129) + v153.trim(130, 138).mt_merge(v153_129.loop(10), v153_m, luma = true) + v153.trim(139, 0)
*/
    #v153 = v153.crop(78, 0, 0, -56)#.adjustBorders
}

v153 = v153.audioDub(va)

last = v153#.hist_levels
prefetch

