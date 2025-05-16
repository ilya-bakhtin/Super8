import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v129, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v129.audioDub(va).prefetch
}

v129o = v129
#v129 = v129.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v129 = v129.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v129o.interleave(v129).prefetch
return v129.audioDub(va).prefetch

if (!varExist("v129_angle"))
{
    v129o = v129

    v129_m = v129.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v129 = v129.convertToRGB32(interlaced=false, matrix="PC.709")

    v129 = v129.ExInpaint(mask = v129_m)
    v129 = v129.convertToYV24(interlaced=false, matrix="PC.709")

    v129_m = v129_m.convertToYV24(interlaced=false, matrix="PC.709")
    v129_m = v129_m.gaussResize(v129.width/8, v129.height/8).gaussResize(v129.width, v129.height)
    v129b = v129.gaussResize(v129.width/16, v129.height/16).gaussResize(v129.width, v129.height)
    v129 = v129o.mt_merge(v129b, v129_m, luma = true)
}
else
{
    flip = false
    if (v129_angle < 0)
    {
        v129 = v129.flipHorizontal()
        v129_angle = -v129_angle
        flip = true
    }

    v129 = v129.rotate(-v129_angle)
    v129 = v129.fill_wedges(a = v129_angle)

    v129o = v129
    if (flip)
    {
        v129_m = v129.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v129_m = v129.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v129_m = v129.prepare_solid_mask(w = 170, h = 120)
        v129 = v129.convertToRGB32(interlaced=false, matrix="PC.709")
        v129 = v129.ExInpaint(mask = v129_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v129 = v129.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v129_m = v129_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v129_m = v129_m.gaussResize(v129.width/8, v129.height/8).gaussResize(v129.width, v129.height)
    v129b = v129.gaussResize(v129.width/16, v129.height/16).gaussResize(v129.width, v129.height)
    v129 = v129o.mt_merge(v129b, v129_m, luma = true)
    if (flip)
    {
        v129 = v129.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v129_m = v129_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v129_m = v129_m.gaussResize(vv129.width/8, v129.height/8).gaussResize(v129.width, v129.height)
    v129_129 = v129.trim(129, -1)
    v129 = v129.trim(0, 129) + v129.trim(130, 138).mt_merge(v129_129.loop(10), v129_m, luma = true) + v129.trim(139, 0)
*/
    #v129 = v129.crop(78, 0, 0, -56)#.adjustBorders
}

v129 = v129.audioDub(va)

last = v129#.hist_levels
prefetch

