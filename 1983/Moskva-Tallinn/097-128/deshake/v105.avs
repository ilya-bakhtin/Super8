import("..\..\common.avs")
v105 = LSMASHVideoSource(dst_dir + "v105m.mp4")
v105 = v105.convertToRGB32(interlaced=false)
return v105

