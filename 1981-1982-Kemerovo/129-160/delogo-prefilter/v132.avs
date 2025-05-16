import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v132, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v132.audioDub(va).prefetch
}

v132o = v132
#v132 = v132.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v132 = v132.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v132o.interleave(v132).prefetch
return v132.audioDub(va).prefetch

if (!varExist("v132_angle"))
{
    v132o = v132

    v132_m = v132.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v132 = v132.convertToRGB32(interlaced=false, matrix="PC.709")

    v132 = v132.ExInpaint(mask = v132_m)
    v132 = v132.convertToYV24(interlaced=false, matrix="PC.709")

    v132_m = v132_m.convertToYV24(interlaced=false, matrix="PC.709")
    v132_m = v132_m.gaussResize(v132.width/8, v132.height/8).gaussResize(v132.width, v132.height)
    v132b = v132.gaussResize(v132.width/16, v132.height/16).gaussResize(v132.width, v132.height)
    v132 = v132o.mt_merge(v132b, v132_m, luma = true)
}
else
{
    flip = false
    if (v132_angle < 0)
    {
        v132 = v132.flipHorizontal()
        v132_angle = -v132_angle
        flip = true
    }

    v132 = v132.rotate(-v132_angle)
    v132 = v132.fill_wedges(a = v132_angle)

    v132o = v132
    if (flip)
    {
        v132_m = v132.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v132_m = v132.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v132_m = v132.prepare_solid_mask(w = 170, h = 120)
        v132 = v132.convertToRGB32(interlaced=false, matrix="PC.709")
        v132 = v132.ExInpaint(mask = v132_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v132 = v132.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v132_m = v132_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v132_m = v132_m.gaussResize(v132.width/8, v132.height/8).gaussResize(v132.width, v132.height)
    v132b = v132.gaussResize(v132.width/16, v132.height/16).gaussResize(v132.width, v132.height)
    v132 = v132o.mt_merge(v132b, v132_m, luma = true)
    if (flip)
    {
        v132 = v132.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v132_m = v132_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v132_m = v132_m.gaussResize(vv132.width/8, v132.height/8).gaussResize(v132.width, v132.height)
    v132_129 = v132.trim(129, -1)
    v132 = v132.trim(0, 129) + v132.trim(130, 138).mt_merge(v132_129.loop(10), v132_m, luma = true) + v132.trim(139, 0)
*/
    #v132 = v132.crop(78, 0, 0, -56)#.adjustBorders
}

v132 = v132.audioDub(va)

last = v132#.hist_levels
prefetch

