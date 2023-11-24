import("..\..\common.avs")
import("..\1983-Moskva-Tallinn.avs")
v52 = LSMASHVideoSource(dst_dir + "v52m.mp4")
v52 = v52.convertToRGB32(interlaced=false)
return v52

