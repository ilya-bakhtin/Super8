import("..\8mm film 2048x1536 18Fps.mov.avs")
v33 = LWLibavVideoSource(source_dir + "v33f.avi").ConvertToYV24()
v33 = v33.crop(0, 12, 0, 0)
v33 = v33.adjustSize()
v33 = v33.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)#,\
#    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v33 = v33.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v33.prefetch(6)
#adjustframerate
