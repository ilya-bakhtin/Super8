import("..\..\common.avs")
import("..\1981-1982-Kemerovo.avs")
v139 = LSMASHVideoSource(dst_dir + "v139m.mp4")
v139 = v139.convertToRGB32(interlaced=false)
return v139

