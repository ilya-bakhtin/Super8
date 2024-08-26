import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v65 = v65.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v65 = v65.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v65_angle"))
{
    flip = false
    if (v65_angle < 0)
    {
        v65 = v65.flipHorizontal()
        v65_angle = -v65_angle
        flip = true
    }

    v65 = v65.rotate(-v65_angle)
    v65 = v65.fill_wedges(a = v65_angle)

    v65o = v65
    if (flip)
    {
        v65_m = v65.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v65_m = v65.prepare_solid_mask(w = 160, h = 170)
        v65 = v65.convertToRGB32(interlaced=false, matrix="PC.709")
        v65 = v65.ExInpaint(mask = v65_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v65 = v65.convertToYV24(interlaced=false, matrix="PC.709")
    }
    v65_m = v65_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v65_m = v65_m.gaussResize(v65.width/8, v65.height/8).gaussResize(v65.width, v65.height)
    v65b = v65.gaussResize(v65.width/16, v65.height/16).gaussResize(v65.width, v65.height)
    v65 = v65o.mt_merge(v65b, v65_m, luma = true)
    if (flip)
    {
        v65 = v65.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v65_m = v65_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v65_m = v65_m.gaussResize(vv65.width/8, v65.height/8).gaussResize(v65.width, v65.height)
    v65_129 = v65.trim(129, -1)
    v65 = v65.trim(0, 129) + v65.trim(130, 138).mt_merge(v65_129.loop(10), v65_m, luma = true) + v65.trim(139, 0)
*/
    #v65 = v65.crop(78, 0, 0, -56)#.adjustBorders
    #v65 = v65.crop(6, 20, -46, -18)#.adjustBorders
}

va = BlankClip(v65, audio_rate = 48000, channels = 2).killVideo
v65 = v65.audioDub(va)

last = v65#.histogram#.hist_levels
prefetch

