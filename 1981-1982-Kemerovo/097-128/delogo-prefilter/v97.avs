import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v97, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v97.audioDub(va).prefetch
}

v97o = v97
#v97 = v97.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v97 = v97.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v97o.interleave(v97).prefetch
return v97.audioDub(va).prefetch

if (!varExist("v97_angle"))
{
    v97o = v97

    v97_m = v97.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v97 = v97.convertToRGB32(interlaced=false, matrix="PC.709")

    v97 = v97.ExInpaint(mask = v97_m)
    v97 = v97.convertToYV24(interlaced=false, matrix="PC.709")

    v97_m = v97_m.convertToYV24(interlaced=false, matrix="PC.709")
    v97_m = v97_m.gaussResize(v97.width/8, v97.height/8).gaussResize(v97.width, v97.height)
    v97b = v97.gaussResize(v97.width/16, v97.height/16).gaussResize(v97.width, v97.height)
    v97 = v97o.mt_merge(v97b, v97_m, luma = true)
}
else
{
    flip = false
    if (v97_angle < 0)
    {
        v97 = v97.flipHorizontal()
        v97_angle = -v97_angle
        flip = true
    }

    v97 = v97.rotate(-v97_angle)
    v97 = v97.fill_wedges(a = v97_angle)

    v97o = v97
    if (flip)
    {
        v97_m = v97.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v97_m = v97.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v97_m = v97.prepare_solid_mask(w = 170, h = 120)
        v97 = v97.convertToRGB32(interlaced=false, matrix="PC.709")
        v97 = v97.ExInpaint(mask = v97_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v97 = v97.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v97_m = v97_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v97_m = v97_m.gaussResize(v97.width/8, v97.height/8).gaussResize(v97.width, v97.height)
    v97b = v97.gaussResize(v97.width/16, v97.height/16).gaussResize(v97.width, v97.height)
    v97 = v97o.mt_merge(v97b, v97_m, luma = true)
    if (flip)
    {
        v97 = v97.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v97_m = v97_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v97_m = v97_m.gaussResize(vv97.width/8, v97.height/8).gaussResize(v97.width, v97.height)
    v97_129 = v97.trim(129, -1)
    v97 = v97.trim(0, 129) + v97.trim(130, 138).mt_merge(v97_129.loop(10), v97_m, luma = true) + v97.trim(139, 0)
*/
    #v97 = v97.crop(78, 0, 0, -56)#.adjustBorders
}

v97 = v97.audioDub(va)

last = v97#.hist_levels
prefetch

