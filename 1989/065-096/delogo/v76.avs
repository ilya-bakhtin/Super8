import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v76 = v76.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v76 = v76.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v76_angle"))
{
    flip = false
    if (v76_angle < 0)
    {
        v76 = v76.flipHorizontal()
        v76_angle = -v76_angle
        flip = true
    }

    v76 = v76.rotate(-v76_angle)
    v76 = v76.fill_wedges(a = v76_angle)

    v76o = v76
    if (flip)
    {
        v76_m = v76.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v76_m = v76.prepare_solid_mask(w = 160, h = 170)
        v76 = v76.convertToRGB32(interlaced=false, matrix="PC.709")
        v76 = v76.ExInpaint(mask = v76_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v76 = v76.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v76_m = v76_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v76_m = v76_m.gaussResize(v76.width/8, v76.height/8).gaussResize(v76.width, v76.height)
    v76b = v76.gaussResize(v76.width/16, v76.height/16).gaussResize(v76.width, v76.height)
    v76 = v76o.mt_merge(v76b, v76_m, luma = true)
    if (flip)
    {
        v76 = v76.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v76_m = v76_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v76_m = v76_m.gaussResize(vv76.width/8, v76.height/8).gaussResize(v76.width, v76.height)
    v76_129 = v76.trim(129, -1)
    v76 = v76.trim(0, 129) + v76.trim(130, 138).mt_merge(v76_129.loop(10), v76_m, luma = true) + v76.trim(139, 0)
*/
    #v76 = v76.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v76, audio_rate = 48000, channels = 2).killVideo
v76 = v76.audioDub(va)

last = v76#.hist_levels
prefetch

