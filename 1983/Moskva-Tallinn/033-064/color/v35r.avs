import("..\1983-Moskva-Tallinn.avs")
v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
v35 = v35.colorYUV(off_y = -16)
v35 = v35.AdjustColor(ou = +18, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v35 = v35.colorYUV(off_u = +0, off_v = +4)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate
