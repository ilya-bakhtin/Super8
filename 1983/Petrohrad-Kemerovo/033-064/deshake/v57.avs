import("..\..\common.avs")
v57 = LSMASHVideoSource(dst_dir + "v57m.mp4")
v57 = v57.convertToRGB32(interlaced=false)
return v57

