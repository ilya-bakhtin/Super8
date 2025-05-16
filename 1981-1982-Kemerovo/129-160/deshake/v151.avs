import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v151 = LSMASHVideoSource(dst_dir + "v151m.mp4")
v151 = v151.convertToRGB32(interlaced=false)
return v151

