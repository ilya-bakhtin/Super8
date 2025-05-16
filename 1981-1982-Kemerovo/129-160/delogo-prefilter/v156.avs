import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v156, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v156.audioDub(va).prefetch
}

v156o = v156
#v156 = v156.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v156 = v156.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v156o.interleave(v156).prefetch
return v156.audioDub(va).prefetch

if (!varExist("v156_angle"))
{
    v156o = v156

    v156_m = v156.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v156 = v156.convertToRGB32(interlaced=false, matrix="PC.709")

    v156 = v156.ExInpaint(mask = v156_m)
    v156 = v156.convertToYV24(interlaced=false, matrix="PC.709")

    v156_m = v156_m.convertToYV24(interlaced=false, matrix="PC.709")
    v156_m = v156_m.gaussResize(v156.width/8, v156.height/8).gaussResize(v156.width, v156.height)
    v156b = v156.gaussResize(v156.width/16, v156.height/16).gaussResize(v156.width, v156.height)
    v156 = v156o.mt_merge(v156b, v156_m, luma = true)
}
else
{
    flip = false
    if (v156_angle < 0)
    {
        v156 = v156.flipHorizontal()
        v156_angle = -v156_angle
        flip = true
    }

    v156 = v156.rotate(-v156_angle)
    v156 = v156.fill_wedges(a = v156_angle)

    v156o = v156
    if (flip)
    {
        v156_m = v156.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v156_m = v156.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v156_m = v156.prepare_solid_mask(w = 170, h = 120)
        v156 = v156.convertToRGB32(interlaced=false, matrix="PC.709")
        v156 = v156.ExInpaint(mask = v156_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v156 = v156.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v156_m = v156_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v156_m = v156_m.gaussResize(v156.width/8, v156.height/8).gaussResize(v156.width, v156.height)
    v156b = v156.gaussResize(v156.width/16, v156.height/16).gaussResize(v156.width, v156.height)
    v156 = v156o.mt_merge(v156b, v156_m, luma = true)
    if (flip)
    {
        v156 = v156.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v156_m = v156_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v156_m = v156_m.gaussResize(vv156.width/8, v156.height/8).gaussResize(v156.width, v156.height)
    v156_129 = v156.trim(129, -1)
    v156 = v156.trim(0, 129) + v156.trim(130, 138).mt_merge(v156_129.loop(10), v156_m, luma = true) + v156.trim(139, 0)
*/
    #v156 = v156.crop(78, 0, 0, -56)#.adjustBorders
}

v156 = v156.audioDub(va)

last = v156#.hist_levels
prefetch

