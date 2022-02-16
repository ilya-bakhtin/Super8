import("..\8mm film 2048x1536 18Fps.mov.avs")
v26 = LWLibavVideoSource(source_dir + "v26f.avi").ConvertToYV24()
v26 = v26.crop(16, 20, 0, 0)
v26 = v26.adjustSize()
v26 = v26.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=2.5, grn=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v26 = v26.colorYUV(off_u=16, off_v=-16, gamma_y = 0)
return v26.prefetch(6)
#adjustframerate
