import("..\8mm film 2048x1536 18Fps.mov.avs")
v20 = LWLibavVideoSource(source_dir + "v20f.avi").ConvertToYV24()
v20 = v20.crop(14, 18, 0, 0)
v20 = v20.adjustSize()
v20 = v20.AdjustColor(ou=4, ov=-2, x=10, y=200, w=-10, h=-100, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=3, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v20 = v20.colorYUV(off_u=18, off_v=-18, gamma_y = 0)
return v20.prefetch(6)
#adjustframerate
