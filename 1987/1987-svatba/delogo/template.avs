import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
/*
$$$clip$$$ = $$$clip$$$.autolevels(output_low = 0, output_high = 255, input_low = 30, input_high = 230, autolevel = false)
$$$clip$$$ = $$$clip$$$.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
                        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
*/
if (!varExist("$$$clip$$$_angle"))
{
    $$$clip$$$o = $$$clip$$$

    $$$clip$$$_m = $$$clip$$$.PrepareMask(mask_w = 160, mask_h = 110)#(mask_tolerance = 200)

    $$$clip$$$ = $$$clip$$$.convertToRGB32(interlaced=false, matrix="PC.709")

    $$$clip$$$ = $$$clip$$$.ExInpaint(mask = $$$clip$$$_m)
    $$$clip$$$ = $$$clip$$$.convertToYV24(interlaced=false, matrix="PC.709")

    $$$clip$$$_m = $$$clip$$$_m.convertToYV24(interlaced=false, matrix="PC.709")
    $$$clip$$$_m = $$$clip$$$_m.gaussResize($$$clip$$$.width/8, $$$clip$$$.height/8).gaussResize($$$clip$$$.width, $$$clip$$$.height)
    $$$clip$$$b = $$$clip$$$.gaussResize($$$clip$$$.width/16, $$$clip$$$.height/16).gaussResize($$$clip$$$.width, $$$clip$$$.height)
    $$$clip$$$ = $$$clip$$$o.mt_merge($$$clip$$$b, $$$clip$$$_m, luma = true)
}
else
{
    flip = false
    if ($$$clip$$$_angle < 0)
    {
        $$$clip$$$ = $$$clip$$$.flipHorizontal()
        $$$clip$$$_angle = -$$$clip$$$_angle
        flip = true
    }

    $$$clip$$$ = $$$clip$$$.rotate(-$$$clip$$$_angle)
    $$$clip$$$ = $$$clip$$$.fill_wedges(a = $$$clip$$$_angle)

    $$$clip$$$o = $$$clip$$$
    if (flip)
    {
        $$$clip$$$_m = $$$clip$$$.trim(0, -1).extractY.expr("0").convertToYV24
    }
    else
    {
        $$$clip$$$_m = $$$clip$$$.prepare_solid_mask(w = 170, h = 120)
        $$$clip$$$ = $$$clip$$$.convertToRGB32(interlaced=false, matrix="PC.709")
        $$$clip$$$ = $$$clip$$$.ExInpaint(mask = $$$clip$$$_m.convertToRGB32(interlaced=false, matrix="PC.709"))
        $$$clip$$$ = $$$clip$$$.convertToYV24(interlaced=false, matrix="PC.709")
    }
    $$$clip$$$_m = $$$clip$$$_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    $$$clip$$$_m = $$$clip$$$_m.gaussResize($$$clip$$$.width/8, $$$clip$$$.height/8).gaussResize($$$clip$$$.width, $$$clip$$$.height)
    $$$clip$$$b = $$$clip$$$.gaussResize($$$clip$$$.width/16, $$$clip$$$.height/16).gaussResize($$$clip$$$.width, $$$clip$$$.height)
    $$$clip$$$ = $$$clip$$$o.mt_merge($$$clip$$$b, $$$clip$$$_m, luma = true)
    if (flip)
    {
        $$$clip$$$ = $$$clip$$$.flipHorizontal()
    }
/*
    # 129 -> 130..138
    $$$clip$$$_m = $$$clip$$$_m.extractY.expr(g_expr_replace_mask_for_copy).convertToYV24
    $$$clip$$$_m = $$$clip$$$_m.gaussResize(v$$$clip$$$.width/8, $$$clip$$$.height/8).gaussResize($$$clip$$$.width, $$$clip$$$.height)
    $$$clip$$$_129 = $$$clip$$$.trim(129, -1)
    $$$clip$$$ = $$$clip$$$.trim(0, 129) + $$$clip$$$.trim(130, 138).mt_merge($$$clip$$$_129.loop(10), $$$clip$$$_m, luma = true) + $$$clip$$$.trim(139, 0)
*/
    #$$$clip$$$ = $$$clip$$$.crop(78, 0, 0, -56)#.adjustBorders
}

va = BlankClip($$$clip$$$, audio_rate = 48000, channels = 2).killVideo
$$$clip$$$ = $$$clip$$$.audioDub(va)

last = $$$clip$$$#.hist_levels
prefetch
