import("..\..\common.avs")
v22 = LSMASHVideoSource(dst_dir + "v22m.mp4")
v22 = v22.convertToRGB32(interlaced=false)
return v22

