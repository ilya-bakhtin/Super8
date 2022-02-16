import("8mm film 2048x1536 18Fps.mov.avs")
$$$clip$$$ = $$$clip$$$.convertToRGB24(interlaced=false)
return $$$clip$$$.Prefetch(6)
