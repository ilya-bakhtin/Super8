import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

if (!varExist("$$$clip$$$_angle"))
{
    $$$clip$$$o = $$$clip$$$

    $$$clip$$$_m = $$$clip$$$.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

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
    $$$clip$$$ = $$$clip$$$.fill_wedges(a = $$$clip$$$_angle)

    $$$clip$$$o = $$$clip$$$
    $$$clip$$$_m = $$$clip$$$.prepare_solid_mask(w = 160, h = 170)
    $$$clip$$$ = $$$clip$$$.convertToRGB32(interlaced=false, matrix="PC.709")
    $$$clip$$$ = $$$clip$$$.ExInpaint(mask = $$$clip$$$_m.convertToRGB32(interlaced=false, matrix="PC.709"))
    $$$clip$$$ = $$$clip$$$.convertToYV24(interlaced=false, matrix="PC.709")

    $$$clip$$$_m = $$$clip$$$_m.extractY.expr(g_expr_add_mask_for_blur).convertToYV24
    $$$clip$$$_m = $$$clip$$$_m.gaussResize($$$clip$$$.width/8, $$$clip$$$.height/8).gaussResize($$$clip$$$.width, $$$clip$$$.height)
    $$$clip$$$b = $$$clip$$$.gaussResize($$$clip$$$.width/16, $$$clip$$$.height/16).gaussResize($$$clip$$$.width, $$$clip$$$.height)
    $$$clip$$$ = $$$clip$$$o.mt_merge($$$clip$$$b, $$$clip$$$_m, luma = true)
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

last = $$$clip$$$
prefetch
