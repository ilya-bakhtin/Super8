import("..\1983-Moskva-Tallinn.avs")
v143 = LSMASHVideoSource(dst_dir + "v143f.mp4").ConvertToYV24()
#v143 = v143.autolevels
v143 = v143.colorYUV(off_y = -16)
#v143 = v143.animate(80, 100, "offset_y", -12, 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v143 = v143.AdjustColor(ou = +12, ov = -8, x=500, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v143 = v143.colorYUV(off_u = +8, off_v = -8)
#v143 = v143.animate(180, 210, "color_yuv", 4, -4, 12, -4)
v143 = v143.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.9)#, autolevel=false, input_low=16, input_high=235)
#return v143.hist_levels
v143 = v143.adjustSize
v143 = v143.assumeFPS(18)
v143 = v143.add_blank_audio
return v143.prefetch
#adjustframerate
