import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v127 = v127.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v127 = v127.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v127_angle"))
{
    flip = false
    if (v127_angle < 0)
    {
        v127 = v127.flipHorizontal()
        v127_angle = -v127_angle
        flip = true
    }

    v127 = v127.rotate(-v127_angle)
    v127 = v127.fill_wedges(a = v127_angle)

    v127o = v127
    if (flip)
    {
        v127_m = v127.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v127_m = v127.prepare_solid_mask(w = 160, h = 170)
        v127 = v127.convertToRGB32(interlaced=false, matrix="PC.709")
        v127 = v127.ExInpaint(mask = v127_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v127 = v127.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v127_m = v127_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v127_m = v127_m.gaussResize(v127.width/8, v127.height/8).gaussResize(v127.width, v127.height)
    v127b = v127.gaussResize(v127.width/16, v127.height/16).gaussResize(v127.width, v127.height)
    v127 = v127o.mt_merge(v127b, v127_m, luma = true)
    if (flip)
    {
        v127 = v127.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v127_m = v127_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v127_m = v127_m.gaussResize(vv127.width/8, v127.height/8).gaussResize(v127.width, v127.height)
    v127_129 = v127.trim(129, -1)
    v127 = v127.trim(0, 129) + v127.trim(130, 138).mt_merge(v127_129.loop(10), v127_m, luma = true) + v127.trim(139, 0)
*/
    #v127 = v127.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v127, audio_rate = 48000, channels = 2).killVideo
v127 = v127.audioDub(va)

last = v127#.hist_levels
prefetch

