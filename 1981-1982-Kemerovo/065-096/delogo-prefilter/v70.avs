import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v70 = v70.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v70 = v70.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v70_angle"))
{
    v70o = v70

    v70_m = v70.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v70 = v70.convertToRGB32(interlaced=false, matrix="PC.709")

    v70 = v70.ExInpaint(mask = v70_m)
    v70 = v70.convertToYV24(interlaced=false, matrix="PC.709")

    v70_m = v70_m.convertToYV24(interlaced=false, matrix="PC.709")
    v70_m = v70_m.gaussResize(v70.width/8, v70.height/8).gaussResize(v70.width, v70.height)
    v70b = v70.gaussResize(v70.width/16, v70.height/16).gaussResize(v70.width, v70.height)
    v70 = v70o.mt_merge(v70b, v70_m, luma = true)
}
else
{
    flip = false
    if (v70_angle < 0)
    {
        v70 = v70.flipHorizontal()
        v70_angle = -v70_angle
        flip = true
    }

    v70 = v70.rotate(-v70_angle)
    v70 = v70.fill_wedges(a = v70_angle)

    v70o = v70
    if (flip)
    {
        v70_m = v70.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v70_m = v70.prepare_solid_mask(w = 170, h = 120)
        v70 = v70.convertToRGB32(interlaced=false, matrix="PC.709")
        v70 = v70.ExInpaint(mask = v70_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v70 = v70.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v70_m = v70_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v70_m = v70_m.gaussResize(v70.width/8, v70.height/8).gaussResize(v70.width, v70.height)
    v70b = v70.gaussResize(v70.width/16, v70.height/16).gaussResize(v70.width, v70.height)
    v70 = v70o.mt_merge(v70b, v70_m, luma = true)
    if (flip)
    {
        v70 = v70.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v70_m = v70_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v70_m = v70_m.gaussResize(vv70.width/8, v70.height/8).gaussResize(v70.width, v70.height)
    v70_129 = v70.trim(129, -1)
    v70 = v70.trim(0, 129) + v70.trim(130, 138).mt_merge(v70_129.loop(10), v70_m, luma = true) + v70.trim(139, 0)
*/
    #v70 = v70.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v70, audio_rate = 48000, channels = 2).killVideo
v70 = v70.audioDub(va)

last = v70#.hist_levels
prefetch

