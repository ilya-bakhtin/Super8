import("..\..\common.avs")
v25 = LSMASHVideoSource(dst_dir + "v25m.mp4")
v25 = v25.convertToRGB32(interlaced=false)
return v25

