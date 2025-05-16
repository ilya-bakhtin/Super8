import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v150 = LSMASHVideoSource(dst_dir + "v150m.mp4")
v150 = v150.convertToRGB32(interlaced=false)
return v150

