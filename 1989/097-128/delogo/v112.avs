import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v112 = v112.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v112 = v112.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v112_angle"))
{
    flip = false
    if (v112_angle < 0)
    {
        v112 = v112.flipHorizontal()
        v112_angle = -v112_angle
        flip = true
    }

    v112 = v112.rotate(-v112_angle)
    v112 = v112.fill_wedges(a = v112_angle)

    v112o = v112
    if (flip)
    {
        v112_m = v112.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v112_m = v112.prepare_solid_mask(w = 160, h = 170)
        v112 = v112.convertToRGB32(interlaced=false, matrix="PC.709")
        v112 = v112.ExInpaint(mask = v112_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v112 = v112.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v112_m = v112_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v112_m = v112_m.gaussResize(v112.width/8, v112.height/8).gaussResize(v112.width, v112.height)
    v112b = v112.gaussResize(v112.width/16, v112.height/16).gaussResize(v112.width, v112.height)
    v112 = v112o.mt_merge(v112b, v112_m, luma = true)
    if (flip)
    {
        v112 = v112.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v112_m = v112_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v112_m = v112_m.gaussResize(vv112.width/8, v112.height/8).gaussResize(v112.width, v112.height)
    v112_129 = v112.trim(129, -1)
    v112 = v112.trim(0, 129) + v112.trim(130, 138).mt_merge(v112_129.loop(10), v112_m, luma = true) + v112.trim(139, 0)
*/
    #v112 = v112.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v112, audio_rate = 48000, channels = 2).killVideo
v112 = v112.audioDub(va)

last = v112#.hist_levels
prefetch

