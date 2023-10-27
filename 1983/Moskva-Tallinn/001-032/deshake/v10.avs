import("..\..\common.avs")
v10 = LSMASHVideoSource(dst_dir + "v10m.mp4")
v10 = v10.convertToRGB32(interlaced=false)
return v10

