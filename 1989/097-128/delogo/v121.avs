import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v121 = v121.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v121 = v121.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v121_angle"))
{
    flip = false
    if (v121_angle < 0)
    {
        v121 = v121.flipHorizontal()
        v121_angle = -v121_angle
        flip = true
    }

    v121 = v121.rotate(-v121_angle)
    v121 = v121.fill_wedges(a = v121_angle)

    v121o = v121
    if (flip)
    {
        v121_m = v121.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v121_m = v121.prepare_solid_mask(w = 160, h = 170)
        v121 = v121.convertToRGB32(interlaced=false, matrix="PC.709")
        v121 = v121.ExInpaint(mask = v121_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v121 = v121.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v121_m = v121_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v121_m = v121_m.gaussResize(v121.width/8, v121.height/8).gaussResize(v121.width, v121.height)
    v121b = v121.gaussResize(v121.width/16, v121.height/16).gaussResize(v121.width, v121.height)
    v121 = v121o.mt_merge(v121b, v121_m, luma = true)
    if (flip)
    {
        v121 = v121.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v121_m = v121_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v121_m = v121_m.gaussResize(vv121.width/8, v121.height/8).gaussResize(v121.width, v121.height)
    v121_129 = v121.trim(129, -1)
    v121 = v121.trim(0, 129) + v121.trim(130, 138).mt_merge(v121_129.loop(10), v121_m, luma = true) + v121.trim(139, 0)
*/
    #v121 = v121.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v121, audio_rate = 48000, channels = 2).killVideo
v121 = v121.audioDub(va)

last = v121#.hist_levels
prefetch

