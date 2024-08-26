import("..\..\common.avs")
import("..\1987-Alexej-armada.avs")
#v12 = LSMASHVideoSource(dst_dir + "v12m.mp4")
v12 = v12.convertToRGB32(interlaced=false)
return v12

