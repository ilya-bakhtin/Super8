import("..\1983-Moskva-Tallinn.avs")
v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
v69 = v69.colorYUV(off_y = -20)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v69 = v69.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v69 = v69.colorYUV(off_u = +4, off_v = -4)
v69 = v69.ConvertToRGB()
v69 = Expr(v69.ExtractR, v69.ExtractG, v69.ExtractB, "x", "y", b_ex, format = "RGBP")
v69 = v69.ConvertToYV24()
v69 = v69.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.5)#, input_low=16, output_high=235, autolevel=false)
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate

