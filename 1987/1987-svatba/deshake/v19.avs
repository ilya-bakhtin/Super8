import("..\common.avs")
v19 = LSMASHVideoSource(dst_dir + "v19m.mp4")
v19 = v19.convertToRGB32(interlaced=false)
return v19

