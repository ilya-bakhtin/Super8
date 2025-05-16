import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v157, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v157.audioDub(va).prefetch
}

v157o = v157
#v157 = v157.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v157 = v157.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v157o.interleave(v157).prefetch
return v157.audioDub(va).prefetch

if (!varExist("v157_angle"))
{
    v157o = v157

    v157_m = v157.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v157 = v157.convertToRGB32(interlaced=false, matrix="PC.709")

    v157 = v157.ExInpaint(mask = v157_m)
    v157 = v157.convertToYV24(interlaced=false, matrix="PC.709")

    v157_m = v157_m.convertToYV24(interlaced=false, matrix="PC.709")
    v157_m = v157_m.gaussResize(v157.width/8, v157.height/8).gaussResize(v157.width, v157.height)
    v157b = v157.gaussResize(v157.width/16, v157.height/16).gaussResize(v157.width, v157.height)
    v157 = v157o.mt_merge(v157b, v157_m, luma = true)
}
else
{
    flip = false
    if (v157_angle < 0)
    {
        v157 = v157.flipHorizontal()
        v157_angle = -v157_angle
        flip = true
    }

    v157 = v157.rotate(-v157_angle)
    v157 = v157.fill_wedges(a = v157_angle)

    v157o = v157
    if (flip)
    {
        v157_m = v157.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v157_m = v157.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v157_m = v157.prepare_solid_mask(w = 170, h = 120)
        v157 = v157.convertToRGB32(interlaced=false, matrix="PC.709")
        v157 = v157.ExInpaint(mask = v157_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v157 = v157.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v157_m = v157_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v157_m = v157_m.gaussResize(v157.width/8, v157.height/8).gaussResize(v157.width, v157.height)
    v157b = v157.gaussResize(v157.width/16, v157.height/16).gaussResize(v157.width, v157.height)
    v157 = v157o.mt_merge(v157b, v157_m, luma = true)
    if (flip)
    {
        v157 = v157.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v157_m = v157_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v157_m = v157_m.gaussResize(vv157.width/8, v157.height/8).gaussResize(v157.width, v157.height)
    v157_129 = v157.trim(129, -1)
    v157 = v157.trim(0, 129) + v157.trim(130, 138).mt_merge(v157_129.loop(10), v157_m, luma = true) + v157.trim(139, 0)
*/
    #v157 = v157.crop(78, 0, 0, -56)#.adjustBorders
}

v157 = v157.audioDub(va)

last = v157#.hist_levels
prefetch

