import("..\..\common.avs")
v6 = LSMASHVideoSource(dst_dir + "v6m.mp4")
v6 = v6.convertToRGB32(interlaced=false)
return v6

