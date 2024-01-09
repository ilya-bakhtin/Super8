import("..\..\common.avs")
v50 = LSMASHVideoSource(dst_dir + "v50m.mp4")
v50 = v50.convertToRGB32(interlaced=false)
return v50

