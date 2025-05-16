import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v118, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v118.audioDub(va).prefetch
}

v118o = v118
#v118 = v118.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v118 = v118.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v118o.interleave(v118).prefetch
return v118.audioDub(va).prefetch

if (!varExist("v118_angle"))
{
    v118o = v118

    v118_m = v118.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v118 = v118.convertToRGB32(interlaced=false, matrix="PC.709")

    v118 = v118.ExInpaint(mask = v118_m)
    v118 = v118.convertToYV24(interlaced=false, matrix="PC.709")

    v118_m = v118_m.convertToYV24(interlaced=false, matrix="PC.709")
    v118_m = v118_m.gaussResize(v118.width/8, v118.height/8).gaussResize(v118.width, v118.height)
    v118b = v118.gaussResize(v118.width/16, v118.height/16).gaussResize(v118.width, v118.height)
    v118 = v118o.mt_merge(v118b, v118_m, luma = true)
}
else
{
    flip = false
    if (v118_angle < 0)
    {
        v118 = v118.flipHorizontal()
        v118_angle = -v118_angle
        flip = true
    }

    v118 = v118.rotate(-v118_angle)
    v118 = v118.fill_wedges(a = v118_angle)

    v118o = v118
    if (flip)
    {
        v118_m = v118.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v118_m = v118.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v118_m = v118.prepare_solid_mask(w = 170, h = 120)
        v118 = v118.convertToRGB32(interlaced=false, matrix="PC.709")
        v118 = v118.ExInpaint(mask = v118_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v118 = v118.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v118_m = v118_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v118_m = v118_m.gaussResize(v118.width/8, v118.height/8).gaussResize(v118.width, v118.height)
    v118b = v118.gaussResize(v118.width/16, v118.height/16).gaussResize(v118.width, v118.height)
    v118 = v118o.mt_merge(v118b, v118_m, luma = true)
    if (flip)
    {
        v118 = v118.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v118_m = v118_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v118_m = v118_m.gaussResize(vv118.width/8, v118.height/8).gaussResize(v118.width, v118.height)
    v118_129 = v118.trim(129, -1)
    v118 = v118.trim(0, 129) + v118.trim(130, 138).mt_merge(v118_129.loop(10), v118_m, luma = true) + v118.trim(139, 0)
*/
    #v118 = v118.crop(78, 0, 0, -56)#.adjustBorders
}

v118 = v118.audioDub(va)

last = v118#.hist_levels
prefetch

