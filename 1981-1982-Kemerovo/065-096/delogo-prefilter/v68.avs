import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v68 = v68.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v68 = v68.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v68_angle"))
{
    v68o = v68

    v68_m = v68.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v68 = v68.convertToRGB32(interlaced=false, matrix="PC.709")

    v68 = v68.ExInpaint(mask = v68_m)
    v68 = v68.convertToYV24(interlaced=false, matrix="PC.709")

    v68_m = v68_m.convertToYV24(interlaced=false, matrix="PC.709")
    v68_m = v68_m.gaussResize(v68.width/8, v68.height/8).gaussResize(v68.width, v68.height)
    v68b = v68.gaussResize(v68.width/16, v68.height/16).gaussResize(v68.width, v68.height)
    v68 = v68o.mt_merge(v68b, v68_m, luma = true)
}
else
{
    flip = false
    if (v68_angle < 0)
    {
        v68 = v68.flipHorizontal()
        v68_angle = -v68_angle
        flip = true
    }

    v68 = v68.rotate(-v68_angle)
    v68 = v68.fill_wedges(a = v68_angle)

    v68o = v68
    if (flip)
    {
        v68_m = v68.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v68_m = v68.prepare_solid_mask(w = 170, h = 120)
        v68 = v68.convertToRGB32(interlaced=false, matrix="PC.709")
        v68 = v68.ExInpaint(mask = v68_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v68 = v68.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v68_m = v68_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v68_m = v68_m.gaussResize(v68.width/8, v68.height/8).gaussResize(v68.width, v68.height)
    v68b = v68.gaussResize(v68.width/16, v68.height/16).gaussResize(v68.width, v68.height)
    v68 = v68o.mt_merge(v68b, v68_m, luma = true)
    if (flip)
    {
        v68 = v68.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v68_m = v68_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v68_m = v68_m.gaussResize(vv68.width/8, v68.height/8).gaussResize(v68.width, v68.height)
    v68_129 = v68.trim(129, -1)
    v68 = v68.trim(0, 129) + v68.trim(130, 138).mt_merge(v68_129.loop(10), v68_m, luma = true) + v68.trim(139, 0)
*/
    #v68 = v68.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v68, audio_rate = 48000, channels = 2).killVideo
v68 = v68.audioDub(va)

last = v68#.hist_levels
prefetch

