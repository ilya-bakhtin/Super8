import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
$$$clip$$$ = LSMASHVideoSource(dst_dir + "$$$clip$$$m.mp4")
$$$clip$$$ = $$$clip$$$.convertToRGB32(interlaced=false)
return $$$clip$$$
