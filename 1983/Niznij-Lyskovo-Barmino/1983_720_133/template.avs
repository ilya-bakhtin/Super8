import("1983_720_133.avs")
$$$clip$$$ = $$$clip$$$.Filter(th_SAD = $$$sad$$$, th_SADC=$$$sadc$$$)
$$$clip$$$_m = $$$clip$$$.PrepareMask
$$$clip$$$ = $$$clip$$$.ConvertToRGB.ExInpaint(mask = $$$clip$$$_m)
return $$$clip$$$.Prefetch(6)
