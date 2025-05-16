import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v119 = LSMASHVideoSource(dst_dir + "v119m.mp4")
v119 = v119.convertToRGB32(interlaced=false)
return v119

