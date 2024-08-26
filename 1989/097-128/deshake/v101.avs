import("..\..\common.avs")
import("..\1989-sevas.avs")
v101 = LSMASHVideoSource(dst_dir + "v101m.mp4")
v101 = v101.convertToRGB32(interlaced=false)
return v101

