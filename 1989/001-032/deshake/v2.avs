import("..\..\common.avs")
import("..\1989-Sevas.avs")
v2 = LSMASHVideoSource(dst_dir + "v2m.mp4")
v2 = v2.convertToRGB32(interlaced=false)
return v2

