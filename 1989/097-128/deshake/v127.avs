import("..\..\common.avs")
v127 = LSMASHVideoSource(dst_dir + "v127m.mp4")
v127 = v127.convertToRGB32(interlaced=false)
return v127

