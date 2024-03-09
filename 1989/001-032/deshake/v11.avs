import("..\..\common.avs")
import("..\1989-Sevas.avs")
v11 = LSMASHVideoSource(dst_dir + "v11m.mp4")
v11 = v11.convertToRGB32(interlaced=false)
return v11

