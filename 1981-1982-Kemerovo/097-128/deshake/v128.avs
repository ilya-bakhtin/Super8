import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v128 = LSMASHVideoSource(dst_dir + "v128m.mp4")
v128 = v128.convertToRGB32(interlaced=false)
return v128

