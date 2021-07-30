import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v100 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v100f.avi").ConvertToYV24()
v100_1 = v100.trim(0, 106)
v100_1 = v100_1.AdjustColor(ou=4, ov=-8, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v100_2 = v100.trim(107, 123)
br_w = 100
br_c = v100_2.width - br_w
br = v100.trim(106, 106).loop(v100_2.frameCount).crop(br_c, 0, 0, 0)
v100_2 = v100_2.stackHorizontal(br)
v100_2 = v100_2.AdjustColor(ou=4, ov=-8, x=0, y=10, w=-0, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v100_2 = v100_2.crop(0, 0, -br_w, 0)
v100_3 = v100.trim(124, 0)
v100_3 = v100_3.AdjustColor(ou=4, ov=-8, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v100 = v100_1 + v100_2 + v100_3
#v100 = v100.AdjustColor(ou=4, ov=-8, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v100 = v100.colorYUV(off_u=6, off_v=0)
v100 = v100.autolevels(autolevel=false, input_low=22, input_high=229, debug=false, gamma=1.3, minRng=0)
v100 = v100.convertToYV12
v100 = v100.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v100 = v100.removeDirt
v100 = v100.UnsharpMask(strength=300, radius=3, threshold=1)
v100 = v100.adjustBorders
return v100.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
