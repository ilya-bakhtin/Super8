import("..\..\common.avs")
v67 = LSMASHVideoSource(dst_dir + "v67m.mp4")
v67 = v67.convertToRGB32(interlaced=false)
return v67

