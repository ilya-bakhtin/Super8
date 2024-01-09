import("..\..\common.avs")
v66 = LSMASHVideoSource(dst_dir + "v66m.mp4")
v66 = v66.convertToRGB32(interlaced=false)
return v66

