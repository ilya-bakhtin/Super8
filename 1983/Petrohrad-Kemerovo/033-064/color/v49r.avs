import("..\1983-Petrohrad-Kemerovo.avs")
v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
b_ex = undefined
v49 = v49.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v49 = v49.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.9)
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate
