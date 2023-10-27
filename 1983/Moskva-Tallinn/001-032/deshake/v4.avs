import("..\1983-Moskva-Tallinn.avs")
v4 = LSMASHVideoSource(dst_dir + "v4m.mp4")
v4 = v4.convertToRGB32(interlaced=false)
return v4

