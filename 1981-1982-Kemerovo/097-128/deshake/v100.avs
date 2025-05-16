import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v100 = LSMASHVideoSource(dst_dir + "v100m.mp4")
v100 = v100.convertToRGB32(interlaced=false)
return v100

