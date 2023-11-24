import("..\..\common.avs")
import("..\1983-Moskva-Tallinn.avs")
v47 = LSMASHVideoSource(dst_dir + "v47m.mp4")
v47 = v47.convertToRGB32(interlaced=false)
return v47

