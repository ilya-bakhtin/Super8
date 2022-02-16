import("8mm film 2048x1536 18Fps.mov.avs")
$$$clip$$$ = $$$clip$$$.convertToRGB24(interlaced=false, matrix="PC.709")
return $$$clip$$$.Prefetch(6)
