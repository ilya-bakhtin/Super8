import("..\..\common.avs")
import("..\1989-Sevas.avs")
v9 = LSMASHVideoSource(dst_dir + "v9m.mp4")
v9 = v9.convertToRGB32(interlaced=false)
return v9

