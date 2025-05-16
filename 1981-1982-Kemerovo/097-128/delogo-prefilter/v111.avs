import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v111, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v111.audioDub(va).prefetch
}

v111o = v111
#v111 = v111.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v111 = v111.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v111o.interleave(v111).prefetch
return v111.audioDub(va).prefetch

if (!varExist("v111_angle"))
{
    v111o = v111

    v111_m = v111.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v111 = v111.convertToRGB32(interlaced=false, matrix="PC.709")

    v111 = v111.ExInpaint(mask = v111_m)
    v111 = v111.convertToYV24(interlaced=false, matrix="PC.709")

    v111_m = v111_m.convertToYV24(interlaced=false, matrix="PC.709")
    v111_m = v111_m.gaussResize(v111.width/8, v111.height/8).gaussResize(v111.width, v111.height)
    v111b = v111.gaussResize(v111.width/16, v111.height/16).gaussResize(v111.width, v111.height)
    v111 = v111o.mt_merge(v111b, v111_m, luma = true)
}
else
{
    flip = false
    if (v111_angle < 0)
    {
        v111 = v111.flipHorizontal()
        v111_angle = -v111_angle
        flip = true
    }

    v111 = v111.rotate(-v111_angle)
    v111 = v111.fill_wedges(a = v111_angle)

    v111o = v111
    if (flip)
    {
        v111_m = v111.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v111_m = v111.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v111_m = v111.prepare_solid_mask(w = 170, h = 120)
        v111 = v111.convertToRGB32(interlaced=false, matrix="PC.709")
        v111 = v111.ExInpaint(mask = v111_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v111 = v111.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v111_m = v111_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v111_m = v111_m.gaussResize(v111.width/8, v111.height/8).gaussResize(v111.width, v111.height)
    v111b = v111.gaussResize(v111.width/16, v111.height/16).gaussResize(v111.width, v111.height)
    v111 = v111o.mt_merge(v111b, v111_m, luma = true)
    if (flip)
    {
        v111 = v111.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v111_m = v111_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v111_m = v111_m.gaussResize(vv111.width/8, v111.height/8).gaussResize(v111.width, v111.height)
    v111_129 = v111.trim(129, -1)
    v111 = v111.trim(0, 129) + v111.trim(130, 138).mt_merge(v111_129.loop(10), v111_m, luma = true) + v111.trim(139, 0)
*/
    #v111 = v111.crop(78, 0, 0, -56)#.adjustBorders
}

v111 = v111.audioDub(va)

last = v111#.hist_levels
prefetch

