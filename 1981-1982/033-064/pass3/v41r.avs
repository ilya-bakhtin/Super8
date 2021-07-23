import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v41 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v41f.avi").ConvertToYV24()
br_w = 100
br_c = v41.width - br_w
br = v41.trim(43, 43).loop(v41.frameCount).crop(br_c, 0, 0, 0)
v41 = v41.stackHorizontal(br)
v41 = v41.AdjustColor(ou=-5, ov=-5, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=1.9, gam_mac=true)
v41 = v41.crop(0, 0, -br_w, 0)
v41 = v41.colorYUV(off_u=4, off_v=-4)
#v41 = v41.autolevels(filterRadius=9, gamma=1.5)
v41 = v41.convertToYV12
v41 = v41.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v41 = v41.removeDirt
v41 = v41.UnsharpMask(strength=300, radius=3, threshold=1)
v41 = v41.adjustBorders
return v41.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
