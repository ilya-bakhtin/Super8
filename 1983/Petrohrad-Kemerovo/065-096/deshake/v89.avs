import("..\..\common.avs")
v89 = LSMASHVideoSource(dst_dir + "v89m.mp4")
v89 = v89.convertToRGB32(interlaced=false)
return v89

