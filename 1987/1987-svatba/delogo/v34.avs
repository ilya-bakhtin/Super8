import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
v34 = v34.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v34 = v34.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v34_angle"))
{
    v34o = v34

    v34_m = v34.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v34 = v34.convertToRGB32(interlaced=false, matrix="PC.709")

    v34 = v34.ExInpaint(mask = v34_m)
    v34 = v34.convertToYV24(interlaced=false, matrix="PC.709")

    v34_m = v34_m.convertToYV24(interlaced=false, matrix="PC.709")
    v34_m = v34_m.gaussResize(v34.width/8, v34.height/8).gaussResize(v34.width, v34.height)
    v34b = v34.gaussResize(v34.width/16, v34.height/16).gaussResize(v34.width, v34.height)
    v34 = v34o.mt_merge(v34b, v34_m, luma = true)
}
else
{
    flip = false
    if (v34_angle < 0)
    {
        v34 = v34.flipHorizontal()
        v34_angle = -v34_angle
        flip = true
    }

    v34 = v34.rotate(-v34_angle)
    v34 = v34.fill_wedges(a = v34_angle)

    v34o = v34
    if (flip)
    {
        v34_m = v34.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v34_m = v34.prepare_solid_mask(w = 170, h = 120)
        v34 = v34.convertToRGB32(interlaced=false, matrix="PC.709")
        v34 = v34.ExInpaint(mask = v34_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v34 = v34.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v34_m = v34_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v34_m = v34_m.gaussResize(v34.width/8, v34.height/8).gaussResize(v34.width, v34.height)
    v34b = v34.gaussResize(v34.width/16, v34.height/16).gaussResize(v34.width, v34.height)
    v34 = v34o.mt_merge(v34b, v34_m, luma = true)
    if (flip)
    {
        v34 = v34.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v34_m = v34_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v34_m = v34_m.gaussResize(vv34.width/8, v34.height/8).gaussResize(v34.width, v34.height)
    v34_129 = v34.trim(129, -1)
    v34 = v34.trim(0, 129) + v34.trim(130, 138).mt_merge(v34_129.loop(10), v34_m, luma = true) + v34.trim(139, 0)
*/
    #v34 = v34.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v34, audio_rate = 48000, channels = 2).killVideo
v34 = v34.audioDub(va)

last = v34#.hist_levels
prefetch

