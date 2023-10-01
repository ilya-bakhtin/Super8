import("..\1983-Moskva-Tallinn.avs")
v114 = LSMASHVideoSource(dst_dir + "v114f.mp4").ConvertToYV24()
b_ex = undefined
v114 = v114.AdjustColor(ou = +12, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v114 = v114.animate(40, 50, "color_yuv", 0, 0, -4, 4)
v114 = v114.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v114 = v114.adjustSize
v114 = v114.assumeFPS(18)
v114 = v114.add_blank_audio
return v114.prefetch
#adjustframerate
