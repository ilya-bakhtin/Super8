import("..\..\common.avs")
v106 = LSMASHVideoSource(dst_dir + "v106m.mp4")
v106 = v106.convertToRGB32(interlaced=false)
return v106

