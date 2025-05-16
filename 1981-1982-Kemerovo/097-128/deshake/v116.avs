import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v116 = LSMASHVideoSource(dst_dir + "v116m.mp4")
v116 = v116.convertToRGB32(interlaced=false)
return v116

