import("..\..\common.avs")
import("..\1989-Sevas.avs")
v5 = LSMASHVideoSource(dst_dir + "v5m.mp4")
v5 = v5.convertToRGB32(interlaced=false)
return v5

