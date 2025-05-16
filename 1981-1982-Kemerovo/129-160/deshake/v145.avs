import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v145 = LSMASHVideoSource(dst_dir + "v145m.mp4")
v145 = v145.convertToRGB32(interlaced=false)
return v145

