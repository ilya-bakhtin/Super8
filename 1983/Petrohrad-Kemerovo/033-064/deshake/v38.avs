import("..\..\common.avs")
v38 = LSMASHVideoSource(dst_dir + "v38m.mp4")
v38 = v38.convertToRGB32(interlaced=false)
return v38

