import("..\..\common.avs")
v36 = LSMASHVideoSource(dst_dir + "v36m.mp4")
v36 = v36.convertToRGB32(interlaced=false)
return v36

