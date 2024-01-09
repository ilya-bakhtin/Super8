import("..\..\common.avs")
v42 = LSMASHVideoSource(dst_dir + "v42m.mp4")
v42 = v42.convertToRGB32(interlaced=false)
return v42

