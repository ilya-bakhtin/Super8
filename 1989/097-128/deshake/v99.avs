import("..\..\common.avs")
v99 = LSMASHVideoSource(dst_dir + "v99m.mp4")
v99 = v99.convertToRGB32(interlaced=false)
return v99

