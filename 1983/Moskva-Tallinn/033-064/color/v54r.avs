import("..\1983-Moskva-Tallinn.avs")
v54 = LSMASHVideoSource(dst_dir + "v54f.mp4").ConvertToYV24()
v54 = v54.AdjustColor(ou = +16, ov = -10, x=300, y=800, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
v54 = v54.add_blank_audio
return v54.prefetch
#adjustframerate
