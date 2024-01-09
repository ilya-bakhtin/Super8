import("..\1983-Petrohrad-Kemerovo.avs")
v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
v3 = v3.colorYUV(off_y = -20)
b_ex = undefined
v3 = v3.AdjustColor(ou = +4, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v3 = v3.colorYUV(off_u = +6, off_v = -6)
v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate
