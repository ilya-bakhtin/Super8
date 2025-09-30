import("..\..\common.avs")
import("..\1977-1979.avs")
#v192 = LSMASHVideoSource(dst_dir + "v192m.mp4")
v192 = v192.convertToRGB32(interlaced=false)
return v192

