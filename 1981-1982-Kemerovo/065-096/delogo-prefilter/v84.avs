import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v84 = v84.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v84 = v84.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v84_angle"))
{
    v84o = v84

    v84_m = v84.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v84 = v84.convertToRGB32(interlaced=false, matrix="PC.709")

    v84 = v84.ExInpaint(mask = v84_m)
    v84 = v84.convertToYV24(interlaced=false, matrix="PC.709")

    v84_m = v84_m.convertToYV24(interlaced=false, matrix="PC.709")
    v84_m = v84_m.gaussResize(v84.width/8, v84.height/8).gaussResize(v84.width, v84.height)
    v84b = v84.gaussResize(v84.width/16, v84.height/16).gaussResize(v84.width, v84.height)
    v84 = v84o.mt_merge(v84b, v84_m, luma = true)
}
else
{
    flip = false
    if (v84_angle < 0)
    {
        v84 = v84.flipHorizontal()
        v84_angle = -v84_angle
        flip = true
    }

    v84 = v84.rotate(-v84_angle)
    v84 = v84.fill_wedges(a = v84_angle)

    v84o = v84
    if (flip)
    {
        v84_m = v84.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v84_m = v84.prepare_solid_mask(w = 170, h = 120)
        v84 = v84.convertToRGB32(interlaced=false, matrix="PC.709")
        v84 = v84.ExInpaint(mask = v84_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v84 = v84.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v84_m = v84_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v84_m = v84_m.gaussResize(v84.width/8, v84.height/8).gaussResize(v84.width, v84.height)
    v84b = v84.gaussResize(v84.width/16, v84.height/16).gaussResize(v84.width, v84.height)
    v84 = v84o.mt_merge(v84b, v84_m, luma = true)
    if (flip)
    {
        v84 = v84.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v84_m = v84_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v84_m = v84_m.gaussResize(vv84.width/8, v84.height/8).gaussResize(v84.width, v84.height)
    v84_129 = v84.trim(129, -1)
    v84 = v84.trim(0, 129) + v84.trim(130, 138).mt_merge(v84_129.loop(10), v84_m, luma = true) + v84.trim(139, 0)
*/
    #v84 = v84.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v84, audio_rate = 48000, channels = 2).killVideo
v84 = v84.audioDub(va)

last = v84#.hist_levels
prefetch

