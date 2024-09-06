import("..\common.avs")
v7 = LSMASHVideoSource(dst_dir + "v7m.mp4")
v7_0 = LSMASHVideoSource(dst_dir + "v7_0m.mp4").assumeFPS(18)
v7_0 = v7_0.spline64Resize(v7.width, v7.height, -30, -4, v7_0.width + 62, v7_0.height + 14)
v7 = v7_0 + v7.trim(6, 0)

v7 = v7.convertToRGB32(interlaced=false)
return v7

