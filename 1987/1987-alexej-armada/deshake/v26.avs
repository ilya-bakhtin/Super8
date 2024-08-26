import("..\..\common.avs")
v26 = LSMASHVideoSource(dst_dir + "v26m.mp4")
v26 = v26.convertToRGB32(interlaced=false)
return v26

