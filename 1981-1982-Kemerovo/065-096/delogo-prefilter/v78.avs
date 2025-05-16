import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
/*
v78 = v78.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v78 = v78.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("v78_angle"))
{
    v78o = v78

    v78_m = v78.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v78 = v78.convertToRGB32(interlaced=false, matrix="PC.709")

    v78 = v78.ExInpaint(mask = v78_m)
    v78 = v78.convertToYV24(interlaced=false, matrix="PC.709")

    v78_m = v78_m.convertToYV24(interlaced=false, matrix="PC.709")
    v78_m = v78_m.gaussResize(v78.width/8, v78.height/8).gaussResize(v78.width, v78.height)
    v78b = v78.gaussResize(v78.width/16, v78.height/16).gaussResize(v78.width, v78.height)
    v78 = v78o.mt_merge(v78b, v78_m, luma = true)
}
else
{
    flip = false
    if (v78_angle < 0)
    {
        v78 = v78.flipHorizontal()
        v78_angle = -v78_angle
        flip = true
    }

    v78 = v78.rotate(-v78_angle)
    v78 = v78.fill_wedges(a = v78_angle)

    v78o = v78
    if (flip)
    {
        v78_m = v78.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v78_m = v78.prepare_solid_mask(w = 170, h = 120)
        v78 = v78.convertToRGB32(interlaced=false, matrix="PC.709")
        v78 = v78.ExInpaint(mask = v78_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v78 = v78.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v78_m = v78_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v78_m = v78_m.gaussResize(v78.width/8, v78.height/8).gaussResize(v78.width, v78.height)
    v78b = v78.gaussResize(v78.width/16, v78.height/16).gaussResize(v78.width, v78.height)
    v78 = v78o.mt_merge(v78b, v78_m, luma = true)
    if (flip)
    {
        v78 = v78.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v78_m = v78_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v78_m = v78_m.gaussResize(vv78.width/8, v78.height/8).gaussResize(v78.width, v78.height)
    v78_129 = v78.trim(129, -1)
    v78 = v78.trim(0, 129) + v78.trim(130, 138).mt_merge(v78_129.loop(10), v78_m, luma = true) + v78.trim(139, 0)
*/
    #v78 = v78.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v78, audio_rate = 48000, channels = 2).killVideo
v78 = v78.audioDub(va)

last = v78#.hist_levels
prefetch

