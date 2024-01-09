import("..\..\common.avs")
v80 = LSMASHVideoSource(dst_dir + "v80m.mp4")
v80 = v80.convertToRGB32(interlaced=false)
return v80

