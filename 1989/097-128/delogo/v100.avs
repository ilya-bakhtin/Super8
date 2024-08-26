import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")


v100 = v100.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 245, autolevel = false)
v100i = v100
v100 = v100.deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45).\
            deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45)
#v100 = v100i.interleave(v100)

if (varExist("v100_angle"))
{
    flip = false
    if (v100_angle < 0)
    {
        v100 = v100.flipHorizontal()
        v100_angle = -v100_angle
        flip = true
    }

#    v100 = v100.rotate(-v100_angle)
#    v100 = v100.fill_wedges(a = v100_angle)

    v100o = v100
    if (flip)
    {
        v100_m = v100.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v100_m = v100.prepare_solid_mask(w = 160, h = 30)
        v100 = v100.convertToRGB32(interlaced=false, matrix="PC.709")
        v100 = v100.ExInpaint(mask = v100_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v100 = v100.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v100_m = v100_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v100_m = v100_m.gaussResize(v100.width/8, v100.height/8).gaussResize(v100.width, v100.height)
    v100b = v100.gaussResize(v100.width/16, v100.height/16).gaussResize(v100.width, v100.height)
    v100 = v100o.mt_merge(v100b, v100_m, luma = true)
    if (flip)
    {
        v100 = v100.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v100_m = v100_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v100_m = v100_m.gaussResize(vv100.width/8, v100.height/8).gaussResize(v100.width, v100.height)
    v100_129 = v100.trim(129, -1)
    v100 = v100.trim(0, 129) + v100.trim(130, 138).mt_merge(v100_129.loop(10), v100_m, luma = true) + v100.trim(139, 0)
*/
    #v100 = v100.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v100, audio_rate = 48000, channels = 2).killVideo
v100 = v100.audioDub(va)

last = v100#.hist_levels
prefetch

