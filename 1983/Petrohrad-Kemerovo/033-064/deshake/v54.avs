import("..\..\common.avs")
v54 = LSMASHVideoSource(dst_dir + "v54m.mp4")
v54 = v54.convertToRGB32(interlaced=false)
return v54

