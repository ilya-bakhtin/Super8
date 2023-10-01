import("..\..\common.avs")
v141 = LSMASHVideoSource(dst_dir + "v141m.mp4")
v141 = v141.convertToRGB32(interlaced=false)
return v141

