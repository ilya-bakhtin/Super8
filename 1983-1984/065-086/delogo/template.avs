SetFilterMTMode("Deshaker", MT_SERIALIZED)

source_dir = "$$$dir_ds$$$"

LoadVirtualdubPlugin("D:\Program Files\VirtualDub\plugins64\Deshaker_64.vdf", "Deshaker", preroll=30)

import("..\1983-1984.avs")

#$$$clip$$$ = $$$clip$$$.deScratch(maxwidth=5, mindif=1)

$$$clip$$$_m = $$$clip$$$.PrepareMask

$$$clip$$$ = $$$clip$$$.convertToRGB32(interlaced=false, matrix="PC.709")

$$$clip$$$ = $$$clip$$$.ExInpaint(mask = $$$clip$$$_m)
$$$clip$$$ = $$$clip$$$.convertToYV24(interlaced=false)

va = BlankClip($$$clip$$$, audio_rate = 48000, channels = 2).killVideo
$$$clip$$$ = $$$clip$$$.audioDub(va)

last = $$$clip$$$
prefetch
