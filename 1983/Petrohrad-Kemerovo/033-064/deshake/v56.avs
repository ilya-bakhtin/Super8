import("..\..\common.avs")
v56 = LSMASHVideoSource(dst_dir + "v56m.mp4")
v56 = v56.convertToRGB32(interlaced=false)
return v56

