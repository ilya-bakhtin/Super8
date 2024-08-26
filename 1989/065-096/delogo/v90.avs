import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

#v90 = v90.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v90 = v90.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v90_angle"))
{
    flip = false
    if (v90_angle < 0)
    {
        v90 = v90.flipHorizontal()
        v90_angle = -v90_angle
        flip = true
    }

    v90 = v90.rotate(-v90_angle)
    v90 = v90.fill_wedges(a = v90_angle)

    v90o = v90
    if (flip)
    {
        v90_m = v90.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v90_m = v90.prepare_solid_mask(w = 160, h = 170)
        v90 = v90.convertToRGB32(interlaced=false, matrix="PC.709")
        v90 = v90.ExInpaint(mask = v90_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v90 = v90.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v90_m = v90_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v90_m = v90_m.gaussResize(v90.width/8, v90.height/8).gaussResize(v90.width, v90.height)
    v90b = v90.gaussResize(v90.width/16, v90.height/16).gaussResize(v90.width, v90.height)
    v90 = v90o.mt_merge(v90b, v90_m, luma = true)
    if (flip)
    {
        v90 = v90.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v90_m = v90_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v90_m = v90_m.gaussResize(vv90.width/8, v90.height/8).gaussResize(v90.width, v90.height)
    v90_129 = v90.trim(129, -1)
    v90 = v90.trim(0, 129) + v90.trim(130, 138).mt_merge(v90_129.loop(10), v90_m, luma = true) + v90.trim(139, 0)
*/
    #v90 = v90.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v90, audio_rate = 48000, channels = 2).killVideo
v90 = v90.audioDub(va)

last = v90#.hist_levels
prefetch

