import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v13 = LSMASHVideoSource(dst_dir + "v13m.mp4")
v13 = v13.convertToRGB32(interlaced=false)
return v13

