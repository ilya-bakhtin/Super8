import("..\..\common.avs")
v71 = LSMASHVideoSource(dst_dir + "v71m.mp4")
v71 = v71.convertToRGB32(interlaced=false)
return v71

