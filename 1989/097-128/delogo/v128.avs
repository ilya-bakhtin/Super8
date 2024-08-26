import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v128 = v128.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v128 = v128.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v128_angle"))
{
    flip = false
    if (v128_angle < 0)
    {
        v128 = v128.flipHorizontal()
        v128_angle = -v128_angle
        flip = true
    }

    v128 = v128.rotate(-v128_angle)
    v128 = v128.fill_wedges(a = v128_angle)

    v128o = v128
    if (flip)
    {
        v128_m = v128.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v128_m = v128.prepare_solid_mask(w = 160, h = 170)
        v128 = v128.convertToRGB32(interlaced=false, matrix="PC.709")
        v128 = v128.ExInpaint(mask = v128_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v128 = v128.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v128_m = v128_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v128_m = v128_m.gaussResize(v128.width/8, v128.height/8).gaussResize(v128.width, v128.height)
    v128b = v128.gaussResize(v128.width/16, v128.height/16).gaussResize(v128.width, v128.height)
    v128 = v128o.mt_merge(v128b, v128_m, luma = true)
    if (flip)
    {
        v128 = v128.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v128_m = v128_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v128_m = v128_m.gaussResize(vv128.width/8, v128.height/8).gaussResize(v128.width, v128.height)
    v128_129 = v128.trim(129, -1)
    v128 = v128.trim(0, 129) + v128.trim(130, 138).mt_merge(v128_129.loop(10), v128_m, luma = true) + v128.trim(139, 0)
*/
    #v128 = v128.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v128, audio_rate = 48000, channels = 2).killVideo
v128 = v128.audioDub(va)

last = v128#.hist_levels
prefetch

