import("..\..\common.avs")
v136 = LSMASHVideoSource(dst_dir + "v136m.mp4")
v136 = v136.convertToRGB32(interlaced=false)
return v136

