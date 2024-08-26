import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v86 = v86.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v86 = v86.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v86_angle"))
{
    flip = false
    if (v86_angle < 0)
    {
        v86 = v86.flipHorizontal()
        v86_angle = -v86_angle
        flip = true
    }

#    v86 = v86.rotate(-v86_angle)
#    v86 = v86.fill_wedges(a = v86_angle)

    v86o = v86
    if (flip)
    {
        v86_m = v86.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v86_m = v86.prepare_solid_mask(w = 150, h = 50)
        v86 = v86.convertToRGB32(interlaced=false, matrix="PC.709")
        v86 = v86.ExInpaint(mask = v86_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v86 = v86.convertToYV24(interlaced=false, matrix="PC.709")
    }
#    v86_m = v86_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v86_m = v86_m.gaussResize(v86.width/8, v86.height/8).gaussResize(v86.width, v86.height)
    v86b = v86.gaussResize(v86.width/16, v86.height/16).gaussResize(v86.width, v86.height)
    v86 = v86o.mt_merge(v86b, v86_m, luma = true)
    if (flip)
    {
        v86 = v86.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v86_m = v86_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v86_m = v86_m.gaussResize(vv86.width/8, v86.height/8).gaussResize(v86.width, v86.height)
    v86_129 = v86.trim(129, -1)
    v86 = v86.trim(0, 129) + v86.trim(130, 138).mt_merge(v86_129.loop(10), v86_m, luma = true) + v86.trim(139, 0)
*/
    #v86 = v86.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v86, audio_rate = 48000, channels = 2).killVideo
v86 = v86.audioDub(va)

last = v86#.hist_levels
prefetch

