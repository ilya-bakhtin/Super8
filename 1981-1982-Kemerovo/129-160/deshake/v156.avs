import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v156 = LSMASHVideoSource(dst_dir + "v156m.mp4")
v156 = v156.convertToRGB32(interlaced=false)
return v156

