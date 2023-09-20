import("..\1983-Moskva-Tallinn.avs")
v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").ConvertToYV24()
v7 = v7.colorYUV(off_y = -16)
#v7_0 = v7.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.5, gam_mac=true,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v7 = v7.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.5, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v7 = v7_0.interleave(v7)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
v7 = v7.add_blank_audio
return v7.prefetch
#adjustframerate
