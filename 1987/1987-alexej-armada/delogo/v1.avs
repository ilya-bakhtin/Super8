import("..\..\s8_functions.avs")
import("..\1987-Alexej-armada.avs")
/*
v1 = v1.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
*/
v1_0 = v1
x0 = 1300
x1 = 1400
#v1 = v1.crop(0, 0, -v1.width + x0, 0).stackHorizontal(v1.crop(x0, 0, -v1.width + x1, 0).colorYUV(off_y = -40)).stackHorizontal(v1.crop(x1, 0, 0, 0))
#return v1_0.interleave(v1)
v1ds = v1.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45, modeY = 2)#.\
#          deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45, modeY = 2)
v1ds = v1.crop(0, 0, -v1.width + x0, 0).stackHorizontal(v1ds.crop(x0, 0, -v1.width + x1, 0)).stackHorizontal(v1.crop(x1, 0, 0, 0))
v1 = v1.trim(0, 54) + v1ds.trim(55, 130) + v1.trim(131, 0)
if (!varExist("v1_angle"))
{
    v1o = v1

    v1_m = v1.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)
#return v1.interleave(v1_m.convertToyv24)
    v1 = v1.convertToRGB32(interlaced=false, matrix="PC.709")

    v1 = v1.ExInpaint(mask = v1_m)
    v1 = v1.convertToYV24(interlaced=false, matrix="PC.709")

    v1_m = v1_m.convertToYV24(interlaced=false, matrix="PC.709")
    v1_m = v1_m.gaussResize(v1.width/8, v1.height/8).gaussResize(v1.width, v1.height)
    v1b = v1.gaussResize(v1.width/16, v1.height/16).gaussResize(v1.width, v1.height)
    v1 = v1o.mt_merge(v1b, v1_m, luma = true)
}
else
{
    flip = false
    if (v1_angle < 0)
    {
        v1 = v1.flipHorizontal()
        v1_angle = -v1_angle
        flip = true
    }

    v1 = v1.rotate(-v1_angle)
    v1 = v1.fill_wedges(a = v1_angle)

    v1o = v1
    if (flip)
    {
        v1_m = v1.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v1_m = v1.prepare_solid_mask(w = 170, h = 120)
        v1 = v1.convertToRGB32(interlaced=false, matrix="PC.709")
        v1 = v1.ExInpaint(mask = v1_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v1 = v1.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v1_m = v1_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v1_m = v1_m.gaussResize(v1.width/8, v1.height/8).gaussResize(v1.width, v1.height)
    v1b = v1.gaussResize(v1.width/16, v1.height/16).gaussResize(v1.width, v1.height)
    v1 = v1o.mt_merge(v1b, v1_m, luma = true)
    if (flip)
    {
        v1 = v1.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v1_m = v1_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v1_m = v1_m.gaussResize(vv1.width/8, v1.height/8).gaussResize(v1.width, v1.height)
    v1_129 = v1.trim(129, -1)
    v1 = v1.trim(0, 129) + v1.trim(130, 138).mt_merge(v1_129.loop(10), v1_m, luma = true) + v1.trim(139, 0)
*/
    #v1 = v1.crop(78, 0, 0, -56)#.adjustBorders
}
#v1 = v1_0.interleave(v1)
va = BlankClip(v1, audio_rate = 48000, channels = 2).killVideo
v1 = v1.audioDub(va)

last = v1#.hist_levels
prefetch

