import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v144, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v144.audioDub(va).prefetch
}

v144o = v144
#v144 = v144.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v144 = v144.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v144o.interleave(v144).prefetch
return v144.audioDub(va).prefetch

if (!varExist("v144_angle"))
{
    v144o = v144

    v144_m = v144.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v144 = v144.convertToRGB32(interlaced=false, matrix="PC.709")

    v144 = v144.ExInpaint(mask = v144_m)
    v144 = v144.convertToYV24(interlaced=false, matrix="PC.709")

    v144_m = v144_m.convertToYV24(interlaced=false, matrix="PC.709")
    v144_m = v144_m.gaussResize(v144.width/8, v144.height/8).gaussResize(v144.width, v144.height)
    v144b = v144.gaussResize(v144.width/16, v144.height/16).gaussResize(v144.width, v144.height)
    v144 = v144o.mt_merge(v144b, v144_m, luma = true)
}
else
{
    flip = false
    if (v144_angle < 0)
    {
        v144 = v144.flipHorizontal()
        v144_angle = -v144_angle
        flip = true
    }

    v144 = v144.rotate(-v144_angle)
    v144 = v144.fill_wedges(a = v144_angle)

    v144o = v144
    if (flip)
    {
        v144_m = v144.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v144_m = v144.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v144_m = v144.prepare_solid_mask(w = 170, h = 120)
        v144 = v144.convertToRGB32(interlaced=false, matrix="PC.709")
        v144 = v144.ExInpaint(mask = v144_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v144 = v144.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v144_m = v144_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v144_m = v144_m.gaussResize(v144.width/8, v144.height/8).gaussResize(v144.width, v144.height)
    v144b = v144.gaussResize(v144.width/16, v144.height/16).gaussResize(v144.width, v144.height)
    v144 = v144o.mt_merge(v144b, v144_m, luma = true)
    if (flip)
    {
        v144 = v144.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v144_m = v144_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v144_m = v144_m.gaussResize(vv144.width/8, v144.height/8).gaussResize(v144.width, v144.height)
    v144_129 = v144.trim(129, -1)
    v144 = v144.trim(0, 129) + v144.trim(130, 138).mt_merge(v144_129.loop(10), v144_m, luma = true) + v144.trim(139, 0)
*/
    #v144 = v144.crop(78, 0, 0, -56)#.adjustBorders
}

v144 = v144.audioDub(va)

last = v144#.hist_levels
prefetch

