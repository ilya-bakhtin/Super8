import("..\1983-Moskva-Tallinn.avs")
v136 = LSMASHVideoSource(dst_dir + "v136f.mp4").ConvertToYV24()
b_ex = undefined
v136 = v136.AdjustColor(ou = +12, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v136 = v136.colorYUV(off_u = +10, off_v = -10)
v136 = v136.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.2)#, autolevel=false, input_low=16, input_high=235)
v136 = v136.adjustSize
v136 = v136.assumeFPS(18)
v136 = v136.add_blank_audio
return v136.prefetch
#adjustframerate
