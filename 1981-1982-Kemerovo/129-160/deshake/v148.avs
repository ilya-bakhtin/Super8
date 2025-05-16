import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v148 = LSMASHVideoSource(dst_dir + "v148m.mp4")
v148 = v148.convertToRGB32(interlaced=false)
return v148

