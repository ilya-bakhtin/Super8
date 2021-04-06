import("11449 Bakhtin 02 N8.720p_03.mov.avs")
$$$clip$$$ = $$$clip$$$.ConvertBits(16).Filter(th_SAD = $$$sad$$$, th_SADC=$$$sadc$$$).ConvertBits(8)
return $$$clip$$$.Prefetch(6)
