import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v152, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v152.audioDub(va).prefetch
}

v152o = v152
#v152 = v152.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v152 = v152.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v152o.interleave(v152).prefetch
return v152.audioDub(va).prefetch

if (!varExist("v152_angle"))
{
    v152o = v152

    v152_m = v152.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v152 = v152.convertToRGB32(interlaced=false, matrix="PC.709")

    v152 = v152.ExInpaint(mask = v152_m)
    v152 = v152.convertToYV24(interlaced=false, matrix="PC.709")

    v152_m = v152_m.convertToYV24(interlaced=false, matrix="PC.709")
    v152_m = v152_m.gaussResize(v152.width/8, v152.height/8).gaussResize(v152.width, v152.height)
    v152b = v152.gaussResize(v152.width/16, v152.height/16).gaussResize(v152.width, v152.height)
    v152 = v152o.mt_merge(v152b, v152_m, luma = true)
}
else
{
    flip = false
    if (v152_angle < 0)
    {
        v152 = v152.flipHorizontal()
        v152_angle = -v152_angle
        flip = true
    }

    v152 = v152.rotate(-v152_angle)
    v152 = v152.fill_wedges(a = v152_angle)

    v152o = v152
    if (flip)
    {
        v152_m = v152.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v152_m = v152.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v152_m = v152.prepare_solid_mask(w = 170, h = 120)
        v152 = v152.convertToRGB32(interlaced=false, matrix="PC.709")
        v152 = v152.ExInpaint(mask = v152_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v152 = v152.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v152_m = v152_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v152_m = v152_m.gaussResize(v152.width/8, v152.height/8).gaussResize(v152.width, v152.height)
    v152b = v152.gaussResize(v152.width/16, v152.height/16).gaussResize(v152.width, v152.height)
    v152 = v152o.mt_merge(v152b, v152_m, luma = true)
    if (flip)
    {
        v152 = v152.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v152_m = v152_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v152_m = v152_m.gaussResize(vv152.width/8, v152.height/8).gaussResize(v152.width, v152.height)
    v152_129 = v152.trim(129, -1)
    v152 = v152.trim(0, 129) + v152.trim(130, 138).mt_merge(v152_129.loop(10), v152_m, luma = true) + v152.trim(139, 0)
*/
    #v152 = v152.crop(78, 0, 0, -56)#.adjustBorders
}

v152 = v152.audioDub(va)

last = v152#.hist_levels
prefetch

