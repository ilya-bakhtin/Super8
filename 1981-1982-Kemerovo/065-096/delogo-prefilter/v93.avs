import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v93 = v93.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v93 = v93.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v93_angle"))
{
    v93o = v93

    v93_m = v93.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v93 = v93.convertToRGB32(interlaced=false, matrix="PC.709")

    v93 = v93.ExInpaint(mask = v93_m)
    v93 = v93.convertToYV24(interlaced=false, matrix="PC.709")

    v93_m = v93_m.convertToYV24(interlaced=false, matrix="PC.709")
    v93_m = v93_m.gaussResize(v93.width/8, v93.height/8).gaussResize(v93.width, v93.height)
    v93b = v93.gaussResize(v93.width/16, v93.height/16).gaussResize(v93.width, v93.height)
    v93 = v93o.mt_merge(v93b, v93_m, luma = true)
}
else
{
    flip = false
    if (v93_angle < 0)
    {
        v93 = v93.flipHorizontal()
        v93_angle = -v93_angle
        flip = true
    }

    v93 = v93.rotate(-v93_angle)
    v93 = v93.fill_wedges(a = v93_angle)

    v93o = v93
    if (flip)
    {
        v93_m = v93.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v93_m = v93.prepare_solid_mask(w = 170, h = 120)
        v93 = v93.convertToRGB32(interlaced=false, matrix="PC.709")
        v93 = v93.ExInpaint(mask = v93_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v93 = v93.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v93_m = v93_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v93_m = v93_m.gaussResize(v93.width/8, v93.height/8).gaussResize(v93.width, v93.height)
    v93b = v93.gaussResize(v93.width/16, v93.height/16).gaussResize(v93.width, v93.height)
    v93 = v93o.mt_merge(v93b, v93_m, luma = true)
    if (flip)
    {
        v93 = v93.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v93_m = v93_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v93_m = v93_m.gaussResize(vv93.width/8, v93.height/8).gaussResize(v93.width, v93.height)
    v93_129 = v93.trim(129, -1)
    v93 = v93.trim(0, 129) + v93.trim(130, 138).mt_merge(v93_129.loop(10), v93_m, luma = true) + v93.trim(139, 0)
*/
    #v93 = v93.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v93, audio_rate = 48000, channels = 2).killVideo
v93 = v93.audioDub(va)

last = v93#.hist_levels
prefetch

