import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v95 = LSMASHVideoSource(dst_dir + "v95m.mp4")
v95 = v95.convertToRGB32(interlaced=false)
return v95

