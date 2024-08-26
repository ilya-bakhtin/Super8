import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v96i = v96
#v96 = v96.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v96 = v96.deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45).\
          deScratch(mindif = 1, asym = 255, maxwidth = 5, minlen = 100, maxlen = 4096, maxangle = 45)
#v96 = v96i.interleave(v96)

if (varExist("v96_angle"))
{
    flip = false
    if (v96_angle < 0)
    {
        v96 = v96.flipHorizontal()
        v96_angle = -v96_angle
        flip = true
    }

#    v96 = v96.rotate(-v96_angle)
#    v96 = v96.fill_wedges(a = v96_angle)

    v96o = v96
    if (flip)
    {
        v96_m = v96.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v96_m = v96.prepare_solid_mask(w = 160, h = 60)
        v96 = v96.convertToRGB32(interlaced=false, matrix="PC.709")
        v96 = v96.ExInpaint(mask = v96_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v96 = v96.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v96_m = v96_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v96_m = v96_m.gaussResize(v96.width/8, v96.height/8).gaussResize(v96.width, v96.height)
    v96b = v96.gaussResize(v96.width/16, v96.height/16).gaussResize(v96.width, v96.height)
    v96 = v96o.mt_merge(v96b, v96_m, luma = true)
    if (flip)
    {
        v96 = v96.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v96_m = v96_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v96_m = v96_m.gaussResize(vv96.width/8, v96.height/8).gaussResize(v96.width, v96.height)
    v96_129 = v96.trim(129, -1)
    v96 = v96.trim(0, 129) + v96.trim(130, 138).mt_merge(v96_129.loop(10), v96_m, luma = true) + v96.trim(139, 0)
*/
    #v96 = v96.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v96, audio_rate = 48000, channels = 2).killVideo
v96 = v96.audioDub(va)

last = v96#.hist_levels
prefetch

