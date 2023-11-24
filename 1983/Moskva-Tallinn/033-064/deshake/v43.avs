import("..\..\common.avs")
import("..\1983-Moskva-Tallinn.avs")
v43 = LSMASHVideoSource(dst_dir + "v43m.mp4")
v43 = v43.convertToRGB32(interlaced=false)
return v43

