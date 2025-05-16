import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v147 = LSMASHVideoSource(dst_dir + "v147m.mp4")
v147 = v147.convertToRGB32(interlaced=false)
return v147

