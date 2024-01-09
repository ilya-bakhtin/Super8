import("..\1983-Petrohrad-Kemerovo.avs")
v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
b_ex = undefined
v43 = v43.AdjustColor(ou = +6, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v43 = v43.colorYUV(off_u = +6, off_v = -6)
v43 = v43.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=2.1)#, autolevel=false, input_low=16, input_high=235)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate
