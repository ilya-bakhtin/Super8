import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

simple = true

va = BlankClip(v155, audio_rate = 48000, channels = 2).killVideo

if (varExist("simple") && simple)
{
    return v155.audioDub(va).prefetch
}

v155o = v155
#v155 = v155.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v155 = v155.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
return v155o.interleave(v155).prefetch
return v155.audioDub(va).prefetch

if (!varExist("v155_angle"))
{
    v155o = v155

    v155_m = v155.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v155 = v155.convertToRGB32(interlaced=false, matrix="PC.709")

    v155 = v155.ExInpaint(mask = v155_m)
    v155 = v155.convertToYV24(interlaced=false, matrix="PC.709")

    v155_m = v155_m.convertToYV24(interlaced=false, matrix="PC.709")
    v155_m = v155_m.gaussResize(v155.width/8, v155.height/8).gaussResize(v155.width, v155.height)
    v155b = v155.gaussResize(v155.width/16, v155.height/16).gaussResize(v155.width, v155.height)
    v155 = v155o.mt_merge(v155b, v155_m, luma = true)
}
else
{
    flip = false
    if (v155_angle < 0)
    {
        v155 = v155.flipHorizontal()
        v155_angle = -v155_angle
        flip = true
    }

    v155 = v155.rotate(-v155_angle)
    v155 = v155.fill_wedges(a = v155_angle)

    v155o = v155
    if (flip)
    {
        v155_m = v155.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v155_m = v155.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v155_m = v155.prepare_solid_mask(w = 170, h = 120)
        v155 = v155.convertToRGB32(interlaced=false, matrix="PC.709")
        v155 = v155.ExInpaint(mask = v155_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v155 = v155.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v155_m = v155_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v155_m = v155_m.gaussResize(v155.width/8, v155.height/8).gaussResize(v155.width, v155.height)
    v155b = v155.gaussResize(v155.width/16, v155.height/16).gaussResize(v155.width, v155.height)
    v155 = v155o.mt_merge(v155b, v155_m, luma = true)
    if (flip)
    {
        v155 = v155.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v155_m = v155_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v155_m = v155_m.gaussResize(vv155.width/8, v155.height/8).gaussResize(v155.width, v155.height)
    v155_129 = v155.trim(129, -1)
    v155 = v155.trim(0, 129) + v155.trim(130, 138).mt_merge(v155_129.loop(10), v155_m, luma = true) + v155.trim(139, 0)
*/
    #v155 = v155.crop(78, 0, 0, -56)#.adjustBorders
}

v155 = v155.audioDub(va)

last = v155#.hist_levels
prefetch

