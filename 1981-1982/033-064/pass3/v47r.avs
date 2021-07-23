import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v47 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v47f.avi").ConvertToYV24()
br = v47.trim(85, 85).loop(v47.frameCount).crop(250, 0, 350 - v47.width, 0)
v47 = v47.stackHorizontal(br)
v47 = v47.AdjustColor(ou=3, ov=-10, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.5, gam_mac=true)
v47 = v47.crop(0, 0, -br.width, 0)
v47 = v47.colorYUV(off_u=-4, off_v=-4)
#v47 = v47.autolevels(filterRadius=9, gamma=1.5)
v47 = v47.convertToYV12
v47 = v47.Filter(th_SAD=200, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v47 = v47.removeDirt
v47 = v47.UnsharpMask(strength=200, radius=3, threshold=1)
v47 = v47.adjustBorders
return v47.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
