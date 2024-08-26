import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v107i = v107
#v107 = v107.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v107 = v107.deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45).\
            deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45)
v107 = v107i.interleave(v107)

if (varExist("v107_angle"))
{
    flip = false
    if (v107_angle < 0)
    {
        v107 = v107.flipHorizontal()
        v107_angle = -v107_angle
        flip = true
    }

    v107 = v107.rotate(-v107_angle)
    v107 = v107.fill_wedges(a = v107_angle)

    v107o = v107
    if (flip)
    {
        v107_m = v107.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v107_m = v107.prepare_solid_mask(w = 160, h = 170)
        v107 = v107.convertToRGB32(interlaced=false, matrix="PC.709")
        v107 = v107.ExInpaint(mask = v107_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v107 = v107.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v107_m = v107_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v107_m = v107_m.gaussResize(v107.width/8, v107.height/8).gaussResize(v107.width, v107.height)
    v107b = v107.gaussResize(v107.width/16, v107.height/16).gaussResize(v107.width, v107.height)
    v107 = v107o.mt_merge(v107b, v107_m, luma = true)
    if (flip)
    {
        v107 = v107.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v107_m = v107_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v107_m = v107_m.gaussResize(vv107.width/8, v107.height/8).gaussResize(v107.width, v107.height)
    v107_129 = v107.trim(129, -1)
    v107 = v107.trim(0, 129) + v107.trim(130, 138).mt_merge(v107_129.loop(10), v107_m, luma = true) + v107.trim(139, 0)
*/
    #v107 = v107.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v107, audio_rate = 48000, channels = 2).killVideo
v107 = v107.audioDub(va)

last = v107#.hist_levels
prefetch

