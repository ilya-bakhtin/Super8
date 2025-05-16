import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v111 = LSMASHVideoSource(dst_dir + "v111m.mp4")
v111 = v111.convertToRGB32(interlaced=false)
return v111

