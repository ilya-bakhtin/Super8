import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v158, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v158.audioDub(va).prefetch
}

v158o = v158
#v158 = v158.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v158 = v158.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v158o.interleave(v158).prefetch
return v158.audioDub(va).prefetch

if (!varExist("v158_angle"))
{
    v158o = v158

    v158_m = v158.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v158 = v158.convertToRGB32(interlaced=false, matrix="PC.709")

    v158 = v158.ExInpaint(mask = v158_m)
    v158 = v158.convertToYV24(interlaced=false, matrix="PC.709")

    v158_m = v158_m.convertToYV24(interlaced=false, matrix="PC.709")
    v158_m = v158_m.gaussResize(v158.width/8, v158.height/8).gaussResize(v158.width, v158.height)
    v158b = v158.gaussResize(v158.width/16, v158.height/16).gaussResize(v158.width, v158.height)
    v158 = v158o.mt_merge(v158b, v158_m, luma = true)
}
else
{
    flip = false
    if (v158_angle < 0)
    {
        v158 = v158.flipHorizontal()
        v158_angle = -v158_angle
        flip = true
    }

    v158 = v158.rotate(-v158_angle)
    v158 = v158.fill_wedges(a = v158_angle)

    v158o = v158
    if (flip)
    {
        v158_m = v158.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v158_m = v158.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v158_m = v158.prepare_solid_mask(w = 170, h = 120)
        v158 = v158.convertToRGB32(interlaced=false, matrix="PC.709")
        v158 = v158.ExInpaint(mask = v158_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v158 = v158.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v158_m = v158_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v158_m = v158_m.gaussResize(v158.width/8, v158.height/8).gaussResize(v158.width, v158.height)
    v158b = v158.gaussResize(v158.width/16, v158.height/16).gaussResize(v158.width, v158.height)
    v158 = v158o.mt_merge(v158b, v158_m, luma = true)
    if (flip)
    {
        v158 = v158.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v158_m = v158_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v158_m = v158_m.gaussResize(vv158.width/8, v158.height/8).gaussResize(v158.width, v158.height)
    v158_129 = v158.trim(129, -1)
    v158 = v158.trim(0, 129) + v158.trim(130, 138).mt_merge(v158_129.loop(10), v158_m, luma = true) + v158.trim(139, 0)
*/
    #v158 = v158.crop(78, 0, 0, -56)#.adjustBorders
}

v158 = v158.audioDub(va)

last = v158#.hist_levels
prefetch

