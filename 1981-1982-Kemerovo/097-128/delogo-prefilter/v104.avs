import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v104, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v104.audioDub(va).prefetch
}

v104o = v104
#v104 = v104.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v104 = v104.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v104o.interleave(v104).prefetch
return v104.audioDub(va).prefetch

if (!varExist("v104_angle"))
{
    v104o = v104

    v104_m = v104.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v104 = v104.convertToRGB32(interlaced=false, matrix="PC.709")

    v104 = v104.ExInpaint(mask = v104_m)
    v104 = v104.convertToYV24(interlaced=false, matrix="PC.709")

    v104_m = v104_m.convertToYV24(interlaced=false, matrix="PC.709")
    v104_m = v104_m.gaussResize(v104.width/8, v104.height/8).gaussResize(v104.width, v104.height)
    v104b = v104.gaussResize(v104.width/16, v104.height/16).gaussResize(v104.width, v104.height)
    v104 = v104o.mt_merge(v104b, v104_m, luma = true)
}
else
{
    flip = false
    if (v104_angle < 0)
    {
        v104 = v104.flipHorizontal()
        v104_angle = -v104_angle
        flip = true
    }

    v104 = v104.rotate(-v104_angle)
    v104 = v104.fill_wedges(a = v104_angle)

    v104o = v104
    if (flip)
    {
        v104_m = v104.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v104_m = v104.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v104_m = v104.prepare_solid_mask(w = 170, h = 120)
        v104 = v104.convertToRGB32(interlaced=false, matrix="PC.709")
        v104 = v104.ExInpaint(mask = v104_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v104 = v104.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v104_m = v104_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v104_m = v104_m.gaussResize(v104.width/8, v104.height/8).gaussResize(v104.width, v104.height)
    v104b = v104.gaussResize(v104.width/16, v104.height/16).gaussResize(v104.width, v104.height)
    v104 = v104o.mt_merge(v104b, v104_m, luma = true)
    if (flip)
    {
        v104 = v104.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v104_m = v104_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v104_m = v104_m.gaussResize(vv104.width/8, v104.height/8).gaussResize(v104.width, v104.height)
    v104_129 = v104.trim(129, -1)
    v104 = v104.trim(0, 129) + v104.trim(130, 138).mt_merge(v104_129.loop(10), v104_m, luma = true) + v104.trim(139, 0)
*/
    #v104 = v104.crop(78, 0, 0, -56)#.adjustBorders
}

v104 = v104.audioDub(va)

last = v104#.hist_levels
prefetch

