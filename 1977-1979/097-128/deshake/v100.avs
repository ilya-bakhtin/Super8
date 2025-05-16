import("..\..\common.avs")
import("..\1977-1979.avs")
#v100 = LSMASHVideoSource(dst_dir + "v100m.mp4")
v100 = v100.convertToRGB32(interlaced=false)
return v100

