import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v117 = v117.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v117 = v117.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v117_angle"))
{
    flip = false
    if (v117_angle < 0)
    {
        v117 = v117.flipHorizontal()
        v117_angle = -v117_angle
        flip = true
    }

    v117 = v117.rotate(-v117_angle)
    v117 = v117.fill_wedges(a = v117_angle)

    v117o = v117
    if (flip)
    {
        v117_m = v117.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v117_m = v117.prepare_solid_mask(w = 160, h = 170)
        v117 = v117.convertToRGB32(interlaced=false, matrix="PC.709")
        v117 = v117.ExInpaint(mask = v117_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v117 = v117.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v117_m = v117_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v117_m = v117_m.gaussResize(v117.width/8, v117.height/8).gaussResize(v117.width, v117.height)
    v117b = v117.gaussResize(v117.width/16, v117.height/16).gaussResize(v117.width, v117.height)
    v117 = v117o.mt_merge(v117b, v117_m, luma = true)
    if (flip)
    {
        v117 = v117.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v117_m = v117_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v117_m = v117_m.gaussResize(vv117.width/8, v117.height/8).gaussResize(v117.width, v117.height)
    v117_129 = v117.trim(129, -1)
    v117 = v117.trim(0, 129) + v117.trim(130, 138).mt_merge(v117_129.loop(10), v117_m, luma = true) + v117.trim(139, 0)
*/
    #v117 = v117.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v117, audio_rate = 48000, channels = 2).killVideo
v117 = v117.audioDub(va)

last = v117#.hist_levels
prefetch

