import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v18 = v18.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
*/
v18i = v18
v18 = v18.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
l = v18i.width*5/12 + 40
w = 200 - 80
r = l + w
v18 = v18i.crop(0, 0, l, 0).stackHorizontal(v18.crop(l, 0, w, 0)).stackHorizontal(v18i.crop(r, 0, 0, 0))
v18 = v18.trim(0, 9) + v18i.trim(10, 0)
#return v18i.interleave(v18)

if (!varExist("v18_angle"))
{
    v18o = v18

    v18_m = v18.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v18 = v18.convertToRGB32(interlaced=false, matrix="PC.709")

    v18 = v18.ExInpaint(mask = v18_m)
    v18 = v18.convertToYV24(interlaced=false, matrix="PC.709")

    v18_m = v18_m.convertToYV24(interlaced=false, matrix="PC.709")
    v18_m = v18_m.gaussResize(v18.width/8, v18.height/8).gaussResize(v18.width, v18.height)
    v18b = v18.gaussResize(v18.width/16, v18.height/16).gaussResize(v18.width, v18.height)
    v18 = v18o.mt_merge(v18b, v18_m, luma = true)
}
else
{
    flip = false
    if (v18_angle < 0)
    {
        v18 = v18.flipHorizontal()
        v18_angle = -v18_angle
        flip = true
    }

    v18 = v18.rotate(-v18_angle)
    v18 = v18.fill_wedges(a = v18_angle)

    v18o = v18
    if (flip)
    {
        v18_m = v18.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v18_m = v18.prepare_solid_mask(w = 170, h = 120)
        v18 = v18.convertToRGB32(interlaced=false, matrix="PC.709")
        v18 = v18.ExInpaint(mask = v18_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v18 = v18.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v18_m = v18_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v18_m = v18_m.gaussResize(v18.width/8, v18.height/8).gaussResize(v18.width, v18.height)
    v18b = v18.gaussResize(v18.width/16, v18.height/16).gaussResize(v18.width, v18.height)
    v18 = v18o.mt_merge(v18b, v18_m, luma = true)
    if (flip)
    {
        v18 = v18.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v18_m = v18_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v18_m = v18_m.gaussResize(vv18.width/8, v18.height/8).gaussResize(v18.width, v18.height)
    v18_129 = v18.trim(129, -1)
    v18 = v18.trim(0, 129) + v18.trim(130, 138).mt_merge(v18_129.loop(10), v18_m, luma = true) + v18.trim(139, 0)
*/
    #v18 = v18.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v18, audio_rate = 48000, channels = 2).killVideo
v18 = v18.audioDub(va)

last = v18#.hist_levels
prefetch

