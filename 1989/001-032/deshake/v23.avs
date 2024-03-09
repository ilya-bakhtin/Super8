import("..\..\common.avs")
import("..\1989-Sevas.avs")
v23 = LSMASHVideoSource(dst_dir + "v23m.mp4")
v23 = v23.convertToRGB32(interlaced=false)
return v23

