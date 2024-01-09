import("..\..\common.avs")
v81 = LSMASHVideoSource(dst_dir + "v81m.mp4")
v81 = v81.convertToRGB32(interlaced=false)
return v81

