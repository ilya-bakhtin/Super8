import("..\8mm film 2048x1536 18Fps.mov.avs")
v19 = LWLibavVideoSource(source_dir + "v19f.avi").ConvertToYV24()
v19 = v19.adjustSize()
v19 = v19.autolevels(minRng=0, input_low=32, input_high=60)
v19 = v19.AdjustColor(ou=20, ov=-12, x=100, y=100, w=-10, h=-100, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=0.5, gam_mac=false, blu=1,\
    bluePoints="0,0, 26, 0, 40,0, 48,0, 66,0, 86,0, 107,0, 120,0, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
return v19.prefetch(6)
#adjustframerate
