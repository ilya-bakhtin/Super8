import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v160, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v160.audioDub(va).prefetch
}

v160o = v160
#v160 = v160.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v160 = v160.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v160o.interleave(v160).prefetch
return v160.audioDub(va).prefetch

if (!varExist("v160_angle"))
{
    v160o = v160

    v160_m = v160.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v160 = v160.convertToRGB32(interlaced=false, matrix="PC.709")

    v160 = v160.ExInpaint(mask = v160_m)
    v160 = v160.convertToYV24(interlaced=false, matrix="PC.709")

    v160_m = v160_m.convertToYV24(interlaced=false, matrix="PC.709")
    v160_m = v160_m.gaussResize(v160.width/8, v160.height/8).gaussResize(v160.width, v160.height)
    v160b = v160.gaussResize(v160.width/16, v160.height/16).gaussResize(v160.width, v160.height)
    v160 = v160o.mt_merge(v160b, v160_m, luma = true)
}
else
{
    flip = false
    if (v160_angle < 0)
    {
        v160 = v160.flipHorizontal()
        v160_angle = -v160_angle
        flip = true
    }

    v160 = v160.rotate(-v160_angle)
    v160 = v160.fill_wedges(a = v160_angle)

    v160o = v160
    if (flip)
    {
        v160_m = v160.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v160_m = v160.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v160_m = v160.prepare_solid_mask(w = 170, h = 120)
        v160 = v160.convertToRGB32(interlaced=false, matrix="PC.709")
        v160 = v160.ExInpaint(mask = v160_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v160 = v160.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v160_m = v160_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v160_m = v160_m.gaussResize(v160.width/8, v160.height/8).gaussResize(v160.width, v160.height)
    v160b = v160.gaussResize(v160.width/16, v160.height/16).gaussResize(v160.width, v160.height)
    v160 = v160o.mt_merge(v160b, v160_m, luma = true)
    if (flip)
    {
        v160 = v160.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v160_m = v160_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v160_m = v160_m.gaussResize(vv160.width/8, v160.height/8).gaussResize(v160.width, v160.height)
    v160_129 = v160.trim(129, -1)
    v160 = v160.trim(0, 129) + v160.trim(130, 138).mt_merge(v160_129.loop(10), v160_m, luma = true) + v160.trim(139, 0)
*/
    #v160 = v160.crop(78, 0, 0, -56)#.adjustBorders
}

v160 = v160.audioDub(va)

last = v160#.hist_levels
prefetch

