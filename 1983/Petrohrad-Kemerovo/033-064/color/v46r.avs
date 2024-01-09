import("..\1983-Petrohrad-Kemerovo.avs")
v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
b_ex = undefined
v46 = v46.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v46 = v46.colorYUV(off_u = -3, off_v = -0)
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate
