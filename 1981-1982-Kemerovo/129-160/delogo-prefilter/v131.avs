import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v131, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v131.audioDub(va).prefetch
}

v131o = v131
#v131 = v131.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v131 = v131.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v131o.interleave(v131).prefetch
return v131.audioDub(va).prefetch

if (!varExist("v131_angle"))
{
    v131o = v131

    v131_m = v131.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v131 = v131.convertToRGB32(interlaced=false, matrix="PC.709")

    v131 = v131.ExInpaint(mask = v131_m)
    v131 = v131.convertToYV24(interlaced=false, matrix="PC.709")

    v131_m = v131_m.convertToYV24(interlaced=false, matrix="PC.709")
    v131_m = v131_m.gaussResize(v131.width/8, v131.height/8).gaussResize(v131.width, v131.height)
    v131b = v131.gaussResize(v131.width/16, v131.height/16).gaussResize(v131.width, v131.height)
    v131 = v131o.mt_merge(v131b, v131_m, luma = true)
}
else
{
    flip = false
    if (v131_angle < 0)
    {
        v131 = v131.flipHorizontal()
        v131_angle = -v131_angle
        flip = true
    }

    v131 = v131.rotate(-v131_angle)
    v131 = v131.fill_wedges(a = v131_angle)

    v131o = v131
    if (flip)
    {
        v131_m = v131.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v131_m = v131.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v131_m = v131.prepare_solid_mask(w = 170, h = 120)
        v131 = v131.convertToRGB32(interlaced=false, matrix="PC.709")
        v131 = v131.ExInpaint(mask = v131_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v131 = v131.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v131_m = v131_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v131_m = v131_m.gaussResize(v131.width/8, v131.height/8).gaussResize(v131.width, v131.height)
    v131b = v131.gaussResize(v131.width/16, v131.height/16).gaussResize(v131.width, v131.height)
    v131 = v131o.mt_merge(v131b, v131_m, luma = true)
    if (flip)
    {
        v131 = v131.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v131_m = v131_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v131_m = v131_m.gaussResize(vv131.width/8, v131.height/8).gaussResize(v131.width, v131.height)
    v131_129 = v131.trim(129, -1)
    v131 = v131.trim(0, 129) + v131.trim(130, 138).mt_merge(v131_129.loop(10), v131_m, luma = true) + v131.trim(139, 0)
*/
    #v131 = v131.crop(78, 0, 0, -56)#.adjustBorders
}

v131 = v131.audioDub(va)

last = v131#.hist_levels
prefetch

