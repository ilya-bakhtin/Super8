import("..\common.avs")
v1 = LSMASHVideoSource(dst_dir + "v1m.mp4")
v0 = LSMASHVideoSource(dst_dir + "v0m.mp4").assumeFPS(18)
v0 = v0.spline64Resize(v1.width, v1.height, -30, -4, v0.width + 62, v0.height + 14)
v1 = v0 + v1.trim(50, 0)

v1 = v1.convertToRGB32(interlaced=false)
return v1

