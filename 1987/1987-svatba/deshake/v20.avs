import("..\common.avs")
v20 = LSMASHVideoSource(dst_dir + "v20m.mp4")
v20 = v20.convertToRGB32(interlaced=false)
return v20

