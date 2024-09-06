import("..\common.avs")
v17 = LSMASHVideoSource(dst_dir + "v17m.mp4")
v17 = v17.convertToRGB32(interlaced=false)
return v17

