import("..\..\common.avs")
import("..\1977-1979.avs")
#$$$clip$$$ = LSMASHVideoSource(dst_dir + "$$$clip$$$m.mp4")
$$$clip$$$ = $$$clip$$$.convertToRGB32(interlaced=false)
return $$$clip$$$
