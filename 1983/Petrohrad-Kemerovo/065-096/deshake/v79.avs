import("..\..\common.avs")
v79 = LSMASHVideoSource(dst_dir + "v79m.mp4")
v79 = v79.convertToRGB32(interlaced=false)
return v79

