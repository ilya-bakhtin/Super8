import("..\..\common.avs")
import("..\1989-Sevas.avs")
v21 = LSMASHVideoSource(dst_dir + "v21m.mp4")
v21 = v21.convertToRGB32(interlaced=false)
return v21

