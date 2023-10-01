import("..\..\common.avs")
v112 = LSMASHVideoSource(dst_dir + "v112m.mp4")
v112 = v112.convertToRGB32(interlaced=false)
return v112

