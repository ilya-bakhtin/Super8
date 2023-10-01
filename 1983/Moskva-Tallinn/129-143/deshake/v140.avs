import("..\..\common.avs")
v140 = LSMASHVideoSource(dst_dir + "v140m.mp4")
v140 = v140.convertToRGB32(interlaced=false)
return v140

