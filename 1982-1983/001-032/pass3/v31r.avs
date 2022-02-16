import("..\8mm film 2048x1536 18Fps.mov.avs")
v31 = LWLibavVideoSource(source_dir + "v31f.avi").ConvertToYV24()
v31 = v31.crop(4, 12, 0, 0)
v31 = v31.adjustSize()
v31 = v31.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v31 = v31.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v31.prefetch(6)
#adjustframerate
