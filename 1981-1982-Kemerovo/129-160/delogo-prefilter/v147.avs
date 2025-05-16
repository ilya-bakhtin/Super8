import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v147, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v147.audioDub(va).prefetch
}

v147o = v147
#v147 = v147.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v147 = v147.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v147o.interleave(v147).prefetch
return v147.audioDub(va).prefetch

if (!varExist("v147_angle"))
{
    v147o = v147

    v147_m = v147.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v147 = v147.convertToRGB32(interlaced=false, matrix="PC.709")

    v147 = v147.ExInpaint(mask = v147_m)
    v147 = v147.convertToYV24(interlaced=false, matrix="PC.709")

    v147_m = v147_m.convertToYV24(interlaced=false, matrix="PC.709")
    v147_m = v147_m.gaussResize(v147.width/8, v147.height/8).gaussResize(v147.width, v147.height)
    v147b = v147.gaussResize(v147.width/16, v147.height/16).gaussResize(v147.width, v147.height)
    v147 = v147o.mt_merge(v147b, v147_m, luma = true)
}
else
{
    flip = false
    if (v147_angle < 0)
    {
        v147 = v147.flipHorizontal()
        v147_angle = -v147_angle
        flip = true
    }

    v147 = v147.rotate(-v147_angle)
    v147 = v147.fill_wedges(a = v147_angle)

    v147o = v147
    if (flip)
    {
        v147_m = v147.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v147_m = v147.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v147_m = v147.prepare_solid_mask(w = 170, h = 120)
        v147 = v147.convertToRGB32(interlaced=false, matrix="PC.709")
        v147 = v147.ExInpaint(mask = v147_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v147 = v147.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v147_m = v147_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v147_m = v147_m.gaussResize(v147.width/8, v147.height/8).gaussResize(v147.width, v147.height)
    v147b = v147.gaussResize(v147.width/16, v147.height/16).gaussResize(v147.width, v147.height)
    v147 = v147o.mt_merge(v147b, v147_m, luma = true)
    if (flip)
    {
        v147 = v147.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v147_m = v147_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v147_m = v147_m.gaussResize(vv147.width/8, v147.height/8).gaussResize(v147.width, v147.height)
    v147_129 = v147.trim(129, -1)
    v147 = v147.trim(0, 129) + v147.trim(130, 138).mt_merge(v147_129.loop(10), v147_m, luma = true) + v147.trim(139, 0)
*/
    #v147 = v147.crop(78, 0, 0, -56)#.adjustBorders
}

v147 = v147.audioDub(va)

last = v147#.hist_levels
prefetch

