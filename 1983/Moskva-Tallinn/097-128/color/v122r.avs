import("..\1983-Moskva-Tallinn.avs")
v122 = LSMASHVideoSource(dst_dir + "v122f.mp4").ConvertToYV24()
b_ex = undefined
v122 = v122.AdjustColor(ou = +6, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v122 = v122.colorYUV(off_u = +6, off_v = -6)
v122 = v122.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v122 = v122.adjustSize
v122 = v122.assumeFPS(18)
v122 = v122.add_blank_audio
return v122.prefetch
#adjustframerate
