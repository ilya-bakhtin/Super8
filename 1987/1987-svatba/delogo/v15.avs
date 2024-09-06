import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v15 = v15.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)

v15i = v15
v15 = v15.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                    deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
l = v15i.width*5/12 + 100
w = 200 - 110
r = l + w
#v15 = v15.colorYUV(off_y = 8)
v15 = v15i.crop(0, 0, l, 0).stackHorizontal(v15.crop(l, 0, w, 0)).stackHorizontal(v15i.crop(r, 0, 0, 0))
v15 = v15i.trim(0, 69) + v15.trim(70, 126) + v15i.trim(127, 0)
#return v15i.interleave(v15).autolevels
*/

if (!varExist("v15_angle"))
{
    v15o = v15

    v15_m = v15.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v15 = v15.convertToRGB32(interlaced=false, matrix="PC.709")

    v15 = v15.ExInpaint(mask = v15_m)
    v15 = v15.convertToYV24(interlaced=false, matrix="PC.709")

    v15_m = v15_m.convertToYV24(interlaced=false, matrix="PC.709")
    v15_m = v15_m.gaussResize(v15.width/8, v15.height/8).gaussResize(v15.width, v15.height)
    v15b = v15.gaussResize(v15.width/16, v15.height/16).gaussResize(v15.width, v15.height)
    v15 = v15o.mt_merge(v15b, v15_m, luma = true)
}
else
{
    flip = false
    if (v15_angle < 0)
    {
        v15 = v15.flipHorizontal()
        v15_angle = -v15_angle
        flip = true
    }

    v15 = v15.rotate(-v15_angle)
    v15 = v15.fill_wedges(a = v15_angle)

    v15o = v15
    if (flip)
    {
        v15_m = v15.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v15_m = v15.prepare_solid_mask(w = 170, h = 120)
        v15 = v15.convertToRGB32(interlaced=false, matrix="PC.709")
        v15 = v15.ExInpaint(mask = v15_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v15 = v15.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v15_m = v15_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v15_m = v15_m.gaussResize(v15.width/8, v15.height/8).gaussResize(v15.width, v15.height)
    v15b = v15.gaussResize(v15.width/16, v15.height/16).gaussResize(v15.width, v15.height)
    v15 = v15o.mt_merge(v15b, v15_m, luma = true)
    if (flip)
    {
        v15 = v15.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v15_m = v15_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v15_m = v15_m.gaussResize(vv15.width/8, v15.height/8).gaussResize(v15.width, v15.height)
    v15_129 = v15.trim(129, -1)
    v15 = v15.trim(0, 129) + v15.trim(130, 138).mt_merge(v15_129.loop(10), v15_m, luma = true) + v15.trim(139, 0)
*/
    #v15 = v15.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v15, audio_rate = 48000, channels = 2).killVideo
v15 = v15.audioDub(va)

last = v15#.hist_levels
prefetch

