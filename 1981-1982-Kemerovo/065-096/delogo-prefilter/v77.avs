import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v77 = v77.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v77 = v77.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v77_angle"))
{
    v77o = v77

    v77_m = v77.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v77 = v77.convertToRGB32(interlaced=false, matrix="PC.709")

    v77 = v77.ExInpaint(mask = v77_m)
    v77 = v77.convertToYV24(interlaced=false, matrix="PC.709")

    v77_m = v77_m.convertToYV24(interlaced=false, matrix="PC.709")
    v77_m = v77_m.gaussResize(v77.width/8, v77.height/8).gaussResize(v77.width, v77.height)
    v77b = v77.gaussResize(v77.width/16, v77.height/16).gaussResize(v77.width, v77.height)
    v77 = v77o.mt_merge(v77b, v77_m, luma = true)
}
else
{
    flip = false
    if (v77_angle < 0)
    {
        v77 = v77.flipHorizontal()
        v77_angle = -v77_angle
        flip = true
    }

    v77 = v77.rotate(-v77_angle)
    v77 = v77.fill_wedges(a = v77_angle)

    v77o = v77
    if (flip)
    {
        v77_m = v77.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v77_m = v77.prepare_solid_mask(w = 170, h = 120)
        v77 = v77.convertToRGB32(interlaced=false, matrix="PC.709")
        v77 = v77.ExInpaint(mask = v77_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v77 = v77.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v77_m = v77_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v77_m = v77_m.gaussResize(v77.width/8, v77.height/8).gaussResize(v77.width, v77.height)
    v77b = v77.gaussResize(v77.width/16, v77.height/16).gaussResize(v77.width, v77.height)
    v77 = v77o.mt_merge(v77b, v77_m, luma = true)
    if (flip)
    {
        v77 = v77.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v77_m = v77_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v77_m = v77_m.gaussResize(vv77.width/8, v77.height/8).gaussResize(v77.width, v77.height)
    v77_129 = v77.trim(129, -1)
    v77 = v77.trim(0, 129) + v77.trim(130, 138).mt_merge(v77_129.loop(10), v77_m, luma = true) + v77.trim(139, 0)
*/
    #v77 = v77.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v77, audio_rate = 48000, channels = 2).killVideo
v77 = v77.audioDub(va)

last = v77#.hist_levels
prefetch

