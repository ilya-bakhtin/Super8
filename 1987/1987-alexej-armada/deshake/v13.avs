import("..\..\common.avs")
import("..\1987-Alexej-armada.avs")
#v13 = LSMASHVideoSource(dst_dir + "v13m.mp4")
v13 = v13.convertToRGB32(interlaced=false)
return v13

