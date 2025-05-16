import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v146, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v146.audioDub(va).prefetch
}

v146o = v146
#v146 = v146.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v146 = v146.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v146o.interleave(v146).prefetch
return v146.audioDub(va).prefetch

if (!varExist("v146_angle"))
{
    v146o = v146

    v146_m = v146.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v146 = v146.convertToRGB32(interlaced=false, matrix="PC.709")

    v146 = v146.ExInpaint(mask = v146_m)
    v146 = v146.convertToYV24(interlaced=false, matrix="PC.709")

    v146_m = v146_m.convertToYV24(interlaced=false, matrix="PC.709")
    v146_m = v146_m.gaussResize(v146.width/8, v146.height/8).gaussResize(v146.width, v146.height)
    v146b = v146.gaussResize(v146.width/16, v146.height/16).gaussResize(v146.width, v146.height)
    v146 = v146o.mt_merge(v146b, v146_m, luma = true)
}
else
{
    flip = false
    if (v146_angle < 0)
    {
        v146 = v146.flipHorizontal()
        v146_angle = -v146_angle
        flip = true
    }

    v146 = v146.rotate(-v146_angle)
    v146 = v146.fill_wedges(a = v146_angle)

    v146o = v146
    if (flip)
    {
        v146_m = v146.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v146_m = v146.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v146_m = v146.prepare_solid_mask(w = 170, h = 120)
        v146 = v146.convertToRGB32(interlaced=false, matrix="PC.709")
        v146 = v146.ExInpaint(mask = v146_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v146 = v146.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v146_m = v146_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v146_m = v146_m.gaussResize(v146.width/8, v146.height/8).gaussResize(v146.width, v146.height)
    v146b = v146.gaussResize(v146.width/16, v146.height/16).gaussResize(v146.width, v146.height)
    v146 = v146o.mt_merge(v146b, v146_m, luma = true)
    if (flip)
    {
        v146 = v146.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v146_m = v146_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v146_m = v146_m.gaussResize(vv146.width/8, v146.height/8).gaussResize(v146.width, v146.height)
    v146_129 = v146.trim(129, -1)
    v146 = v146.trim(0, 129) + v146.trim(130, 138).mt_merge(v146_129.loop(10), v146_m, luma = true) + v146.trim(139, 0)
*/
    #v146 = v146.crop(78, 0, 0, -56)#.adjustBorders
}

v146 = v146.audioDub(va)

last = v146#.hist_levels
prefetch

