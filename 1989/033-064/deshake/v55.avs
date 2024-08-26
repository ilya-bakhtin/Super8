import("..\..\common.avs")
import("..\1989-Sevas.avs")
v55 = LSMASHVideoSource(dst_dir + "v55m.mp4")
v55 = v55.convertToRGB32(interlaced=false)
return v55

