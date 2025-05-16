import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v104 = LSMASHVideoSource(dst_dir + "v104m.mp4")
v104 = v104.convertToRGB32(interlaced=false)
return v104

