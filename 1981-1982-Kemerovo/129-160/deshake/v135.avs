import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v135 = LSMASHVideoSource(dst_dir + "v135m.mp4")
v135 = v135.convertToRGB32(interlaced=false)
return v135

