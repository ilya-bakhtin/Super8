SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("M:\Media\video\Super8\1982-skola\N8.Res2K43.Aspect43In43.Speed16Fps.mov")
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

# 0, 272, 503, 631, 635, 1046, 1227, 1602, 2046, 2142, 2201, 2236, 2271, 2365, 2690, 2723, 2802, 2990, 3080, 3099, 3147, # 21
# 3173, 3344, 3402, 3487, 3572, 3653, 3709, 3797, 3886, 3983, 4020, 4078, 4130, 4183, 4276, 4295, 4349, 4394, 4468, 4504, # 41, 20 per line
# 4556, 4599, 4661, 4710, 4764, 4879, 4914, 4941, 4981, 5028, 5055, 5112, 5226, 5270, 5336, 5402, 5487, 5542, 5597, 5655, # 61
# 5720, 5845, 5921,
#
# skip (631, 634)

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

v1 = full.trim(1, 271)
v1 = v1.crop(left - 10, top + 20, right - 108, bot + 6)

v2 = full.trim(272, 502)
v2 = v2.crop(left - 10, top + 20, right - 108, bot + 6)

v3 = full.trim(503, 630)
v3 = v3.animate(22, 27, "crop", left - 10, top + 20, right - 108, bot + 6, left + 0, top + 20, right - 98, bot + 6).trim(0, 27) +\
     v3.animate(34, 36, "crop", left + 0, top + 20, right - 98, bot + 6, left - 10, top + 20, right - 108, bot + 6).trim(28, 36) +\
     v3.animate(48, 51, "crop", left - 10, top + 20, right - 108, bot + 6, left + 0, top + 20, right - 98, bot + 6).trim(37, 50) +\
     v3.animate(51, 52, "crop", left + 0, top + 20, right - 98, bot + 6, left - 10, top + 20, right - 108, bot + 6).trim(51, 52) +\
     v3.animate(60, 71, "crop", left - 10, top + 20, right - 108, bot + 6, left + 30, top + 20, right - 68, bot + 6).trim(53, 0)

v4 = full.trim(635, 1045)
v4 = v4.animate(64, 66, "crop", left + 40, top + 20, right - 58, bot + 6, left + 48, top + 20, right - 50, bot + 6).trim(0, 66) +\
     v4.animate(67, 73, "crop", left + 48, top + 20, right - 50, bot + 6, left + 40, top + 20, right - 58, bot + 6).trim(67, 380) +\
     v4.animate(381, 383, "crop", left + 40, top + 20, right - 58, bot + 6, left + 50, top + 20, right - 48, bot + 6).trim(381, 383) +\
     v4.animate(384, 387, "crop", left + 50, top + 20, right - 48, bot + 6, left + 40, top + 20, right - 58, bot + 6).trim(384, 0)

v5 = full.trim(1046, 1226)
v5 = v5.animate(46, 48, "crop", left + 40, top + 20, right - 58, bot + 6, left + 48, top + 20, right - 50, bot + 6).trim(0, 48) +\
     v5.animate(48, 52, "crop", left + 48, top + 20, right - 50, bot + 6, left + 40, top + 20, right - 58, bot + 6).trim(49, 52) +\
     v5.animate(54, 71, "crop", left + 40, top + 20, right - 58, bot + 6, left + 10, top + 20, right - 88, bot + 6).trim(53, 71) +\
     v5.animate(78, 91, "crop", left + 10, top + 20, right - 88, bot + 6, left + 40, top + 20, right - 58, bot + 6).trim(72, 91) +\
     v5.animate(102, 104, "crop", left + 40, top + 20, right - 58, bot + 6, left + 48, top + 20, right - 50, bot + 6).trim(92, 104) +\
     v5.animate(107, 109, "crop", left + 48, top + 20, right - 50, bot + 6, left + 40, top + 20, right - 58, bot + 6).trim(105, 0)

v6 = full.trim(1227, 1601)
v6 = v6.animate(43, 48, "crop", left + 40, top + 20, right - 58, bot + 6, left + 20, top + 20, right - 78, bot + 6).trim(0, 48) +\
     v6.animate(53, 55, "crop", left + 20, top + 20, right - 78, bot + 6, left + 30, top + 20, right - 68, bot + 6).trim(49, 55) +\
     v6.animate(55, 56, "crop", left + 30, top + 20, right - 68, bot + 6, left + 20, top + 20, right - 78, bot + 6).trim(56, 102) +\
     v6.animate(103, 114, "crop", left + 20, top + 20, right - 78, bot + 6, left - 20, top + 20, right - 118, bot + 6).trim(103, 114) +\
     v6.animate(114, 150, "crop", left - 20, top + 20, right - 118, bot + 6, left + 20, top + 20, right - 78, bot + 6).trim(115, 150) +\
     v6.animate(154, 175, "crop", left + 20, top + 20, right - 78, bot + 6, left + 40, top + 20, right - 58, bot + 6).trim(151, 317) +\
     v6.animate(318, 319, "crop", left + 40, top + 20, right - 58, bot + 6, left + 48, top + 20, right - 50, bot + 6).trim(318, 319) +\
     v6.animate(319, 320, "crop", left + 48, top + 20, right - 50, bot + 6, left + 40, top + 20, right - 58, bot + 6).trim(320, 351) +\
     v6.animate(352, 354, "crop", left + 40, top + 20, right - 58, bot + 6, left + 18, top + 20, right - 80, bot + 6).trim(352, 354) +\
     v6.animate(356, 360, "crop", left + 18, top + 20, right - 80, bot + 6, left + 40, top + 20, right - 58, bot + 6).trim(355, 366) +\
     v6.animate(367, 371, "crop", left + 40, top + 20, right - 58, bot + 6, left + 18, top + 20, right - 80, bot + 6).trim(367, 0)

v7 = full.trim(1603, 2045)
v7 = v7.animate(0, 7, "crop", left + 18, top + 20, right - 80, bot + 6, left + 46, top + 20, right - 52, bot + 6).trim(0, 7) +\
     v7.animate(50, 71, "crop", left + 46, top + 20, right - 52, bot + 6, left + 00, top + 20, right - 98, bot + 6).trim(8, 71) +\
     v7.animate(71, 85, "crop", left + 00, top + 20, right - 98, bot + 6, left + 20, top + 20, right - 78, bot + 6).trim(72, 85) +\
     v7.animate(92, 95, "crop", left + 20, top + 20, right - 78, bot + 6, left + 30, top + 20, right - 68, bot + 6).trim(86, 95) +\
     v7.animate(95, 101, "crop", left + 30, top + 20, right - 68, bot + 6, left + 10, top + 20, right - 88, bot + 6).trim(96, 101) +\
     v7.animate(101, 107, "crop", left + 10, top + 20, right - 88, bot + 6, left + 20, top + 20, right - 78, bot + 6).trim(102, 119) +\
     v7.animate(120, 122, "crop", left + 20, top + 20, right - 78, bot + 6, left + 48, top + 20, right - 50, bot + 6).trim(120, 162) +\
     v7.animate(162, 164, "crop", left + 48, top + 20, right - 50, bot + 6, left + 48, top + 20, right - 50, bot + 6).trim(163, 0)

v8 = full.trim(2046, 2141)
v8 = v8.crop(left + 48, top + 20, right - 50, bot + 6)
v8 = v8.trim(0, 34) + v8.trim(38, 0)

v9 = full.trim(2143, 2200)
v9 = v9.animate(0, 4, "crop", left + 98, top + 20, right - 00, bot + 6, left + 48, top + 20, right - 50, bot + 6).trim(0, 4) +\
     v9.animate(6, 7, "crop", left + 48, top + 20, right - 50, bot + 6, left + 18, top + 20, right - 80, bot + 6).trim(5, 0)

v10 = full.trim(2201, 2235)
v10 = v10.animate(0, 17, "crop", left + 8, top + 20, right - 90, bot + 6, left + 38, top + 20, right - 60, bot + 6).trim(0, 17) +\
      v10.animate(24, 27, "crop", left + 38, top + 20, right - 60, bot + 6, left + 28, top + 20, right - 70, bot + 6).trim(18, 0)

v11 = full.trim(2237, 2270)
v11 = v11.crop(left + 18, top + 40, right - 80, bot + 26)

v12 = full.trim(2271, 2364)
v12 = v12.crop(left + 18, top + 44, right - 80, bot + 30)

v13 = full.trim(2365, 2689)
v13 = v13.animate(212, 218, "crop", left + 8, top + 34, right - 102, bot + 10, left + 30, top + 34, right - 80, bot + 10).trim(0, 218) +\
      v13.animate(247, 274, "crop", left + 30, top + 34, right - 80, bot + 10, left - 2, top + 34, right - 112, bot + 10).trim(219, 292) +\
      v13.animate(293, 298, "crop", left - 2, top + 34, right - 112, bot + 10, left + 30, top + 34, right - 80, bot + 10).trim(293, 298) +\
      v13.animate(302, 308, "crop", left + 30, top + 34, right - 80, bot + 10, left - 2, top + 34, right - 112, bot + 10).trim(299, 0)

v14 = full.trim(2691, 2722)
v14 = v14.crop(left + 0, top + 24, right - 98, bot + 10)

v15 = full.trim(2723, 2801)
v15 = v15.animate(36, 41, "crop", left + 0, top + 24, right - 98, bot + 10, left + 20, top + 24, right - 78, bot + 10).trim(0, 41) +\
      v15.animate(41, 44, "crop", left + 20, top + 24, right - 78, bot + 10, left + 0, top + 24, right - 98, bot + 10).trim(42, 0)

v16 = full.trim(2802, 2989)
v16 = v16.crop(left + 8, top + 24, right - 90, bot + 10)

v17 = full.trim(2990, 3079)
v17 = v17.crop(left + 8, top + 24, right - 90, bot + 10)

v18 = full.trim(3080, 3098)
v18 = v18.crop(left + 8, top + 24, right - 90, bot + 10)

v19 = full.trim(3099, 3146)
v19 = v19.crop(left + 0, top + 24, right - 98, bot + 10)

v20 = full.trim(3147, 3172)
v20 = v20.crop(left + 10, top + 24, right - 88, bot + 10)

v21 = full.trim(3173, 3343)
v21 = v21.crop(left + 6, top + 24, right - 92, bot + 10)

v22 = full.trim(3344, 3401)
v22 = v22.crop(left + 6, top + 24, right - 92, bot + 10)

v23 = full.trim(3402, 3486)
v23 = v23.crop(left + 6, top + 24, right - 92, bot + 10)

v24 = full.trim(3487, 3571)
v24 = v24.crop(left + 6, top + 24, right - 92, bot + 10)

v25 = full.trim(3572, 3652)
v25 = v25.crop(left + 6, top + 24, right - 92, bot + 10)

v26 = full.trim(3653, 3708)
v26 = v26.crop(left + 6, top + 24, right - 92, bot + 10)

v27 = full.trim(3709, 3796)
v27 = v27.crop(left + 16, top + 24, right - 82, bot + 10)

v28 = full.trim(3797, 3885)
v28 = v28.crop(left + 16, top + 24, right - 82, bot + 10)

v29 = full.trim(3886, 3982)
v29 = v29.crop(left + 16, top + 24, right - 82, bot + 10)

v30 = full.trim(3983, 4019)
v30 = v30.crop(left + 16, top + 24, right - 82, bot + 10)

v31 = full.trim(4020, 4077)
v31 = v31.crop(left + 16, top + 24, right - 82, bot + 10)

v32 = full.trim(4078, 4129)
v32 = v32.crop(left + 16, top + 24, right - 82, bot + 10)

#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).info.prefetch
#return v32.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 1

v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").extractY.ConvertToYV12()
v1 = v1.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v1 = v1.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v1.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
return v1
#adjustframerate

v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").extractY.ConvertToYV12()
v2 = v2.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v2 = v2.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v2.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
return v2
#adjustframerate

v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").extractY.ConvertToYV12()
v3 = v3.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v3 = v3.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v3.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
return v3
#adjustframerate

v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").extractY.ConvertToYV12()
v4 = v4.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v4 = v4.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v4.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
return v4
#adjustframerate

v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").extractY.ConvertToYV12()
v5 = v5.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v5 = v5.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v5.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.5).trim(1, 0)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
return v5
#adjustframerate

v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").extractY.ConvertToYV12()
v6 = v6.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v6 = v6.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v6.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
return v6
#adjustframerate

v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").extractY.ConvertToYV12()
v7 = v7.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v7 = v7.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.5)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
return v7
#adjustframerate

v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").extractY.ConvertToYV12()
v8 = v8.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v8 = v8.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v8.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
return v8
#adjustframerate

v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").extractY.ConvertToYV12()
v9 = v9.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v9 = v9.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
     v9.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
return v9
#adjustframerate

v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").extractY.ConvertToYV12()
v10 = v10.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v10 = v10.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v10.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=2).trim(1, 0)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
return v10
#adjustframerate

v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").extractY.ConvertToYV12()
v11 = v11.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v11 = v11.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
return v11
#adjustframerate

v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").extractY.ConvertToYV12()
v12 = v12.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v12 = v12.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v12.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.1).trim(1, 0)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
return v12
#adjustframerate

v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").extractY.ConvertToYV12()
v13 = v13.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v13 = v13.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v13.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.1).trim(1, 0)
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
return v13
#adjustframerate

v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").extractY.ConvertToYV12()
v14 = v14.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v14 = v14.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v14.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
return v14
#adjustframerate

v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").extractY.ConvertToYV12()
v15 = v15.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v15 = v15.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v15.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=2).trim(1, 0)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
return v15
#adjustframerate

v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").extractY.ConvertToYV12()
v16 = v16.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v16 = v16.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v16.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
return v16
#adjustframerate

v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").extractY.ConvertToYV12()
v17 = v17.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v17 = v17.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v17.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
return v17
#adjustframerate

v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").extractY.ConvertToYV12()
v18 = v18.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v18 = v18.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v18.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.5).trim(1, 0)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
return v18
#adjustframerate

v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").extractY.ConvertToYV12()
v19 = v19.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v19 = v19.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v19.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.5).trim(1, 0)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
return v19
#adjustframerate

v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").extractY.ConvertToYV12()
v20 = v20.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v20 = v20.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(0, -1) +\
      v20.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=2).trim(1, 0)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
return v20
#adjustframerate

v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").extractY.ConvertToYV12()
v21 = v21.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v21 = v21.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v21.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
return v21
#adjustframerate

v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").extractY.ConvertToYV12()
v22 = v22.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v22 = v22.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v22.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
return v22
#adjustframerate

v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").extractY.ConvertToYV12()
v23 = v23.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v23 = v23.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v23.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
return v23
#adjustframerate

v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").extractY.ConvertToYV12()
v24 = v24.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v24 = v24.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v24.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=2).trim(1, 0)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
return v24
#adjustframerate

v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").extractY.ConvertToYV12()
v25 = v25.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v25 = v25.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v25.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
return v25
#adjustframerate

v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").extractY.ConvertToYV12()
v26 = v26.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v26 = v26.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v26.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
return v26
#adjustframerate

v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").extractY.ConvertToYV12()
v27 = v27.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v27 = v27.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v27.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
return v27
#adjustframerate

v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").extractY.ConvertToYV12()
v28 = v28.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v28 = v28.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v28.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
return v28
#adjustframerate

v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").extractY.ConvertToYV12()
v29 = v29.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v29 = v29.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v29.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
return v29
#adjustframerate

v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").extractY.ConvertToYV12()
v30 = v30.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v30 = v30.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v30.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
return v30
#adjustframerate

v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").extractY.ConvertToYV12()
v31 = v31.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v31 = v31.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v31.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.8).trim(1, 0)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
return v31
#adjustframerate

v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").extractY.ConvertToYV12()
v32 = v32.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v32 = v32.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v32.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
#return v32.histogram("levels")
return v32
#adjustframerate

#******

*/

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
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode ).crop(0,0,-dw,-dh)
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
