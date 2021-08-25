import("11943 Bakhtin N8 01.720p_01-161.mov.avs")
v172 = v172.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 50, border_r = 50, border_t = 50, border_b = 50, filterRadius = 9, minRng=0)
#v172 = v172.Filter(th_SAD=4000, blksize=32, sigma_y=20, sigma_c=40).extractY.bilinearResize(1920, 1440).crop(200, 0, -800, -900)
#v172 = v172.Filter(th_SAD=4000, blksize=32, sigma_y=10, sigma_c=5).extractY.crop(100, 0, -400, -450)
return v172.Prefetch(6)

