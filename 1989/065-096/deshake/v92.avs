import("..\..\common.avs")
v92 = LSMASHVideoSource(dst_dir + "v92m.mp4")
v92 = v92.convertToRGB32(interlaced=false)
return v92

