import("..\..\common.avs")
v70 = LSMASHVideoSource(dst_dir + "v70m.mp4")
v70 = v70.convertToRGB32(interlaced=false)
return v70

