import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v71 = v71.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v71 = v71.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v71_angle"))
{
    flip = false
    if (v71_angle < 0)
    {
        v71 = v71.flipHorizontal()
        v71_angle = -v71_angle
        flip = true
    }

    v71 = v71.rotate(-v71_angle)
    v71 = v71.fill_wedges(a = v71_angle)

    v71o = v71
    if (flip)
    {
        v71_m = v71.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v71_m = v71.prepare_solid_mask(w = 160, h = 170)
        v71 = v71.convertToRGB32(interlaced=false, matrix="PC.709")
        v71 = v71.ExInpaint(mask = v71_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v71 = v71.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v71_m = v71_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v71_m = v71_m.gaussResize(v71.width/8, v71.height/8).gaussResize(v71.width, v71.height)
    v71b = v71.gaussResize(v71.width/16, v71.height/16).gaussResize(v71.width, v71.height)
    v71 = v71o.mt_merge(v71b, v71_m, luma = true)
    if (flip)
    {
        v71 = v71.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v71_m = v71_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v71_m = v71_m.gaussResize(vv71.width/8, v71.height/8).gaussResize(v71.width, v71.height)
    v71_129 = v71.trim(129, -1)
    v71 = v71.trim(0, 129) + v71.trim(130, 138).mt_merge(v71_129.loop(10), v71_m, luma = true) + v71.trim(139, 0)
*/
    #v71 = v71.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v71, audio_rate = 48000, channels = 2).killVideo
v71 = v71.audioDub(va)

last = v71#.hist_levels
prefetch

