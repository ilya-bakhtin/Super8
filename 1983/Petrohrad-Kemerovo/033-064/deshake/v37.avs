import("..\..\common.avs")
v37 = LSMASHVideoSource(dst_dir + "v37m.mp4")
v37 = v37.convertToRGB32(interlaced=false)
return v37

