import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v150, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v150.audioDub(va).prefetch
}

v150o = v150
#v150 = v150.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v150 = v150.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v150o.interleave(v150).prefetch
return v150.audioDub(va).prefetch

if (!varExist("v150_angle"))
{
    v150o = v150

    v150_m = v150.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v150 = v150.convertToRGB32(interlaced=false, matrix="PC.709")

    v150 = v150.ExInpaint(mask = v150_m)
    v150 = v150.convertToYV24(interlaced=false, matrix="PC.709")

    v150_m = v150_m.convertToYV24(interlaced=false, matrix="PC.709")
    v150_m = v150_m.gaussResize(v150.width/8, v150.height/8).gaussResize(v150.width, v150.height)
    v150b = v150.gaussResize(v150.width/16, v150.height/16).gaussResize(v150.width, v150.height)
    v150 = v150o.mt_merge(v150b, v150_m, luma = true)
}
else
{
    flip = false
    if (v150_angle < 0)
    {
        v150 = v150.flipHorizontal()
        v150_angle = -v150_angle
        flip = true
    }

    v150 = v150.rotate(-v150_angle)
    v150 = v150.fill_wedges(a = v150_angle)

    v150o = v150
    if (flip)
    {
        v150_m = v150.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v150_m = v150.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v150_m = v150.prepare_solid_mask(w = 170, h = 120)
        v150 = v150.convertToRGB32(interlaced=false, matrix="PC.709")
        v150 = v150.ExInpaint(mask = v150_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v150 = v150.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v150_m = v150_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v150_m = v150_m.gaussResize(v150.width/8, v150.height/8).gaussResize(v150.width, v150.height)
    v150b = v150.gaussResize(v150.width/16, v150.height/16).gaussResize(v150.width, v150.height)
    v150 = v150o.mt_merge(v150b, v150_m, luma = true)
    if (flip)
    {
        v150 = v150.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v150_m = v150_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v150_m = v150_m.gaussResize(vv150.width/8, v150.height/8).gaussResize(v150.width, v150.height)
    v150_129 = v150.trim(129, -1)
    v150 = v150.trim(0, 129) + v150.trim(130, 138).mt_merge(v150_129.loop(10), v150_m, luma = true) + v150.trim(139, 0)
*/
    #v150 = v150.crop(78, 0, 0, -56)#.adjustBorders
}

v150 = v150.audioDub(va)

last = v150#.hist_levels
prefetch

