import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v106 = v106.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v106 = v106.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v106_angle"))
{
    flip = false
    if (v106_angle < 0)
    {
        v106 = v106.flipHorizontal()
        v106_angle = -v106_angle
        flip = true
    }

    v106 = v106.rotate(-v106_angle)
    v106 = v106.fill_wedges(a = v106_angle)

    v106o = v106
    if (flip)
    {
        v106_m = v106.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v106_m = v106.prepare_solid_mask(w = 160, h = 170)
        v106 = v106.convertToRGB32(interlaced=false, matrix="PC.709")
        v106 = v106.ExInpaint(mask = v106_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v106 = v106.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v106_m = v106_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v106_m = v106_m.gaussResize(v106.width/8, v106.height/8).gaussResize(v106.width, v106.height)
    v106b = v106.gaussResize(v106.width/16, v106.height/16).gaussResize(v106.width, v106.height)
    v106 = v106o.mt_merge(v106b, v106_m, luma = true)
    if (flip)
    {
        v106 = v106.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v106_m = v106_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v106_m = v106_m.gaussResize(vv106.width/8, v106.height/8).gaussResize(v106.width, v106.height)
    v106_129 = v106.trim(129, -1)
    v106 = v106.trim(0, 129) + v106.trim(130, 138).mt_merge(v106_129.loop(10), v106_m, luma = true) + v106.trim(139, 0)
*/
    #v106 = v106.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v106, audio_rate = 48000, channels = 2).killVideo
v106 = v106.audioDub(va)

last = v106#.hist_levels
prefetch

