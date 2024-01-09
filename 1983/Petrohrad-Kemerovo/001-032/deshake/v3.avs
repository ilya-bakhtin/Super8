import("..\..\common.avs")
v3 = LSMASHVideoSource(dst_dir + "v3m.mp4")
v3 = v3.convertToRGB32(interlaced=false)
return v3

