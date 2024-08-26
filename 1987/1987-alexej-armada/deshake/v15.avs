import("..\..\common.avs")
import("..\1987-Alexej-armada.avs")
#v15 = LSMASHVideoSource(dst_dir + "v15m.mp4")
v15 = v15.convertToRGB32(interlaced=false)
return v15

