import("..\8mm film 2048x1536 18Fps.mov.avs")
v21 = LWLibavVideoSource(source_dir + "v21f.avi").ConvertToYV24()
v21 = v21.crop(4, 12, 0, 0)
v21 = v21.adjustSize()
v21 = v21.AdjustColor(ou=8, ov=-8, x=10, y=200, w=-10, h=-100, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v21 = v21.colorYUV(off_u=4, off_v=-8, gamma_y = 8)
return v21.prefetch(6)
#adjustframerate
