import("..\1989-sevas.avs")
v60 = LSMASHVideoSource(dst_dir + "v60f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v60 = v60.stackVertical(v60.trim(283, -1).loop(v60.frameCount).crop(0, 0, 0, add_height - v60.height))
v60 = v60.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.00, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v60 = v60.colorYUV(off_u = -2, off_v = +2)
v60 = v60.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.000, gamma=0.5)
v60 = v60.crop(0, 0, 0, -add_height)
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
v60 = v60.add_blank_audio
return v60.prefetch
#adjustframerate
