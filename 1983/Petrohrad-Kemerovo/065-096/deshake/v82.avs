import("..\..\common.avs")
v82 = LSMASHVideoSource(dst_dir + "v82m.mp4")
v82 = v82.convertToRGB32(interlaced=false)
return v82

