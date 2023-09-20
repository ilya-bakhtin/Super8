import("..\1983-Moskva-Tallinn.avs")
v88 = LSMASHVideoSource(dst_dir + "v88f.mp4").ConvertToYV24()
v88 = v88.colorYUV(off_y = -8)
b_ex = undefined
v88 = v88.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)#, b_expr=b_ex,\
v88 = v88.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
v88 = v88.add_blank_audio
return v88.prefetch
#adjustframerate
