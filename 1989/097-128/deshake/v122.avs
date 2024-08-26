import("..\..\common.avs")
v122 = LSMASHVideoSource(dst_dir + "v122m.mp4")
v122 = v122.convertToRGB32(interlaced=false)
return v122

