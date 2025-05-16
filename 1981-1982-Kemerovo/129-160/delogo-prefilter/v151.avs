import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v151, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v151.audioDub(va).prefetch
}

v151o = v151
#v151 = v151.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v151 = v151.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v151o.interleave(v151).prefetch
return v151.audioDub(va).prefetch

if (!varExist("v151_angle"))
{
    v151o = v151

    v151_m = v151.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v151 = v151.convertToRGB32(interlaced=false, matrix="PC.709")

    v151 = v151.ExInpaint(mask = v151_m)
    v151 = v151.convertToYV24(interlaced=false, matrix="PC.709")

    v151_m = v151_m.convertToYV24(interlaced=false, matrix="PC.709")
    v151_m = v151_m.gaussResize(v151.width/8, v151.height/8).gaussResize(v151.width, v151.height)
    v151b = v151.gaussResize(v151.width/16, v151.height/16).gaussResize(v151.width, v151.height)
    v151 = v151o.mt_merge(v151b, v151_m, luma = true)
}
else
{
    flip = false
    if (v151_angle < 0)
    {
        v151 = v151.flipHorizontal()
        v151_angle = -v151_angle
        flip = true
    }

    v151 = v151.rotate(-v151_angle)
    v151 = v151.fill_wedges(a = v151_angle)

    v151o = v151
    if (flip)
    {
        v151_m = v151.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v151_m = v151.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v151_m = v151.prepare_solid_mask(w = 170, h = 120)
        v151 = v151.convertToRGB32(interlaced=false, matrix="PC.709")
        v151 = v151.ExInpaint(mask = v151_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v151 = v151.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v151_m = v151_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v151_m = v151_m.gaussResize(v151.width/8, v151.height/8).gaussResize(v151.width, v151.height)
    v151b = v151.gaussResize(v151.width/16, v151.height/16).gaussResize(v151.width, v151.height)
    v151 = v151o.mt_merge(v151b, v151_m, luma = true)
    if (flip)
    {
        v151 = v151.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v151_m = v151_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v151_m = v151_m.gaussResize(vv151.width/8, v151.height/8).gaussResize(v151.width, v151.height)
    v151_129 = v151.trim(129, -1)
    v151 = v151.trim(0, 129) + v151.trim(130, 138).mt_merge(v151_129.loop(10), v151_m, luma = true) + v151.trim(139, 0)
*/
    #v151 = v151.crop(78, 0, 0, -56)#.adjustBorders
}

v151 = v151.audioDub(va)

last = v151#.hist_levels
prefetch

