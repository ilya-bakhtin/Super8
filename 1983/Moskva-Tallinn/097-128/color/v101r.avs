import("..\1983-Moskva-Tallinn.avs")
v101 = LSMASHVideoSource(dst_dir + "v101f.mp4").ConvertToYV24()
v101 = v101.colorYUV(off_y = -16)
b_ex = "z x 1.1 * > z y 1.1 * > & z x y + 2. / - 2. / z ?"
v101 = v101.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-800, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)#,\
v101 = v101.colorYUV(off_u = +2, off_v = -2)
v101 = v101.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
v101 = v101.add_blank_audio
return v101.prefetch
#adjustframerate
