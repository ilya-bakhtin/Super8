import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

#v92 = v92.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v92 = v92.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v92_angle"))
{
    flip = false
    if (v92_angle < 0)
    {
        v92 = v92.flipHorizontal()
        v92_angle = -v92_angle
        flip = true
    }

#    v92 = v92.rotate(-v92_angle)
#    v92 = v92.fill_wedges(a = v92_angle)

    v92o = v92
    if (flip)
    {
        v92_m = v92.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v92_m = v92.prepare_solid_mask(w = 160, h = 50)
        v92 = v92.convertToRGB32(interlaced=false, matrix="PC.709")
        v92 = v92.ExInpaint(mask = v92_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v92 = v92.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v92_m = v92_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v92_m = v92_m.gaussResize(v92.width/8, v92.height/8).gaussResize(v92.width, v92.height)
    v92b = v92.gaussResize(v92.width/16, v92.height/16).gaussResize(v92.width, v92.height)
    v92 = v92o.mt_merge(v92b, v92_m, luma = true)
    if (flip)
    {
        v92 = v92.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v92_m = v92_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v92_m = v92_m.gaussResize(vv92.width/8, v92.height/8).gaussResize(v92.width, v92.height)
    v92_129 = v92.trim(129, -1)
    v92 = v92.trim(0, 129) + v92.trim(130, 138).mt_merge(v92_129.loop(10), v92_m, luma = true) + v92.trim(139, 0)
*/
    #v92 = v92.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v92, audio_rate = 48000, channels = 2).killVideo
v92 = v92.audioDub(va)

last = v92#.hist_levels
prefetch

