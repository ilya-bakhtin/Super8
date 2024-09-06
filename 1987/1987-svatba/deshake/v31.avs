import("..\common.avs")
v31 = LSMASHVideoSource(dst_dir + "v31m.mp4")
v31 = v31.convertToRGB32(interlaced=false)
return v31

