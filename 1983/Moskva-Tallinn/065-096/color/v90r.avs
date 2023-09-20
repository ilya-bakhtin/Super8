import("..\1983-Moskva-Tallinn.avs")
v90 = LSMASHVideoSource(dst_dir + "v90f.mp4").ConvertToYV24()
v90 = v90.colorYUV(off_y = -8)
b_ex = undefined
v90 = v90.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)#, b_expr=b_ex,\
v90 = v90.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v90 = v90.adjustSize
v90 = v90.assumeFPS(18)
v90 = v90.add_blank_audio
return v90.prefetch
#adjustframerate
