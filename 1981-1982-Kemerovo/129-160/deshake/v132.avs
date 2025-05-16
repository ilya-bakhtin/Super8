import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v132 = LSMASHVideoSource(dst_dir + "v132m.mp4")
v132 = v132.convertToRGB32(interlaced=false)
return v132

