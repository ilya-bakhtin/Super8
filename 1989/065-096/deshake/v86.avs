import("..\..\common.avs")
v86 = LSMASHVideoSource(dst_dir + "v86m.mp4")
v86 = v86.convertToRGB32(interlaced=false)
return v86

