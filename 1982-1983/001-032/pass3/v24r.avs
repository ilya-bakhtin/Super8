import("..\8mm film 2048x1536 18Fps.mov.avs")
v24 = LWLibavVideoSource(source_dir + "v24f.avi").ConvertToYV24()
v24 = v24.crop(4, 12, 0, 0)
v24 = v24.adjustSize()
v24 = v24.AdjustColor(ou=8, ov=-4, x=10, y=200, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, grn=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v24 = v24.colorYUV(off_u=10, off_v=-16, gamma_y = 0)
return v24.prefetch(6)
#adjustframerate
