import("..\..\common.avs")
v77 = LSMASHVideoSource(dst_dir + "v77m.mp4")
v77 = v77.convertToRGB32(interlaced=false)
return v77

