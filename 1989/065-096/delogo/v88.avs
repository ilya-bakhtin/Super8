import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v88 = v88.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v88 = v88.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v88_angle"))
{
    flip = false
    if (v88_angle < 0)
    {
        v88 = v88.flipHorizontal()
        v88_angle = -v88_angle
        flip = true
    }

#    v88 = v88.rotate(-v88_angle)
#    v88 = v88.fill_wedges(a = v88_angle)

    v88o = v88
    if (flip)
    {
        v88_m = v88.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v88_m = v88.prepare_solid_mask(w = 140, h = 50)
        v88 = v88.convertToRGB32(interlaced=false, matrix="PC.709")
        v88 = v88.ExInpaint(mask = v88_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v88 = v88.convertToYV24(interlaced=false, matrix="PC.709")
    }
#    v88_m = v88_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v88_m = v88_m.gaussResize(v88.width/8, v88.height/8).gaussResize(v88.width, v88.height)
    v88b = v88.gaussResize(v88.width/16, v88.height/16).gaussResize(v88.width, v88.height)
    v88 = v88o.mt_merge(v88b, v88_m, luma = true)
    if (flip)
    {
        v88 = v88.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v88_m = v88_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v88_m = v88_m.gaussResize(vv88.width/8, v88.height/8).gaussResize(v88.width, v88.height)
    v88_129 = v88.trim(129, -1)
    v88 = v88.trim(0, 129) + v88.trim(130, 138).mt_merge(v88_129.loop(10), v88_m, luma = true) + v88.trim(139, 0)
*/
    #v88 = v88.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v88, audio_rate = 48000, channels = 2).killVideo
v88 = v88.audioDub(va)

last = v88#.hist_levels
prefetch

