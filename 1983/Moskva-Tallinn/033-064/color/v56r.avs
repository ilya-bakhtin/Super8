import("..\1983-Moskva-Tallinn.avs")
v56 = LSMASHVideoSource(dst_dir + "v56f.mp4").ConvertToYV24()
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v56 = v56.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v56 = v56.colorYUV(off_u = -4, off_v = -4)
v56 = v56.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
v56 = v56.add_blank_audio
return v56.prefetch
#adjustframerate
