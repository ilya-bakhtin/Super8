import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v151 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v151f.avi").ConvertToYV24()
br_h = 100
br_c = v151.height - br_h
br = v151.trim(58, 58).loop(v151.frameCount).crop(0, br_c, 0, 0)
v151 = v151.stackVertical(br)
v151 = v151.AdjustColor(ou=2, ov=-8, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
v151 = v151.crop(0, 0, 0, -br_h)
#v151 = v151.colorYUV(off_u=10, off_v=-10)
v151 = v151.autolevels(gamma=1.3, minRng=0)
v151 = v151.convertToYV12
v151 = v151.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v151 = v151.removeDirt
v151 = v151.UnsharpMask(strength=300, radius=3, threshold=1)
v151 = v151.adjustBorders
return v151.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
