import("..\..\common.avs")
import("..\1977-1979.avs")
#v32 = LSMASHVideoSource(dst_dir + "v32m.mp4")
v32 = v32.convertToRGB32(interlaced=false)
return v32

