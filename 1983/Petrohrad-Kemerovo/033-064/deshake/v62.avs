import("..\..\common.avs")
v62 = LSMASHVideoSource(dst_dir + "v62m.mp4")
v62 = v62.convertToRGB32(interlaced=false)
return v62

