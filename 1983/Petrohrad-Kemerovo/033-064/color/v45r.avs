import("..\1983-Petrohrad-Kemerovo.avs")
v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
v45 = v45.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v45 = v45.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v45 = v45.colorYUV(off_u = +3, off_v = -0)
v45 = v45.autolevels(filterRadius=0, minRng=0, ignore_low=0.06, ignore_high=0.01, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate
