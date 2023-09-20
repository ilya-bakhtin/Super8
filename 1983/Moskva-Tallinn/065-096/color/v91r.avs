import("..\1983-Moskva-Tallinn.avs")
v91 = LSMASHVideoSource(dst_dir + "v91f.mp4").ConvertToYV24()
v91 = v91.colorYUV(off_y = -8)
b_ex = undefined
v91 = v91.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)#, b_expr=b_ex,\
v91 = v91.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
v91 = v91.add_blank_audio
return v91.prefetch
#adjustframerate
