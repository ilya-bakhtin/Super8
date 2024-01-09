import("..\..\common.avs")
v69 = LSMASHVideoSource(dst_dir + "v69m.mp4")
v69 = v69.convertToRGB32(interlaced=false)
return v69

