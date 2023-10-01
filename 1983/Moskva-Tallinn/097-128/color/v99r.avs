import("..\1983-Moskva-Tallinn.avs")
v99 = LSMASHVideoSource(dst_dir + "v99f.mp4").ConvertToYV24()
v99 = v99.colorYUV(off_y = -16)
v99 = v99.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)
v99 = v99.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
v99 = v99.add_blank_audio
return v99.prefetch
#adjustframerate
