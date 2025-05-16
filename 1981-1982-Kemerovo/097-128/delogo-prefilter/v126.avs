import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v126, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v126.audioDub(va).prefetch
}

v126o = v126
#v126 = v126.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v126 = v126.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v126o.interleave(v126).prefetch
return v126.audioDub(va).prefetch

if (!varExist("v126_angle"))
{
    v126o = v126

    v126_m = v126.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v126 = v126.convertToRGB32(interlaced=false, matrix="PC.709")

    v126 = v126.ExInpaint(mask = v126_m)
    v126 = v126.convertToYV24(interlaced=false, matrix="PC.709")

    v126_m = v126_m.convertToYV24(interlaced=false, matrix="PC.709")
    v126_m = v126_m.gaussResize(v126.width/8, v126.height/8).gaussResize(v126.width, v126.height)
    v126b = v126.gaussResize(v126.width/16, v126.height/16).gaussResize(v126.width, v126.height)
    v126 = v126o.mt_merge(v126b, v126_m, luma = true)
}
else
{
    flip = false
    if (v126_angle < 0)
    {
        v126 = v126.flipHorizontal()
        v126_angle = -v126_angle
        flip = true
    }

    v126 = v126.rotate(-v126_angle)
    v126 = v126.fill_wedges(a = v126_angle)

    v126o = v126
    if (flip)
    {
        v126_m = v126.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v126_m = v126.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v126_m = v126.prepare_solid_mask(w = 170, h = 120)
        v126 = v126.convertToRGB32(interlaced=false, matrix="PC.709")
        v126 = v126.ExInpaint(mask = v126_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v126 = v126.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v126_m = v126_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v126_m = v126_m.gaussResize(v126.width/8, v126.height/8).gaussResize(v126.width, v126.height)
    v126b = v126.gaussResize(v126.width/16, v126.height/16).gaussResize(v126.width, v126.height)
    v126 = v126o.mt_merge(v126b, v126_m, luma = true)
    if (flip)
    {
        v126 = v126.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v126_m = v126_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v126_m = v126_m.gaussResize(vv126.width/8, v126.height/8).gaussResize(v126.width, v126.height)
    v126_129 = v126.trim(129, -1)
    v126 = v126.trim(0, 129) + v126.trim(130, 138).mt_merge(v126_129.loop(10), v126_m, luma = true) + v126.trim(139, 0)
*/
    #v126 = v126.crop(78, 0, 0, -56)#.adjustBorders
}

v126 = v126.audioDub(va)

last = v126#.hist_levels
prefetch

