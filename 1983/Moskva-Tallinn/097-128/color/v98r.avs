import("..\1983-Moskva-Tallinn.avs")
v98 = LSMASHVideoSource(dst_dir + "v98f.mp4").ConvertToYV24()
v98 = v98.colorYUV(off_y = -16)
b_ex = undefined
v98 = v98.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v98 = v98.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
v98 = v98.add_blank_audio
return v98.prefetch
#adjustframerate
