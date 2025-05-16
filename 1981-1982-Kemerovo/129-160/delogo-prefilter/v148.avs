import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v148, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v148.audioDub(va).prefetch
}

v148o = v148
#v148 = v148.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v148 = v148.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v148o.interleave(v148).prefetch
return v148.audioDub(va).prefetch

if (!varExist("v148_angle"))
{
    v148o = v148

    v148_m = v148.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v148 = v148.convertToRGB32(interlaced=false, matrix="PC.709")

    v148 = v148.ExInpaint(mask = v148_m)
    v148 = v148.convertToYV24(interlaced=false, matrix="PC.709")

    v148_m = v148_m.convertToYV24(interlaced=false, matrix="PC.709")
    v148_m = v148_m.gaussResize(v148.width/8, v148.height/8).gaussResize(v148.width, v148.height)
    v148b = v148.gaussResize(v148.width/16, v148.height/16).gaussResize(v148.width, v148.height)
    v148 = v148o.mt_merge(v148b, v148_m, luma = true)
}
else
{
    flip = false
    if (v148_angle < 0)
    {
        v148 = v148.flipHorizontal()
        v148_angle = -v148_angle
        flip = true
    }

    v148 = v148.rotate(-v148_angle)
    v148 = v148.fill_wedges(a = v148_angle)

    v148o = v148
    if (flip)
    {
        v148_m = v148.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v148_m = v148.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v148_m = v148.prepare_solid_mask(w = 170, h = 120)
        v148 = v148.convertToRGB32(interlaced=false, matrix="PC.709")
        v148 = v148.ExInpaint(mask = v148_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v148 = v148.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v148_m = v148_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v148_m = v148_m.gaussResize(v148.width/8, v148.height/8).gaussResize(v148.width, v148.height)
    v148b = v148.gaussResize(v148.width/16, v148.height/16).gaussResize(v148.width, v148.height)
    v148 = v148o.mt_merge(v148b, v148_m, luma = true)
    if (flip)
    {
        v148 = v148.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v148_m = v148_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v148_m = v148_m.gaussResize(vv148.width/8, v148.height/8).gaussResize(v148.width, v148.height)
    v148_129 = v148.trim(129, -1)
    v148 = v148.trim(0, 129) + v148.trim(130, 138).mt_merge(v148_129.loop(10), v148_m, luma = true) + v148.trim(139, 0)
*/
    #v148 = v148.crop(78, 0, 0, -56)#.adjustBorders
}

v148 = v148.audioDub(va)

last = v148#.hist_levels
prefetch

