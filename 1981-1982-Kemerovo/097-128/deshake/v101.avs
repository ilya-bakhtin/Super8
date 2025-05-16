import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v101 = LSMASHVideoSource(dst_dir + "v101m.mp4")
v101 = v101.convertToRGB32(interlaced=false)
return v101

