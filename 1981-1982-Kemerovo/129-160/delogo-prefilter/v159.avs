import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v159, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v159.audioDub(va).prefetch
}

v159o = v159
#v159 = v159.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v159 = v159.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v159o.interleave(v159).prefetch
return v159.audioDub(va).prefetch

if (!varExist("v159_angle"))
{
    v159o = v159

    v159_m = v159.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v159 = v159.convertToRGB32(interlaced=false, matrix="PC.709")

    v159 = v159.ExInpaint(mask = v159_m)
    v159 = v159.convertToYV24(interlaced=false, matrix="PC.709")

    v159_m = v159_m.convertToYV24(interlaced=false, matrix="PC.709")
    v159_m = v159_m.gaussResize(v159.width/8, v159.height/8).gaussResize(v159.width, v159.height)
    v159b = v159.gaussResize(v159.width/16, v159.height/16).gaussResize(v159.width, v159.height)
    v159 = v159o.mt_merge(v159b, v159_m, luma = true)
}
else
{
    flip = false
    if (v159_angle < 0)
    {
        v159 = v159.flipHorizontal()
        v159_angle = -v159_angle
        flip = true
    }

    v159 = v159.rotate(-v159_angle)
    v159 = v159.fill_wedges(a = v159_angle)

    v159o = v159
    if (flip)
    {
        v159_m = v159.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v159_m = v159.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v159_m = v159.prepare_solid_mask(w = 170, h = 120)
        v159 = v159.convertToRGB32(interlaced=false, matrix="PC.709")
        v159 = v159.ExInpaint(mask = v159_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v159 = v159.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v159_m = v159_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v159_m = v159_m.gaussResize(v159.width/8, v159.height/8).gaussResize(v159.width, v159.height)
    v159b = v159.gaussResize(v159.width/16, v159.height/16).gaussResize(v159.width, v159.height)
    v159 = v159o.mt_merge(v159b, v159_m, luma = true)
    if (flip)
    {
        v159 = v159.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v159_m = v159_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v159_m = v159_m.gaussResize(vv159.width/8, v159.height/8).gaussResize(v159.width, v159.height)
    v159_129 = v159.trim(129, -1)
    v159 = v159.trim(0, 129) + v159.trim(130, 138).mt_merge(v159_129.loop(10), v159_m, luma = true) + v159.trim(139, 0)
*/
    #v159 = v159.crop(78, 0, 0, -56)#.adjustBorders
}

v159 = v159.audioDub(va)

last = v159#.hist_levels
prefetch

