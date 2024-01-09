import("..\1983-Petrohrad-Kemerovo.avs")
v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
v19 = v19.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v19 = v19.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v19 = v19.colorYUV(off_u = +2, off_v = -2)
v19 = v19.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.1)#, autolevel=false, input_low=16, input_high=235)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate
