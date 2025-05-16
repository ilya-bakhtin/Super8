import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")

v95o = v95
/*
v95 = v95.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
*/
v95 = v95.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45).\
          deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 200, maxlen = 4096, maxangle = 45)
#return v95o.interleave(v95)

if (!varExist("v95_angle"))
{
    v95o = v95

    v95_m = v95.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    v95 = v95.convertToRGB32(interlaced=false, matrix="PC.709")

    v95 = v95.ExInpaint(mask = v95_m)
    v95 = v95.convertToYV24(interlaced=false, matrix="PC.709")

    v95_m = v95_m.convertToYV24(interlaced=false, matrix="PC.709")
    v95_m = v95_m.gaussResize(v95.width/8, v95.height/8).gaussResize(v95.width, v95.height)
    v95b = v95.gaussResize(v95.width/16, v95.height/16).gaussResize(v95.width, v95.height)
    v95 = v95o.mt_merge(v95b, v95_m, luma = true)
}
else
{
    flip = false
    if (v95_angle < 0)
    {
        v95 = v95.flipHorizontal()
        v95_angle = -v95_angle
        flip = true
    }

    v95 = v95.rotate(-v95_angle)
    v95 = v95.fill_wedges(a = v95_angle)

    v95o = v95
    if (flip)
    {
        v95_m = v95.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        v95_m = v95.trim(0, -1).extractY.expr("0").convertToYV24
/*
        v95_m = v95.prepare_solid_mask(w = 170, h = 120)
        v95 = v95.convertToRGB32(interlaced=false, matrix="PC.709")
        v95 = v95.ExInpaint(mask = v95_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        v95 = v95.convertToYV24(interlaced=false, matrix="PC.709")
*/
    }
    v95_m = v95_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    v95_m = v95_m.gaussResize(v95.width/8, v95.height/8).gaussResize(v95.width, v95.height)
    v95b = v95.gaussResize(v95.width/16, v95.height/16).gaussResize(v95.width, v95.height)
    v95 = v95o.mt_merge(v95b, v95_m, luma = true)
    if (flip)
    {
        v95 = v95.flipHorizontal()
    }
/*
    # 129 -> 130..138
    v95_m = v95_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    v95_m = v95_m.gaussResize(vv95.width/8, v95.height/8).gaussResize(v95.width, v95.height)
    v95_129 = v95.trim(129, -1)
    v95 = v95.trim(0, 129) + v95.trim(130, 138).mt_merge(v95_129.loop(10), v95_m, luma = true) + v95.trim(139, 0)
*/
    #v95 = v95.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip(v95, audio_rate = 48000, channels = 2).killVideo
v95 = v95.audioDub(va)

last = v95#.hist_levels
prefetch

