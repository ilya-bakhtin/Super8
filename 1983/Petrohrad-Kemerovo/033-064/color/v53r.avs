import("..\1983-Petrohrad-Kemerovo.avs")
v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
v53 = v53.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v53 = v53.AdjustColor(ou = +10, ov = -10, x=0, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v53 = v53.colorYUV(off_u = -2, off_v = +2)
v53 = v53.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=1.9)
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate
