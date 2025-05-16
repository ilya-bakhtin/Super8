import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v154, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v154.audioDub(va).prefetch
}

v154o = v154
#v154 = v154.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v154 = v154.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v154o.interleave(v154).prefetch
return v154.audioDub(va).prefetch

if (!varExist("v154_angle"))
{
    v154o = v154

    v154_m = v154.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v154 = v154.convertToRGB32(interlaced=false, matrix="PC.709")

    v154 = v154.ExInpaint(mask = v154_m)
    v154 = v154.convertToYV24(interlaced=false, matrix="PC.709")

    v154_m = v154_m.convertToYV24(interlaced=false, matrix="PC.709")
    v154_m = v154_m.gaussResize(v154.width/8, v154.height/8).gaussResize(v154.width, v154.height)
    v154b = v154.gaussResize(v154.width/16, v154.height/16).gaussResize(v154.width, v154.height)
    v154 = v154o.mt_merge(v154b, v154_m, luma = true)
}
else
{
    flip = false
    if (v154_angle < 0)
    {
        v154 = v154.flipHorizontal()
        v154_angle = -v154_angle
        flip = true
    }

    v154 = v154.rotate(-v154_angle)
    v154 = v154.fill_wedges(a = v154_angle)

    v154o = v154
    if (flip)
    {
        v154_m = v154.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v154_m = v154.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v154_m = v154.prepare_solid_mask(w = 170, h = 120)
        v154 = v154.convertToRGB32(interlaced=false, matrix="PC.709")
        v154 = v154.ExInpaint(mask = v154_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v154 = v154.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v154_m = v154_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v154_m = v154_m.gaussResize(v154.width/8, v154.height/8).gaussResize(v154.width, v154.height)
    v154b = v154.gaussResize(v154.width/16, v154.height/16).gaussResize(v154.width, v154.height)
    v154 = v154o.mt_merge(v154b, v154_m, luma = true)
    if (flip)
    {
        v154 = v154.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v154_m = v154_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v154_m = v154_m.gaussResize(vv154.width/8, v154.height/8).gaussResize(v154.width, v154.height)
    v154_129 = v154.trim(129, -1)
    v154 = v154.trim(0, 129) + v154.trim(130, 138).mt_merge(v154_129.loop(10), v154_m, luma = true) + v154.trim(139, 0)
*/
    #v154 = v154.crop(78, 0, 0, -56)#.adjustBorders
}

v154 = v154.audioDub(va)

last = v154#.hist_levels
prefetch

