import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v143, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v143.audioDub(va).prefetch
}

v143o = v143
#v143 = v143.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v143 = v143.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v143o.interleave(v143).prefetch
return v143.audioDub(va).prefetch

if (!varExist("v143_angle"))
{
    v143o = v143

    v143_m = v143.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v143 = v143.convertToRGB32(interlaced=false, matrix="PC.709")

    v143 = v143.ExInpaint(mask = v143_m)
    v143 = v143.convertToYV24(interlaced=false, matrix="PC.709")

    v143_m = v143_m.convertToYV24(interlaced=false, matrix="PC.709")
    v143_m = v143_m.gaussResize(v143.width/8, v143.height/8).gaussResize(v143.width, v143.height)
    v143b = v143.gaussResize(v143.width/16, v143.height/16).gaussResize(v143.width, v143.height)
    v143 = v143o.mt_merge(v143b, v143_m, luma = true)
}
else
{
    flip = false
    if (v143_angle < 0)
    {
        v143 = v143.flipHorizontal()
        v143_angle = -v143_angle
        flip = true
    }

    v143 = v143.rotate(-v143_angle)
    v143 = v143.fill_wedges(a = v143_angle)

    v143o = v143
    if (flip)
    {
        v143_m = v143.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v143_m = v143.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v143_m = v143.prepare_solid_mask(w = 170, h = 120)
        v143 = v143.convertToRGB32(interlaced=false, matrix="PC.709")
        v143 = v143.ExInpaint(mask = v143_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v143 = v143.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v143_m = v143_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v143_m = v143_m.gaussResize(v143.width/8, v143.height/8).gaussResize(v143.width, v143.height)
    v143b = v143.gaussResize(v143.width/16, v143.height/16).gaussResize(v143.width, v143.height)
    v143 = v143o.mt_merge(v143b, v143_m, luma = true)
    if (flip)
    {
        v143 = v143.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v143_m = v143_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v143_m = v143_m.gaussResize(vv143.width/8, v143.height/8).gaussResize(v143.width, v143.height)
    v143_129 = v143.trim(129, -1)
    v143 = v143.trim(0, 129) + v143.trim(130, 138).mt_merge(v143_129.loop(10), v143_m, luma = true) + v143.trim(139, 0)
*/
    #v143 = v143.crop(78, 0, 0, -56)#.adjustBorders
}

v143 = v143.audioDub(va)

last = v143#.hist_levels
prefetch

