import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v130 = LSMASHVideoSource(dst_dir + "v130m.mp4")
v130 = v130.convertToRGB32(interlaced=false)
return v130

