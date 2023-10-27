import("..\1983-Moskva-Tallinn.avs")
v7 = LSMASHVideoSource(dst_dir + "v7m.mp4")
v7 = v7.convertToRGB32(interlaced=false)
return v7

