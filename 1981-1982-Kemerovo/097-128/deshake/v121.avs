import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v121 = LSMASHVideoSource(dst_dir + "v121m.mp4")
v121 = v121.convertToRGB32(interlaced=false)
return v121

