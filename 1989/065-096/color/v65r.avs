import("..\1989-Sevas.avs")
v65 = LSMASHVideoSource(dst_dir + "v65f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v65 = v65.trim(133, -1).loop(v65.frameCount).crop(0, 0, 0, add_height - v65.height).stackVertical(v65)
v65 = v65.AdjustColor(ou = +16, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v65 = v65.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v65 = v65.crop(0, add_height, 0, 0)
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
v65 = v65.add_blank_audio
return v65.prefetch
#adjustframerate
