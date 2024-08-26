import("..\..\common.avs")
v87 = LSMASHVideoSource(dst_dir + "v87m.mp4")
v87 = v87.convertToRGB32(interlaced=false)
return v87

