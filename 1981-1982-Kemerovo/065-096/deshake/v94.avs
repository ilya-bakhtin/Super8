import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v94 = LSMASHVideoSource(dst_dir + "v94m.mp4")
v94 = v94.convertToRGB32(interlaced=false)
return v94

