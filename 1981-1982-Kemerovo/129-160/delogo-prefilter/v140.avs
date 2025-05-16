import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v140, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v140.audioDub(va).prefetch
}

v140o = v140
#v140 = v140.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v140 = v140.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v140o.interleave(v140).prefetch
return v140.audioDub(va).prefetch

if (!varExist("v140_angle"))
{
    v140o = v140

    v140_m = v140.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v140 = v140.convertToRGB32(interlaced=false, matrix="PC.709")

    v140 = v140.ExInpaint(mask = v140_m)
    v140 = v140.convertToYV24(interlaced=false, matrix="PC.709")

    v140_m = v140_m.convertToYV24(interlaced=false, matrix="PC.709")
    v140_m = v140_m.gaussResize(v140.width/8, v140.height/8).gaussResize(v140.width, v140.height)
    v140b = v140.gaussResize(v140.width/16, v140.height/16).gaussResize(v140.width, v140.height)
    v140 = v140o.mt_merge(v140b, v140_m, luma = true)
}
else
{
    flip = false
    if (v140_angle < 0)
    {
        v140 = v140.flipHorizontal()
        v140_angle = -v140_angle
        flip = true
    }

    v140 = v140.rotate(-v140_angle)
    v140 = v140.fill_wedges(a = v140_angle)

    v140o = v140
    if (flip)
    {
        v140_m = v140.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v140_m = v140.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v140_m = v140.prepare_solid_mask(w = 170, h = 120)
        v140 = v140.convertToRGB32(interlaced=false, matrix="PC.709")
        v140 = v140.ExInpaint(mask = v140_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v140 = v140.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v140_m = v140_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v140_m = v140_m.gaussResize(v140.width/8, v140.height/8).gaussResize(v140.width, v140.height)
    v140b = v140.gaussResize(v140.width/16, v140.height/16).gaussResize(v140.width, v140.height)
    v140 = v140o.mt_merge(v140b, v140_m, luma = true)
    if (flip)
    {
        v140 = v140.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v140_m = v140_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v140_m = v140_m.gaussResize(vv140.width/8, v140.height/8).gaussResize(v140.width, v140.height)
    v140_129 = v140.trim(129, -1)
    v140 = v140.trim(0, 129) + v140.trim(130, 138).mt_merge(v140_129.loop(10), v140_m, luma = true) + v140.trim(139, 0)
*/
    #v140 = v140.crop(78, 0, 0, -56)#.adjustBorders
}

v140 = v140.audioDub(va)

last = v140#.hist_levels
prefetch

