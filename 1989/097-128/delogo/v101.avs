import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

#v101 = v101.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
#v101 = v101.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
#            deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v101_angle"))
{
    flip = false
    if (v101_angle < 0)
    {
        v101 = v101.flipHorizontal()
        v101_angle = -v101_angle
        flip = true
    }

#    v101 = v101.rotate(-v101_angle)
#    v101 = v101.fill_wedges(a = v101_angle)

    v101o = v101
    if (flip)
    {
        v101_m = v101.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v101_m = v101.prepare_solid_mask(w = 160, h = 40)
        v101 = v101.convertToRGB32(interlaced=false, matrix="PC.709")
        v101 = v101.ExInpaint(mask = v101_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v101 = v101.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v101_m = v101_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v101_m = v101_m.gaussResize(v101.width/8, v101.height/8).gaussResize(v101.width, v101.height)
    v101b = v101.gaussResize(v101.width/16, v101.height/16).gaussResize(v101.width, v101.height)
    v101 = v101o.mt_merge(v101b, v101_m, luma = true)
    if (flip)
    {
        v101 = v101.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v101_m = v101_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v101_m = v101_m.gaussResize(vv101.width/8, v101.height/8).gaussResize(v101.width, v101.height)
    v101_129 = v101.trim(129, -1)
    v101 = v101.trim(0, 129) + v101.trim(130, 138).mt_merge(v101_129.loop(10), v101_m, luma = true) + v101.trim(139, 0)
*/
    #v101 = v101.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v101, audio_rate = 48000, channels = 2).killVideo
v101 = v101.audioDub(va)

last = v101#.hist_levels
prefetch

