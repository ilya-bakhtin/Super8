import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v142 = LSMASHVideoSource(dst_dir + "v142m.mp4")
v142 = v142.convertToRGB32(interlaced=false)
return v142

