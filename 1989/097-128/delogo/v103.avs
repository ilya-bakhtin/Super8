import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v103 = v103.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v103 = v103.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v103_angle"))
{
    flip = false
    if (v103_angle < 0)
    {
        v103 = v103.flipHorizontal()
        v103_angle = -v103_angle
        flip = true
    }

    v103 = v103.rotate(-v103_angle)
    v103 = v103.fill_wedges(a = v103_angle)

    v103o = v103
    if (flip)
    {
        v103_m = v103.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v103_m = v103.prepare_solid_mask(w = 160, h = 170)
        v103 = v103.convertToRGB32(interlaced=false, matrix="PC.709")
        v103 = v103.ExInpaint(mask = v103_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v103 = v103.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v103_m = v103_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v103_m = v103_m.gaussResize(v103.width/8, v103.height/8).gaussResize(v103.width, v103.height)
    v103b = v103.gaussResize(v103.width/16, v103.height/16).gaussResize(v103.width, v103.height)
    v103 = v103o.mt_merge(v103b, v103_m, luma = true)
    if (flip)
    {
        v103 = v103.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v103_m = v103_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v103_m = v103_m.gaussResize(vv103.width/8, v103.height/8).gaussResize(v103.width, v103.height)
    v103_129 = v103.trim(129, -1)
    v103 = v103.trim(0, 129) + v103.trim(130, 138).mt_merge(v103_129.loop(10), v103_m, luma = true) + v103.trim(139, 0)
*/
    #v103 = v103.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v103, audio_rate = 48000, channels = 2).killVideo
v103 = v103.audioDub(va)

last = v103#.hist_levels
prefetch

