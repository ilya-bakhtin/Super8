import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v13 = v13.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
*/
v13i = v13
v13 = v13.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                    deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
l = v13i.width*5/12 - 110
w = 200 - 110
r = l + w
#v13 = v13.colorYUV(off_y = 8)
v13 = v13i.crop(0, 0, l, 0).stackHorizontal(v13.crop(l, 0, w, 0)).stackHorizontal(v13i.crop(r, 0, 0, 0))
#v13 = v13i.trim(0, 29) + v13.trim(30, 43) + v13i.trim(44, 50) + v13.trim(51, 53) + v13i.trim(54, 107) +\
#      v13.trim(108, 0)
#return v13i.interleave(v13).autolevels

if (!varExist("v13_angle"))
{
    v13o = v13

    v13_m = v13.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v13 = v13.convertToRGB32(interlaced=false, matrix="PC.709")

    v13 = v13.ExInpaint(mask = v13_m)
    v13 = v13.convertToYV24(interlaced=false, matrix="PC.709")

    v13_m = v13_m.convertToYV24(interlaced=false, matrix="PC.709")
    v13_m = v13_m.gaussResize(v13.width/8, v13.height/8).gaussResize(v13.width, v13.height)
    v13b = v13.gaussResize(v13.width/16, v13.height/16).gaussResize(v13.width, v13.height)
    v13 = v13o.mt_merge(v13b, v13_m, luma = true)
}
else
{
    flip = false
    if (v13_angle < 0)
    {
        v13 = v13.flipHorizontal()
        v13_angle = -v13_angle
        flip = true
    }

    v13 = v13.rotate(-v13_angle)
    v13 = v13.fill_wedges(a = v13_angle)

    v13o = v13
    if (flip)
    {
        v13_m = v13.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v13_m = v13.prepare_solid_mask(w = 170, h = 120)
        v13 = v13.convertToRGB32(interlaced=false, matrix="PC.709")
        v13 = v13.ExInpaint(mask = v13_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v13 = v13.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v13_m = v13_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v13_m = v13_m.gaussResize(v13.width/8, v13.height/8).gaussResize(v13.width, v13.height)
    v13b = v13.gaussResize(v13.width/16, v13.height/16).gaussResize(v13.width, v13.height)
    v13 = v13o.mt_merge(v13b, v13_m, luma = true)
    if (flip)
    {
        v13 = v13.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v13_m = v13_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v13_m = v13_m.gaussResize(vv13.width/8, v13.height/8).gaussResize(v13.width, v13.height)
    v13_129 = v13.trim(129, -1)
    v13 = v13.trim(0, 129) + v13.trim(130, 138).mt_merge(v13_129.loop(10), v13_m, luma = true) + v13.trim(139, 0)
*/
    #v13 = v13.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v13, audio_rate = 48000, channels = 2).killVideo
v13 = v13.audioDub(va)

last = v13#.hist_levels
prefetch

