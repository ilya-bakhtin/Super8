import("..\..\common.avs")
v126 = LSMASHVideoSource(dst_dir + "v126m.mp4")
v126 = v126.convertToRGB32(interlaced=false)
return v126

