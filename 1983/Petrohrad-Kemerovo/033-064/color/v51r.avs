import("..\1983-Petrohrad-Kemerovo.avs")
v51 = LSMASHVideoSource(dst_dir + "v51f.mp4").ConvertToYV24()
b_ex = undefined
v51 = v51.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v51 = v51.colorYUV(off_u = +8, off_v = -4)
v51 = v51.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.9, border_t = 600)
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
v51 = v51.add_blank_audio
return v51.prefetch
#adjustframerate
