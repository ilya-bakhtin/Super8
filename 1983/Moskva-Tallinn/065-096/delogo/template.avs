SetFilterMTMode("Deshaker", MT_SERIALIZED)

import("..\1983-Moskva-Tallinn.avs")

#$$$clip$$$ = $$$clip$$$.deScratch(maxwidth=5, mindif=1)

$$$clip$$$_m = $$$clip$$$.PrepareMask(mask_w = 140, mask_h = 100)#(mask_tolerance = 200)

$$$clip$$$ = $$$clip$$$.convertToRGB32(interlaced=false, matrix="PC.709")

$$$clip$$$ = $$$clip$$$.ExInpaint(mask = $$$clip$$$_m)
$$$clip$$$ = $$$clip$$$.convertToYV24(interlaced=false, matrix="PC.709")

va = BlankClip($$$clip$$$, audio_rate = 48000, channels = 2).killVideo
$$$clip$$$ = $$$clip$$$.audioDub(va)

last = $$$clip$$$
prefetch
