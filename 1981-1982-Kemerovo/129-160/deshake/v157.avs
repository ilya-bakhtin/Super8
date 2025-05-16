import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v157 = LSMASHVideoSource(dst_dir + "v157m.mp4")
v157 = v157.convertToRGB32(interlaced=false)
return v157

