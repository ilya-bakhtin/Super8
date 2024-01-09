import("..\..\common.avs")
v43 = LSMASHVideoSource(dst_dir + "v43m.mp4")
v43 = v43.convertToRGB32(interlaced=false)
return v43

