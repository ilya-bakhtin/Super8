import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v108 = LSMASHVideoSource(dst_dir + "v108m.mp4")
v108 = v108.convertToRGB32(interlaced=false)
return v108

