import("..\..\common.avs")
v58 = LSMASHVideoSource(dst_dir + "v58m.mp4")
v58 = v58.convertToRGB32(interlaced=false)
return v58

