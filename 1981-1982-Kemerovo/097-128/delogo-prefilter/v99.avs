import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

#simple = true

va = BlankClip(v99, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v99.audioDub(va).prefetch
}

v99o = v99
#v99 = v99.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v99 = v99.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
#return v99o.interleave(v99).prefetch
return v99.audioDub(va).prefetch

if (!varExist("v99_angle"))
{
    v99o = v99

    v99_m = v99.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v99 = v99.convertToRGB32(interlaced=false, matrix="PC.709")

    v99 = v99.ExInpaint(mask = v99_m)
    v99 = v99.convertToYV24(interlaced=false, matrix="PC.709")

    v99_m = v99_m.convertToYV24(interlaced=false, matrix="PC.709")
    v99_m = v99_m.gaussResize(v99.width/8, v99.height/8).gaussResize(v99.width, v99.height)
    v99b = v99.gaussResize(v99.width/16, v99.height/16).gaussResize(v99.width, v99.height)
    v99 = v99o.mt_merge(v99b, v99_m, luma = true)
}
else
{
    flip = false
    if (v99_angle < 0)
    {
        v99 = v99.flipHorizontal()
        v99_angle = -v99_angle
        flip = true
    }

    v99 = v99.rotate(-v99_angle)
    v99 = v99.fill_wedges(a = v99_angle)

    v99o = v99
    if (flip)
    {
        v99_m = v99.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v99_m = v99.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v99_m = v99.prepare_solid_mask(w = 170, h = 120)
        v99 = v99.convertToRGB32(interlaced=false, matrix="PC.709")
        v99 = v99.ExInpaint(mask = v99_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v99 = v99.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v99_m = v99_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v99_m = v99_m.gaussResize(v99.width/8, v99.height/8).gaussResize(v99.width, v99.height)
    v99b = v99.gaussResize(v99.width/16, v99.height/16).gaussResize(v99.width, v99.height)
    v99 = v99o.mt_merge(v99b, v99_m, luma = true)
    if (flip)
    {
        v99 = v99.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v99_m = v99_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v99_m = v99_m.gaussResize(vv99.width/8, v99.height/8).gaussResize(v99.width, v99.height)
    v99_129 = v99.trim(129, -1)
    v99 = v99.trim(0, 129) + v99.trim(130, 138).mt_merge(v99_129.loop(10), v99_m, luma = true) + v99.trim(139, 0)
*/
    #v99 = v99.crop(78, 0, 0, -56)#.adjustBorders
}

v99 = v99.audioDub(va)

last = v99#.hist_levels
prefetch

