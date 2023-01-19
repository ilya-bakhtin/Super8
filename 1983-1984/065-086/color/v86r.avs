import("..\1983-1984.avs")
v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
#v86 = v86.colorYUV(off_y = 0)
#v86 = v86.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v86 = v86.AdjustColor(ou = +6, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v86 = v86.colorYUV(off_u = -4, off_v = +0)
#v86 = v86.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
#return v86.histogram("levels")#.prefetch
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate
