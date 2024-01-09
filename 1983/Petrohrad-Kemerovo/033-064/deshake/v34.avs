import("..\..\common.avs")
v34 = LSMASHVideoSource(dst_dir + "v34m.mp4")
v34 = v34.convertToRGB32(interlaced=false)
return v34

