import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
#v90 = LSMASHVideoSource(dst_dir + "v90m.mp4")
v90 = v90.convertToRGB32(interlaced=false)
return v90

