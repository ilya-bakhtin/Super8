import("..\1983-Petrohrad-Kemerovo.avs")
v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
v16 = v16.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v16 = v16.AdjustColor(ou = +8, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v16 = v16.colorYUV(off_u = +6, off_v = -6)
v16 = v16.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate
