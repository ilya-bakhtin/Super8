import("..\..\common.avs")
v95 = LSMASHVideoSource(dst_dir + "v95m.mp4")
v95 = v95.convertToRGB32(interlaced=false)
return v95

