import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v17 = v17.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
*/
v17i = v17
v17 = v17.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                    deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
l = v17i.width*5/12 + 40
w = 200 - 80
r = l + w
v17 = v17i.crop(0, 0, l, 0).stackHorizontal(v17.crop(l, 0, w, 0)).stackHorizontal(v17i.crop(r, 0, 0, 0))
v17 = v17i.trim(0, 225) + v17.trim(226, 0)
#return v17.hist_levels#i.interleave(v17)

if (!varExist("v17_angle"))
{
    v17o = v17

    v17_m = v17.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v17 = v17.convertToRGB32(interlaced=false, matrix="PC.709")

    v17 = v17.ExInpaint(mask = v17_m)
    v17 = v17.convertToYV24(interlaced=false, matrix="PC.709")

    v17_m = v17_m.convertToYV24(interlaced=false, matrix="PC.709")
    v17_m = v17_m.gaussResize(v17.width/8, v17.height/8).gaussResize(v17.width, v17.height)
    v17b = v17.gaussResize(v17.width/16, v17.height/16).gaussResize(v17.width, v17.height)
    v17 = v17o.mt_merge(v17b, v17_m, luma = true)
}
else
{
    flip = false
    if (v17_angle < 0)
    {
        v17 = v17.flipHorizontal()
        v17_angle = -v17_angle
        flip = true
    }

    v17 = v17.rotate(-v17_angle)
    v17 = v17.fill_wedges(a = v17_angle)

    v17o = v17
    if (flip)
    {
        v17_m = v17.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v17_m = v17.prepare_solid_mask(w = 170, h = 120)
        v17 = v17.convertToRGB32(interlaced=false, matrix="PC.709")
        v17 = v17.ExInpaint(mask = v17_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v17 = v17.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v17_m = v17_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v17_m = v17_m.gaussResize(v17.width/8, v17.height/8).gaussResize(v17.width, v17.height)
    v17b = v17.gaussResize(v17.width/16, v17.height/16).gaussResize(v17.width, v17.height)
    v17 = v17o.mt_merge(v17b, v17_m, luma = true)
    if (flip)
    {
        v17 = v17.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v17_m = v17_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v17_m = v17_m.gaussResize(vv17.width/8, v17.height/8).gaussResize(v17.width, v17.height)
    v17_129 = v17.trim(129, -1)
    v17 = v17.trim(0, 129) + v17.trim(130, 138).mt_merge(v17_129.loop(10), v17_m, luma = true) + v17.trim(139, 0)
*/
    #v17 = v17.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

last = v17#.hist_levels
prefetch

