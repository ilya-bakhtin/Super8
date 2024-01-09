import("..\..\common.avs")
v76 = LSMASHVideoSource(dst_dir + "v76m.mp4")
v76 = v76.convertToRGB32(interlaced=false)
return v76

