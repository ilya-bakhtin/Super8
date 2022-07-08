SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("M:\Media\video\Super8\1982-skola\N8 film.mov")
assumefps(18)

full = last

crop(210, 80, -50, -92)
#crop(210, 80, -10, -92)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 79, 186, 317, 505, 635, 793, 872, 962, 1023, 1164, 1279, 1363, 1493, 1554, 1741, 2154, 2314, 2435, 2657, 2853, 3007, # 22
# 3347, 3547, 3777, 3966, 4058, 4173, 4473, 4864, 5013, 5057, 5076, 5297, 5637, 5643, 5840, 5908, 6065, 6156, 6201, 6383, # 42, 20 per col.
# 6608, 6806, 6859, 7001, 7027, 7525, 7535, 7635, 7767, 7772, 7841, 7966, 8249, 8439, 8725, 8808, 8894, 9038, 9224, 9393, # 62
# 9560, 9721, 9841, 9936, 10049, 10226, 10496, 10757, 10798, 11000, 11182, 11570, 11604, 11913, 12377, 12428, 12556, 12732, # 80
# 12741, 12767, 12780, 12822, 12876, 12921, 12931, 13005, 13025, 13102, 13133, 13161, 13254, 13277, 13291, 13373, 13476, # 97, 17 per col.
# 13547, 13631, 13697, 13820, 13856, 13919, 13963, 13989, 14013, 14074, 14115, 14168, 14307, 14470, 14514, 14751, 14973, # 114
# 15136, 15203, 15274, 15486, 15650, 15838, 16278, 16428, 16671, 16958, 17123, 17453, 17723, 17972, 18045, 18539, 18590, # 131
# 19130, 19248, 19534, 19699, 19819, 20222, 20331, 20750, 21109, 21161, 21232, 21282, 21410, 21634, 21932, 22282, 22734, # 148
#
# skipped
# (7525, 7534)
# (7767, 7771)
# (12921, 12930)
# (13133, 13160)
# (13277, 13290)

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

ref_left = 180 + 18
ref_right = -30 + 2
ref_top = 110
ref_bot = -92

left = ref_left
right = ref_right
top = ref_top
bot = ref_bot

full = full.stackHorizontal(full.crop(full.width - 16, 0, 0, 0))

left = ref_left
right = ref_right
top = ref_top
bot = ref_bot

v97 = full.trim(13856, 13918)
v097 = v97.crop(left + 40, top + 40, right - 58, bot + 26)

v98 = full.trim(13919, 13962)
v098 = v98.crop(left + 40, top + 40, right - 58, bot + 26)

v99 = full.trim(13963, 13988)
v099 = v99.crop(left + 30, top + 40, right - 68, bot + 26)

v100 = full.trim(13989, 14012)
v100 = v100.crop(left + 40, top + 40, right - 58, bot + 26)

v101 = full.trim(14013, 14073)
v101 = v101.crop(left + 40, top + 40, right - 58, bot + 26)

v102 = full.trim(14074, 14114)
v102 = v102.crop(left + 40, top + 40, right - 58, bot + 26)

v103 = full.trim(14116, 14167)
v103 = v103.crop(left + 40, top + 40, right - 58, bot + 26)

v104 = full.trim(14168, 14306)
v104 = v104.crop(left + 60, top + 46, right - 58, bot + 16)

v105 = full.trim(14307, 14469)
v105 = v105.crop(left + 50, top + 44, right - 58, bot + 22)

v106 = full.trim(14470, 14513)
v106 = v106.crop(left + 50, top + 44, right - 58, bot + 22)

v107 = full.trim(14514, 14750)
v107 = v107.crop(left + 40, top + 40, right - 58, bot + 26)

v108 = full.trim(14752, 14970)
v108 = v108.animate(199, 208, "crop", left + 50, top + 48, right - 68, bot + 18, left + 100, top + 48, right - 18, bot + 18).trim(0, 208) +\
       v108.animate(208, 218, "crop", left + 100, top + 48, right - 18, bot + 18, left + 0, top + 48, right - 118, bot + 18).trim(209, 0)

v109 = full.trim(14974, 15135)
v109 = stackVertical(v109.crop(0, 140, 0, 0), (v109.trim(1, 0) + v109.trim(v109.frameCount - 1, 0)).crop(0, 50, 0, -v109.height + 140))
#v109 = v109.animate(0, 4, "crop", left + 68, top + 52, right - 56, bot + 18, left + 98, top + 52, right - 26, bot + 18).trim(0, 4) +\
#       v109.animate(5, 14, "crop", left + 98, top + 52, right - 26, bot + 18, left + 64, top + 52, right - 60, bot + 18).trim(5, 0)
v109 = v109.animate(0, 4, "crop", left + 68, 0, right - 56, 0, left + 98, 0, right - 26, 0).trim(0, 4) +\
       v109.animate(5, 14, "crop", left + 98, 0, right - 26, 0, left + 64, 0, right - 60, 0).trim(5, 0)
v109 = v109.animate(68, 70, "crop", 0, top + 34, 0, bot + 50, 0, top - 36, 0, bot - 20).trim(0, 70) +\
       v109.animate(105, 120, "crop", 0 ,top - 36, 0, bot - 20, 0, top - 66, 0, bot - 50).trim(71, 0)

v110 = full.trim(15136, 15202)
v110 = v110.animate(14, 22, "crop", left + 60, top + 50, right - 38, bot + 36, left + 40, top + 50, right - 58, bot + 36).trim(0, 22) +\
       v110.animate(30, 60, "crop", left + 40, top + 50, right - 58, bot + 36, left + 70, top + 50, right - 28, bot + 36).trim(23, 60) +\
       v110.animate(60, 66, "crop", left + 70, top + 50, right - 28, bot + 36, left + 60, top + 50, right - 38, bot + 36).trim(61, 0)

v111 = full.trim(15203, 15273)
v111 = v111.animate(22, 31, "crop", left + 58, top + 52, right - 56, bot + 26, left + 78, top + 52, right - 36, bot + 26).trim(0, 31) +\
       v111.animate(31, 43, "crop", left + 78, top + 52, right - 36, bot + 26, left + 58, top + 52, right - 56, bot + 26).trim(32, 0)

v112 = full.trim(15274, 15485)
v112 = v112.crop(left + 58, top + 50, right - 56, bot + 24)

v113 = full.trim(15486, 15649)
v113 = v113.crop(left + 58, top + 60, right - 56, bot + 34)

v114 = full.trim(15650, 15837)
v114 = v114.animate(27, 41, "crop", left + 44, top + 50, right - 54, bot + 36, left + 64, top + 50, right - 34, bot + 36).trim(0, 41) +\
       v114.animate(41, 49, "crop", left + 64, top + 50, right - 34, bot + 36, left + 44, top + 50, right - 54, bot + 36).trim(42, 62) +\
       v114.animate(64, 74, "crop", left + 44, top + 50, right - 54, bot + 36, left + 78, top + 50, right - 20, bot + 36).trim(63, 74) +\
       v114.animate(74, 90, "crop", left + 78, top + 50, right - 20, bot + 36, left + 44, top + 50, right - 54, bot + 36).trim(75, 104) +\
       v114.animate(105, 120, "crop", left + 44, top + 50, right - 54, bot + 36, left + 78, top + 50, right - 20, bot + 36).trim(105, 120) +\
       v114.animate(120, 131, "crop", left + 78, top + 50, right - 20, bot + 36, left + 44, top + 50, right - 54, bot + 36).trim(121, 158) +\
       v114.animate(159, 173, "crop", left + 44, top + 50, right - 54, bot + 36, left + 78, top + 50, right - 20, bot + 36).trim(159, 173) +\
       v114.animate(173, 186, "crop", left + 78, top + 50, right - 20, bot + 36, left + 44, top + 50, right - 54, bot + 36).trim(174, 0)

v115 = full.trim(15838, 16277)
v115_ = v115.trim(434, 435)
v115_ = v115_.crop(0, v115_.height - 50, 0, 0).stackVertical(v115_.crop(0, 0, 0, -50))
v115 = v115.trim(0, 433) + v115_ + v115.trim(436, 0)
v115 = v115.animate(435, 439, "crop", 0, top + 60, 0, bot + 30, 0, top + 30, 0, bot + 0)
v115 = v115.animate(426, 429, "crop", left + 68, 0, right - 50, 0, left + 54, 0, right - 64, 0).trim(0, 429) +\
       v115.animate(429, 430, "crop", left + 54, 0, right - 64, 0, left + 68, 0, right - 50, 0).trim(430, 431) +\
       v115.animate(431, 439, "crop", left + 68, 0, right - 50, 0, left + 124, 0, right + 6, 0).trim(432, 0)

v116 = full.trim(16279, 16427)
v116 = v116.animate(0, 5, "crop", left + 50, top + 60, right - 60, bot + 36, left + 30, top + 60, right - 80, bot + 36).trim(0, 5) +\
       v116.animate(5, 8, "crop", left + 30, top + 60, right - 80, bot + 36, left + 54, top + 60, right - 56, bot + 36).trim(6, 8) +\
       v116.animate(70, 74, "crop", left + 54, top + 60, right - 56, bot + 36, left + 64, top + 60, right - 46, bot + 36).trim(9, 74) +\
       v116.animate(74, 79, "crop", left + 64, top + 60, right - 46, bot + 36, left + 54, top + 60, right - 56, bot + 36).trim(75, 0)

v117 = full.trim(16428, 16670)
v117 = v117.animate(139, 143, "crop", left + 56, top + 60, right - 54, bot + 36, left + 78, top + 60, right - 32, bot + 36).trim(0, 143) +\
       v117.animate(143, 153, "crop", left + 78, top + 60, right - 32, bot + 36, left + 56, top + 60, right - 54, bot + 36).trim(144, 153) +\
       v117.animate(229, 236, "crop", left + 56, top + 60, right - 54, bot + 36, left + 78, top + 60, right - 32, bot + 36).trim(154, 236) +\
       v117.animate(236, 242, "crop", left + 78, top + 60, right - 32, bot + 36, left + 60, top + 60, right - 50, bot + 36).trim(237, 0)

v118 = full.trim(16672, 16957)
v118 = v118.animate(2, 3, "crop", left + 56, top + 60, right - 54, bot + 36, left + 52, top + 60, right - 58, bot + 36).trim(0, 29) +\
       v118.animate(30, 40, "crop", left + 56, top + 60, right - 54, bot + 36, left + 62, top + 60, right - 48, bot + 36).trim(30, 40) +\
       v118.animate(40, 50, "crop", left + 62, top + 60, right - 48, bot + 36, left + 56, top + 60, right - 54, bot + 36).trim(41, 68) +\
       v118.animate(69, 76, "crop", left + 56, top + 60, right - 54, bot + 36, left + 88, top + 60, right - 22, bot + 36).trim(69, 75) +\
       v118.animate(76, 88, "crop", left + 88, top + 60, right - 22, bot + 36, left + 56, top + 60, right - 54, bot + 36).trim(76, 95) +\
       v118.animate(96, 97, "crop", left + 56, top + 60, right - 54, bot + 36, left + 66, top + 60, right - 44, bot + 36).trim(96, 191) +\
       v118.animate(192, 199, "crop", left + 66, top + 60, right - 44, bot + 36, left + 50, top + 60, right - 60, bot + 36).trim(192, 199) +\
       v118.animate(199, 206, "crop", left + 50, top + 60, right - 60, bot + 36, left + 66, top + 60, right - 44, bot + 36).trim(200, 0)

v119 = full.trim(16958, 17118)
v119 = v119.animate(0, 4, "crop", 0, top + 50, 0, bot + 26, 0, top + 60, 0, bot + 36).trim(0, 14) +\
       v119.animate(15, 21, "crop", 0, top + 60, 0, bot + 36, 0, top + 50, 0, bot + 26).trim(15, 21) +\
       v119.animate(21, 26, "crop", 0, top + 50, 0, bot + 26, 0, top + 60, 0, bot + 36).trim(22, 26) +\
       v119.animate(79, 89, "crop", 0, top + 60, 0, bot + 36, 0, top + 40, 0, bot + 16).trim(27, 89) +\
       v119.animate(89, 99, "crop", 0, top + 40, 0, bot + 16, 0, top + 60, 0, bot + 36).trim(90, 147) +\
       v119.animate(148, 150, "crop", 0, top + 60, 0, bot + 36, 0, top + 40, 0, bot + 16).trim(148, 150) +\
       v119.animate(157, 158, "crop", 0, top + 40, 0, bot + 16, 0, top + 0, 0, bot - 24).trim(151, 0)

v119 = v119.animate(38, 50, "crop", left + 62, 0, right - 48, 0, left + 32, 0, right - 78, 0).trim(0, 50) +\
       v119.animate(50, 56, "crop", left + 32, 0, right - 78, 0, left + 62, 0, right - 48, 0).trim(51, 0)

v120 = full.trim(17124, 17452)
v120 = v120.crop(left + 40, top + 40, right - 58, bot + 26)

v121 = full.trim(17454, 17722)
v121 = v121.crop(left + 40, top + 40, right - 58, bot + 26)

v122 = full.trim(17724, 17971)
v122 = v122.crop(left + 40, top + 50, right - 58, bot + 36)

v123 = full.trim(17973, 18044)
v123 = v123.crop(left + 40, top + 50, right - 58, bot + 36)

v124 = full.trim(18045, 18538)
v124 = v124.crop(left + 40, top + 50, right - 58, bot + 36)

v125 = full.trim(18539, 18589)
v125 = v125.crop(left + 40, top + 50, right - 58, bot + 36)

v126 = full.trim(18590, 19129)
v126 = v126.crop(left + 40, top + 50, right - 58, bot + 36)

v127 = full.trim(19130, 19247)
v127 = v127.animate(104, 112, "crop", 0, top + 50, 0, bot + 36, 0, top - 60, 0, bot - 74)

v127 = v127.animate(104, 107, "crop", left + 40, 0, right - 58, 0, left + 20, 0, right - 78, 0).trim(0, 107) +\
       v127.animate(107, 109, "crop", left + 40, 0, right - 58, 0, left + 58, 0, right - 40, 0).trim(108, 109) +\
       v127.animate(109, 111, "crop", left + 58, 0, right - 40, 0, left + 40, 0, right - 58, 0).trim(110, 111) +\
       v127.animate(111, 117, "crop", left + 40, 0, right - 58, 0, left + 98, 0, right - 0, 0).trim(112, 0)

v128 = full.trim(19249, 19533)
v128 = v128.animate(251, 274, "crop", left + 40, top + 30, right - 58, bot + 16, left + 40, top - 20, right - 58, bot - 34)

#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).info.prefetch
#return v127.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 97

v97 = LWLibavVideoSource(source_dir + "v097f.avi", cache=false).ConvertToYV24()
v97 = v97.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
return v97.prefetch
#adjustframerate

v98 = LWLibavVideoSource(source_dir + "v098f.avi", cache=false).ConvertToYV24()
v98 = v98.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v98 = v98.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
return v98.prefetch
#adjustframerate

v99 = LWLibavVideoSource(source_dir + "v099f.avi", cache=false).ConvertToYV24()
v99 = v99.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v99 = v99.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
return v99.prefetch
#adjustframerate

v100 = LWLibavVideoSource(source_dir + "v100f.avi", cache=false).ConvertToYV24()
v100 = v100.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v100 = v100.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
return v100.prefetch
#adjustframerate

v101 = LWLibavVideoSource(source_dir + "v101f.avi", cache=false).ConvertToYV24()
v101 = v101.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v101 = v101.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
return v101.prefetch
#adjustframerate

v102 = LWLibavVideoSource(source_dir + "v102f.avi", cache=false).ConvertToYV24()
v102 = v102.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v102 = v102.adjustSize
v102 = v102.assumeFPS(18)
return v102.prefetch
#adjustframerate

v103 = LWLibavVideoSource(source_dir + "v103f.avi", cache=false).ConvertToYV24()
v103 = v103.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v103 = v103.adjustSize
v103 = v103.assumeFPS(18)
return v103.prefetch
#adjustframerate

v104 = LWLibavVideoSource(source_dir + "v104f.avi", cache=false).ConvertToYV24()
v104 = v104.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v104 = v104.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v104 = v104.adjustSize
v104 = v104.assumeFPS(18)
return v104.prefetch
#adjustframerate

v105 = LWLibavVideoSource(source_dir + "v105f.avi", cache=false).ConvertToYV24()
v105 = v105.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v105 = v105.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v105 = v105.adjustSize
v105 = v105.assumeFPS(18)
return v105.prefetch
#adjustframerate

v106 = LWLibavVideoSource(source_dir + "v106f.avi", cache=false).ConvertToYV24()
v106 = v106.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v106 = v106.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v106 = v106.adjustSize
v106 = v106.assumeFPS(18)
return v106.prefetch
#adjustframerate

v107 = LWLibavVideoSource(source_dir + "v107f.avi", cache=false).ConvertToYV24()
v107 = v107.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v107 = v107.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
return v107.prefetch
#adjustframerate

v108 = LWLibavVideoSource(source_dir + "v108f.avi", cache=false).ConvertToYV24()
v108 = v108.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v108 = v108.animate(189, 194, "gamma", 1100, 400).trim(0, 194) +\
       v108.animate(195, 199, "gamma", 400, 1000).trim(195, 0)
v108 = v108.adjustSize
v108 = v108.assumeFPS(18)
return v108.prefetch
#adjustframerate

v109 = LWLibavVideoSource(source_dir + "v109f.avi", cache=false).ConvertToYV24()
v109 = v109.AdjustColor(ou=4, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v109 = v109.colorYUV(off_u=-6, off_v=0)
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
return v109.prefetch
#adjustframerate

v110 = LWLibavVideoSource(source_dir + "v110f.avi", cache=false).ConvertToYV24()
v110 = v110.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v110 = v110.adjustSize
v110 = v110.assumeFPS(18)
return v110.prefetch
#adjustframerate

v111 = LWLibavVideoSource(source_dir + "v111f.avi", cache=false).ConvertToYV24()
v111 = v111.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v111 = v111.animate(24, 44, "gamma", 400, 1000)
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
return v111.prefetch
#adjustframerate

v112 = LWLibavVideoSource(source_dir + "v112f.avi", cache=false).ConvertToYV24()
v112 = v112.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v112 = v112.adjustSize
v112 = v112.assumeFPS(18)
return v112.prefetch
#adjustframerate

v113 = LWLibavVideoSource(source_dir + "v113f.avi", cache=false).ConvertToYV24()
v113 = v113.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v113 = v113.adjustSize
v113 = v113.assumeFPS(18)
return v113.prefetch
#adjustframerate

v114 = LWLibavVideoSource(source_dir + "v114f.avi", cache=false).ConvertToYV24()
v114 = v114.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v114 = v114.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v114 = v114.adjustSize
v114 = v114.assumeFPS(18)
return v114.prefetch
#adjustframerate

v115 = LWLibavVideoSource(source_dir + "v115f.avi", cache=false).ConvertToYV24()
v115 = v115.AdjustColor(ou=4, ov=2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v115 = v115.animate(140, 150, "color_uv", 0, 0, 0, 14).trim(0, 154) +\
       v115.animate(160, 170, "color_uv", 0, 14, 0, 0).trim(155, 0)
v115 = v115.animate(402, 417, "gamma", 700, 400).trim(0, 417) +\
       v115.animate(417, 432, "gamma", 400, 700).trim(418, 0)
v115 = v115.adjustSize
v115 = v115.assumeFPS(18)
return v115.prefetch
#adjustframerate

v116 = LWLibavVideoSource(source_dir + "v116f.avi", cache=false).ConvertToYV24()
v116 = v116.AdjustColor(ou=4, ov=-6, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v116 = v116.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v116 = v116.adjustSize
v116 = v116.assumeFPS(18)
return v116.prefetch
#adjustframerate

v117 = LWLibavVideoSource(source_dir + "v117f.avi", cache=false).ConvertToYV24()
v117 = v117.AdjustColor(ou=4, ov=-6, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v117 = v117.animate(174, 182, "color_uv", 0, 0, 0, 14).trim(0, 182) +\
       v117.animate(190, 197, "color_uv", 0, 14, 0, 0).trim(183, 197) +\
       v117.animate(219, 229, "color_uv", 0, 0, 0, 14).trim(198, 0)
v117 = v117.adjustSize
v117 = v117.assumeFPS(18)
return v117.prefetch
#adjustframerate

v118 = LWLibavVideoSource(source_dir + "v118f.avi", cache=false).ConvertToYV24()
v118 = v118.AdjustColor(ou=4, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v118 = v118.animate(26, 46, "color_uv", 0, 0, 0, 10).trim(0, 46) +\
       v118.animate(100, 110, "color_uv", 0, 10, 0, 0).trim(47, 110) +\
       v118.animate(233, 243, "color_uv", 0, 0, 0, 10).trim(111, 243) +\
       v118.animate(260, 285, "color_uv", 0, 10, 0, 0).trim(244, 0)
v118 = v118.animate(33, 45, "gamma", 1000, 800)
v118 = v118.adjustSize
v118 = v118.assumeFPS(18)
return v118.prefetch
#adjustframerate

v119 = LWLibavVideoSource(source_dir + "v119f.avi", cache=false).ConvertToYV24()
v119 = v119.AdjustColor(ou=4, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v119 = v119.adjustSize
v119 = v119.assumeFPS(18)
return v119.prefetch
#adjustframerate

v120 = LWLibavVideoSource(source_dir + "v120f.avi", cache=false).ConvertToYV24()
v120 = v120.AdjustColor(ou=4, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v120 = v120.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v120 = v120.adjustSize
v120 = v120.assumeFPS(18)
return v120.prefetch
#adjustframerate

v121 = LWLibavVideoSource(source_dir + "v121f.avi", cache=false).ConvertToYV24()
v121 = v121.AdjustColor(ou=4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v121 = v121.adjustSize
v121 = v121.assumeFPS(18)
return v121.prefetch
#adjustframerate

v122 = LWLibavVideoSource(source_dir + "v122f.avi", cache=false).ConvertToYV24()
v122 = v122.AdjustColor(ou=4, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v122 = v122.adjustSize
v122 = v122.assumeFPS(18)
return v122.prefetch
#adjustframerate

v123 = LWLibavVideoSource(source_dir + "v123f.avi", cache=false).ConvertToYV24()
v123 = v123.AdjustColor(ou=4, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v123 = v123.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v123 = v123.adjustSize
v123 = v123.assumeFPS(18)
return v123.prefetch
#adjustframerate

v124 = LWLibavVideoSource(source_dir + "v124f.avi", cache=false).ConvertToYV24()
v124 = v124.AdjustColor(ou=4, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v124 = v124.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v124 = v124.adjustSize
v124 = v124.assumeFPS(18)
return v124.prefetch
#adjustframerate

v125 = LWLibavVideoSource(source_dir + "v125f.avi", cache=false).ConvertToYV24()
v125 = v125.AdjustColor(ou=4, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v125 = v125.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v125 = v125.adjustSize
v125 = v125.assumeFPS(18)
return v125.prefetch
#adjustframerate

v126 = LWLibavVideoSource(source_dir + "v126f.avi", cache=false).ConvertToYV24()
v126 = v126.AdjustColor(ou=4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v126 = v126.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.9)
v126 = v126.adjustSize
v126 = v126.assumeFPS(18)
return v126.prefetch
#adjustframerate

v127 = LWLibavVideoSource(source_dir + "v127f.avi", cache=false).ConvertToYV24()
v127 = v127.AdjustColor(ou=4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.0, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v127 = v127.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v127 = v127.adjustSize
v127 = v127.assumeFPS(18)
return v127.prefetch
#adjustframerate

v128 = LWLibavVideoSource(source_dir + "v128f.avi", cache=false).ConvertToYV24()
#v128_ = LWLibavVideoSource(source_dir + "v128s.avi", cache=false).ConvertToYV24()
#return v128_.interleave(v128).histogram("levels")
#v128 = v128.colorYUV(off_y=6)
#v128 = v128.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v128 = v128.AdjustColor(ou=6, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
#v128 = v128.colorYUV(off_u=-6, off_v=0)
#v128 = v128.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
#return v128.histogram("levels").prefetch
v128 = v128.adjustSize
v128 = v128.assumeFPS(18)
return v128.prefetch
#adjustframerate
*/

#******

function adjustBorders(clip c)
{
    ref_w = src.width
    ref_h = src.height
    ref_w = ref_w*1080/ref_h
    rem = ref_w % 16
    ref_w = (rem == 0) ? ref_w : ref_w + 16 - rem
    ref_h = 1080

    w = c.width
    h = c.height
    w = w*1080/h
    h = 1080

    c = c.height == h ? c : c.spline64Resize(w, h)

    assert(ref_w >= w, "ref_w < w")

    return ref_w == w ? c : c.addBorders(0, 0, ref_w - w, 0)
}

function adjustSize(clip c)
{
    w = c.width
    h = c.height
    w = w*1080/h
    w = (w % 2 == 0) ? w : w + 1
    h = 1080

    return c.gaussResize(w, h)
}

function Curves(clip c, string "bluePoints")
{
    return StrLen(bluePoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac", string "bluePoints", float "sat")
{
    ou = Default(ou, 0)
    ov = Default(ov, 0)
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)
    x = Default(x, 20)
    y = Default(y, 20)
    w = Default(w, -20)
    h = Default(h, -20)
    lo_th = Default(lo_th, 0)
    hi_th = Default(hi_th, 0.1)
    scale = Default(scale, 2)
    gam_mac = Default(gam_mac, true)
    lock_chan = Default(lock_chan, 1)
    bluePoints = Default(bluePoints, "")
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints = bluePoints).\
       ConvertToYV24() : c

    c = sat == 1 ? c : c.tweak(sat=sat, coring=false)

#    c = c.AdjustDiv2(1, 2)

    return c
}

function AdjustColorWB(clip c, y_gamma)
{
    c = c.tweak(sat=0, coring=false)
    c = c.Filter()
    c = c.ColorYUV(autogain=true, gamma_y = y_gamma)

    return c
}

function Filter_0(clip c)
{
    bsize = 8
    over = 4
    chrom = true
    hp = 16
    vp = 16
    search_v = 3
    dct_v = 1

    super = c.MSuper(pel=1, sharp=1, hpad=hp, vpad=vp, rfilter=4)
#return super.info

    backward_vec1 = MAnalyse(super, isb = true, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec2 = MAnalyse(super, isb = true, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec3 = MAnalyse(super, isb = true, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec1 = MAnalyse(super, isb = false, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec2 = MAnalyse(super, isb = false, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec3 = MAnalyse(super, isb = false, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
#    return c.MDegrain2(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,thSAD=4000)
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=400)
}

function Filter(clip c, int "th_SAD", int "th_SADC", float "sigma_y", float "sigma_c", int "dct", int "tr", bool "RefineMotion", bool "contrasharp",\
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter", float "fft_sharp")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)
    dct = default(dct, 0)
    tr = default(tr, 9)
    RefineMotion = default(RefineMotion, true)
    contrasharp = default(contrasharp, true)
    truemotion = default(truemotion, true)
    fft_sharp = default(fft_sharp, 0)

    new_w = (c.width + 15) / 16
    new_w = new_w * 16
    new_h = (c.height + 15) / 16
    new_h = new_h * 16
    dh = new_h - c.height
    dw = new_w - c.width
    c = c.addBorders(0, 0, dw, dh)

    c = filter16 ? c.convertBits(16) : c
#c = c.Spline64Resize(960, 720)
#c = c.SMDegrain(tr=tr, globals=3, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap)
    c = th_SAD == 0 && th_SADC == 0 ? c : c.SMDegrain(tr=tr, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap, search=3, truemotion=truemotion,\
                                                      RefineMotion=RefineMotion, prefilter=prefilter, contrasharp=contrasharp, globals=0, pel=1, subpixel=1,\
                                                      hpad=hpad, vpad=vpad)
    c = (sigma_y == 0 && fft_sharp == 0) ?\
                       c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6, sharpen=fft_sharp)
    c = sigma_c == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

#c = c.SincResize(1440, 1080)
    c = filter16 ? c.convertBits(8) : c

    return c.crop(0,0,-dw,-dh)
}

function AdjustFrameRate(clip c, string "preset_p", string "output_p", int "blksize_p")
{
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
#    c = c.Histogram("levels").info
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
    return c
}

function RemoveDirt(clip input, bool "_grey", int "repmode")
{
    new_w = (input.width + 15) / 16
    new_w = new_w * 16
    new_h = (input.height + 15) / 16
    new_h = new_h * 16
    dh = new_h - input.height
    dw = new_w - input.width
    input = input.addBorders(0, 0, dw, dh)

    _grey=default(_grey, false)
	repmode=default(repmode, 16)
	clmode=17
	clensed=Clense(input, grey=_grey, cache=4)
	sbegin = ForwardClense(input, grey=_grey, cache=-1)
	send = BackwardClense(input, grey=_grey, cache=-1)
	alt=Repair(SCSelect(input, sbegin, send, clensed, debug=true), input, mode=repmode, modeU = _grey ? -1 : repmode )
	restore=Repair(clensed, input, mode=repmode, modeU = _grey ? -1 : repmode)
	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, debug=false, noise=10, noisy=12, grey=_grey)
    return corrected.crop(0,0,-dw,-dh)
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode )
}

function gamma(clip c, int "gamma")
{
    return c.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=gamma/1000.0)
}

function color_uv(clip c, int off_u, int off_v)
{
    return c.colorYUV(off_u = off_u, off_v = off_v)
}

/*
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/
