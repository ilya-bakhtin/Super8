import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v115 = v115.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v115 = v115.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v115_angle"))
{
    flip = false
    if (v115_angle < 0)
    {
        v115 = v115.flipHorizontal()
        v115_angle = -v115_angle
        flip = true
    }

    v115 = v115.rotate(-v115_angle)
    v115 = v115.fill_wedges(a = v115_angle)

    v115o = v115
    if (flip)
    {
        v115_m = v115.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v115_m = v115.prepare_solid_mask(w = 160, h = 170)
        v115 = v115.convertToRGB32(interlaced=false, matrix="PC.709")
        v115 = v115.ExInpaint(mask = v115_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v115 = v115.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v115_m = v115_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v115_m = v115_m.gaussResize(v115.width/8, v115.height/8).gaussResize(v115.width, v115.height)
    v115b = v115.gaussResize(v115.width/16, v115.height/16).gaussResize(v115.width, v115.height)
    v115 = v115o.mt_merge(v115b, v115_m, luma = true)
    if (flip)
    {
        v115 = v115.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v115_m = v115_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v115_m = v115_m.gaussResize(vv115.width/8, v115.height/8).gaussResize(v115.width, v115.height)
    v115_129 = v115.trim(129, -1)
    v115 = v115.trim(0, 129) + v115.trim(130, 138).mt_merge(v115_129.loop(10), v115_m, luma = true) + v115.trim(139, 0)
*/
    #v115 = v115.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v115, audio_rate = 48000, channels = 2).killVideo
v115 = v115.audioDub(va)

last = v115#.hist_levels
prefetch

