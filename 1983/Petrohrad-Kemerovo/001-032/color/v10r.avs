import("..\1983-Petrohrad-Kemerovo.avs")
v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
v10 = v10.colorYUV(off_y = -20)
b_ex = undefined
v10 = v10.AdjustColor(ou = +12, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v10 = v10.colorYUV(off_u = +4, off_v = -4)
v10 = v10.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate
