import("..\..\s8_functions.avs")
import("..\1989-Sevas.avs")

v85 = v85.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
v85 = v85.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)

if (varExist("v85_angle"))
{
    flip = false
    if (v85_angle < 0)
    {
        v85 = v85.flipHorizontal()
        v85_angle = -v85_angle
        flip = true
    }

    if (v85_angle != 0)
    {
        v85 = v85.rotate(-v85_angle)
        v85 = v85.fill_wedges(a = v85_angle)
    }

    v85o = v85
    if (flip)
    {
        v85_m = v85.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v85_m = v85.prepare_solid_mask(w = 160, h = 50)
        v85 = v85.convertToRGB32(interlaced=false, matrix="PC.709")
        v85 = v85.ExInpaint(mask = v85_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v85 = v85.convertToYV24(interlaced=false, matrix="PC.709")
    }
    if (v85_angle != 0)
    {
        v85_m = v85_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    }
    v85_m = v85_m.gaussResize(v85.width/8, v85.height/8).gaussResize(v85.width, v85.height)
    v85b = v85.gaussResize(v85.width/16, v85.height/16).gaussResize(v85.width, v85.height)
    v85 = v85o.mt_merge(v85b, v85_m, luma = true)
    if (flip)
    {
        v85 = v85.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v85_m = v85_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v85_m = v85_m.gaussResize(vv85.width/8, v85.height/8).gaussResize(v85.width, v85.height)
    v85_129 = v85.trim(129, -1)
    v85 = v85.trim(0, 129) + v85.trim(130, 138).mt_merge(v85_129.loop(10), v85_m, luma = true) + v85.trim(139, 0)
*/
    #v85 = v85.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v85, audio_rate = 48000, channels = 2).killVideo
v85 = v85.audioDub(va)

last = v85#.hist_levels
prefetch

