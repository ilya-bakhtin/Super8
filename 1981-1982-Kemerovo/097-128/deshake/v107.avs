import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v107 = LSMASHVideoSource(dst_dir + "v107m.mp4")
v107 = v107.convertToRGB32(interlaced=false)
return v107

