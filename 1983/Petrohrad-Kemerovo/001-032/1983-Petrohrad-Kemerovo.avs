SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

LSMASHVideoSource("F:\Media\video\Super8\Sources\1983\S8.Res2K43.Aspect43In43.Speed18Fps.mov")
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 353, 542, 615, 755, 1066, 1134, 1188, 1445, 1634, 1732, 1807, 1894, 1984, 2010, 2078, 2255, 2338, 2436, 2554, 2653,        # 20
# 2796, 2937, 3162, 3193, 3646, 3707, 3944, 4043, 4210, 4352, 4466, 4546, 4624, 4791, 4865, 4940, 5013, 5168, 5273, 5479,       # 40
# drop (3162, 3192)

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

left = 56
top = 94
right = -104
bot = -100
lo = left
ro = right
to = top
bo = bot
/*
v1 = full.trim(1, 352)
v1 = v1.animate(0, 351, "crop", left - 0, top + 30, right - 30, bot + 8, left + 40, top + 30, right + 10, bot + 8)
v1 = v1.deflickOverlapped(step = 200, width = 600, radius = 5, toward_darkest = true, right2left = true)
v1 = v1.trim(0, -1) +\
     v1.trim(1, 3).deflicker.trim(0, -1) +\
     v1.trim(2, 0)
v1 = v1.correct_left_side(width = 200).correct_left_side(width = 100)
return v1.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v2 = full.trim(353, 541)
v2 = v2.crop(left + 30, top + 40, right + 0, bot + 18)
v2 = v2.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 3) +\
     v2.trim(4, 0)
v2 = v2.trim(0, 3) +\
     v2.trim(3, 8).deflickOverlappedInc(step = 200, width = 600, toward_darkest = true, right2left = true).trim(1, 0) +\
     v2.trim(8, 14).deflickOverlappedInc(step = 200, width = 600, toward_darkest = true, right2left = true).trim(1, 0) +\
     v2.trim(14, 20).deflickOverlappedInc(step = 200, width = 600, toward_darkest = true, right2left = true).trim(1, 0) +\
     v2.trim(20, 25).deflickOverlappedInc(step = 200, width = 600, toward_darkest = true, right2left = true).trim(1, 0) +\
     v2.trim(25, 31).deflickOverlappedInc(step = 200, width = 600, toward_darkest = true, right2left = true).trim(1, 0) +\
     v2.deflickOverlapped(step = 200, width = 600, radius = 6, toward_darkest = true, right2left = true).trim(32, 0)
v2 = v2.correct_left_side(width = 200).correct_left_side(width = 100)
v2_angle = 3.
v2 = v2.rotate(-v2_angle)
#return v2.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v3 = full.trim(542, 614)
v3 = v3.crop(left + 20, top + 30, right + 20, bot + 30)
v3 = v3.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v3.trim(3, 0)
v3 = v3.deflickOverlapped(step = 200, width = 600, radius = 6, toward_darkest = true, right2left = true)
v3 = v3.correct_left_side(width = 200).correct_left_side(width = 100)
#return v3.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v4 = full.trim(615, 754)
v4 = v4.crop(left + 50, top + 10, right - 20, bot - 40)
v4 = v4.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v4.trim(3, 0)
v4 = v4.deflickOverlapped(step = 200, width = 600, radius = 6, toward_darkest = true, right2left = true).trim(0, 118) +\
     v4.trim(119, 0)
v4 = v4.correct_left_side(width = 200).correct_left_side(width = 100)
v4_angle = 3.
v4 = v4.rotate(-v4_angle)
#return v4.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v5 = full.trim(755, 1065)
v5 = v5.crop(left + 20, top + 30, right + 20, bot + 30)
v5 = v5.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v5.trim(3, 0)
v5 = v5.correct_left_side(width = 100)
v5 = v5.deflickOverlapped(step = 200, width = 600, radius = 7, toward_darkest = true, right2left = true)
v5 = v5.correct_left_side(width = 100)
#return v5.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v6 = full.trim(1066, 1133)
v6 = v6.crop(left + 30, top + 30, right + 0, bot + 8)
v6 = v6.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v6.trim(3, 0)
v6 = v6.deflickOverlapped(step = 200, width = 600, radius = 7, toward_darkest = true, right2left = true)
v6 = v6.correct_left_side(width = 200).correct_left_side(width = 100)
v6_angle = 3.
v6 = v6.rotate(-v6_angle)
#return v6.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v7 = full.trim(1134, 1187)
v7 = v7.crop(left + 34, top + 30, right + 20, bot + 20)
v7 = v7.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v7.trim(3, 0)
v7 = v7.deflickOverlapped(step = 200, width = 600, radius = 7, toward_darkest = true, right2left = true)
v7 = v7.correct_left_side(width = 200).correct_left_side(width = 100)
#return v7.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v8 = full.trim(1188, 1444)
v8 = v8.crop(left + 20, top + 28, right + 0, bot + 14)
v8 = v8.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v8.trim(3, 0)
v8df = v8.deflickOverlapped(step = 200, width = 600, radius = 7, toward_darkest = true, right2left = true)
v8 = v8df.trim(0, 71) + v8.trim(72, 140) + v8df.trim(141, 0)
v8 = v8.correct_left_side(width = 200).correct_left_side(width = 100)
v8_angle = 4.
v8 = v8.rotate(-v8_angle)
#return v8.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v9 = full.trim(1445, 1633)
v9 = v9.crop(left + 30, top + 30, right + 30, bot + 30)
v9 = v9.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v9.trim(3, 0)
v9 = v9.deflickOverlapped(step = 200, width = 600, radius = 8, toward_darkest = true, right2left = true)
v9 = v9.correct_left_side(width = 200).correct_left_side(width = 100)
v9_angle = 4.
v9 = v9.rotate(-v9_angle)
#return v9.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v10 = full.trim(1634, 1731)
v10 = v10.crop(left + 50, top + 38, right + 30, bot + 24)
v10 = v10.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v10.trim(3, 0)
v10 = v10.deflickOverlapped(step = 200, width = 600, radius = 8, toward_darkest = true, right2left = true)
v10 = v10.correct_left_side(width = 200).correct_left_side(width = 100)
v10_angle = 4.5
v10 = v10.rotate(-v10_angle)
#return v10.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v11 = full.trim(1732, 1805)
v11 = v11.animate(68, 73, "crop", left + 60, top + 40, right + 30, bot + 18, left + 40, top + 40, right + 10, bot + 18)
v11 = v11.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v11.trim(3, 0)
v11 = v11.deflickOverlapped(step = 200, width = 10600, radius = 8, toward_darkest = true, right2left = true)
v11 = v11.correct_left_side(width = 200).correct_left_side(width = 100)
v11_angle = 5.
v11 = v11.rotate(-v11_angle)
#return v11.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v12 = full.trim(1808, 1893)
v12 = v12.crop(left - 20, top + 36, right - 56, bot + 10)
v12 = v12.deflickOverlapped(step = 200, width = 400, radius = 1, toward_darkest = true, right2left = false)
v12 = v12.correct_left_side(width = 200).correct_left_side(width = 100)
v12_angle = 5.
v12 = v12.rotate(-v12_angle)
#return v12.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v13 = full.trim(1894, 1983)
v13 = v13.crop(left - 36, top + 30, right - 64, bot + 10)
v13 = v13.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v13.trim(3, 0)
v13 = v13.deflickOverlapped(step = 200, width = 400, radius = 1, toward_darkest = true, right2left = false)
v13 = v13.correct_left_side(width = 200).correct_left_side(width = 100)
v13_angle = 3.
v13 = v13.animate(20, 58, "rotate", -5., -2.)
#return v13.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v14 = full.trim(1984, 2009)
v14 = v14.crop(left - 50, top + 20, right - 50, bot + 20)
v14 = v14.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v14.trim(3, 0)
v14 = v14.deflickOverlapped(width = 400, step = 200, radius = 1, toward_darkest = true, right2left = false)
v14 = v14.correct_left_side(width = 200).correct_left_side(width = 100)
#return v14.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v15 = full.trim(2010, 2077)
v15 = v15.crop(left - 36, top + 4, right - 50, bot - 6)
v15 = v15.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v15.trim(3, 0)
v15 = v15.deflickOverlapped(width = 400, step = 200, radius = 1, toward_darkest = true, right2left = false).\
          correct_left_side(width = 200).correct_left_side(width = 100)
v15_angle = 4.
v15 = v15.rotate(-v15_angle)
#return v15.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v16 = full.trim(2078, 2254)
v16 = v16.crop(left - 36, top + 24, right - 56, bot + 10)
v16 = v16.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v16.trim(3, 0)
v16 = v16.deflickOverlapped(width = 400, step = 200, radius = 8, toward_darkest = true, right2left = false)
v16 = v16.correct_left_side(width = 200).correct_left_side(width = 100)
v16_angle = 3.
v16 = v16.rotate(-v16_angle)
#return v16.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v17 = full.trim(2255, 2337)
v17 = v17.crop(left - 46, top + 0, right - 46, bot + 0)
v17 = v17.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v17.trim(3, 0)
v17 = v17.deflickOverlapped(width = 400, step = 200, radius = 8, toward_darkest = true, right2left = false)
#return v17.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v18 = full.trim(2338, 2435)
v18 = v18.crop(left - 26, top + 10, right - 56, bot - 12)
v18 = v18.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v18.trim(3, 0)
v18 = v18.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = false)
v18 = v18.correct_left_side(width = 200).correct_left_side(width = 100)
v18_angle = 3.5
v18 = v18.rotate(-v18_angle)
#return v18.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v19 = full.trim(2436, 2553)
v19 = v19.crop(left - 26, top + 10, right - 56, bot - 12)
v19 = v19.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v19.trim(3, 0)
v19 = v19.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = false)
v19 = v19.correct_left_side(width = 200).correct_left_side(width = 100)
v19_angle = 2.
v19 = v19.rotate(-v19_angle)
#return v19.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v20 = full.trim(2554, 2652)
v20 = v20.crop(left - 26, top + 10, right - 26, bot + 10)
v20 = v20.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v20.trim(3, 0)
v20 = v20.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = false)
v20 = v20.correct_left_side(width = 200).correct_left_side(width = 100)
#return v20.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v21 = full.trim(2653, 2795)
v21 = v21.crop(left - 16, top + 30, right - 56, bot + 2)
v21 = v21.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v21.trim(3, 0)
v21 = v21.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = false)
v21 = v21.correct_left_side(width = 200).correct_left_side(width = 100)
v21_angle = 5.
v21 = v21.rotate(-v21_angle)
#return v21.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v22 = full.trim(2796, 2936)
v22 = v22.crop(left - 10, top + 18, right - 30, bot + 4)
v22 = v22.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v22.trim(3, 0)
v22 = v22.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = false)
v22 = v22.correct_left_side(width = 200).correct_left_side(width = 100)
#return v22.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v23 = full.trim(2937, 3161)
v23 = v23.crop(left + 20, top + 40, right - 40, bot - 2)
v23 = v23.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v23.trim(3, 0)
v23 = v23.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = false)
v23 = v23.correct_left_side(width = 200).correct_left_side(width = 100)
v23_angle = 3.
v23 = v23.animate(70, 120, "rotate", -1., -3.)
#return v23.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v24 = full.trim(3194, 3645)
v24 = v24.crop(left + 0, top + 30, right - 14, bot + 20)
v24_10 = v24.trim(9, -1) + v24.trim(10, 11).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24.trim(12, 0)
v24_09 = v24.trim(8, -1) + v24_10.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_10.trim(2, 0)
v24_08 = v24.trim(7, -1) + v24_09.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_09.trim(2, 0)
v24_07 = v24.trim(6, -1) + v24_08.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_08.trim(2, 0)
v24_06 = v24.trim(5, -1) + v24_07.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_07.trim(2, 0)
v24_05 = v24.trim(4, -1) + v24_06.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_06.trim(2, 0)
v24_04 = v24.trim(3, -1) + v24_05.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_05.trim(2, 0)
v24_03 = v24.trim(2, -1) + v24_04.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_04.trim(2, 0)
v24_02 = v24.trim(1, -1) + v24_03.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_03.trim(2, 0)
v24_01 = v24.trim(0, -1) + v24_02.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_02.trim(2, 0)
v24 = v24_01.trim(0, 1).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false) + v24_01.trim(2, 0)
v24 = v24.trim(0, 27) +\
      v24.trim(28, 38).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(39, 55) +\
      v24.trim(56, 66).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(67, 82) +\
      v24.trim(83, 93).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(94, 110) +\
      v24.trim(111, 122).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(123, 138) +\
      v24.trim(139, 150).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(151, 166) +\
      v24.trim(167, 171).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(171, 178).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
      v24.trim(179, 195) +\
      v24.trim(196, 207).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(208, 224) +\
      v24.trim(225, 236).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = false) +\
      v24.trim(237, 252) +\
      v24.trim(253, 264).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(265, 280) +\
      v24.trim(281, 293).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(294, 310) +\
      v24.trim(311, 323).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(324, 339) +\
      v24.trim(340, 352).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(353, 369) +\
      v24.trim(370, 383).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(384, 398) +\
      v24.trim(399, 413).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(414, 427) +\
      v24.trim(428, 442).deflickOverlappedInc(width = 600, step = 200, toward_darkest = true, right2left = true) +\
      v24.trim(443, 0)
v24 = v24.correct_left_side(width = 200).correct_left_side(width = 100)
v24_angle = 5.
v24 = v24.rotate(-v24_angle)
#return v24.adjustBorders.prefetch

v25 = full.trim(3646, 3706)
v25 = v25.crop(left + 0, top + 10, right + 0, bot + 10)
v25 = v25.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v25.trim(3, 0)
v25 = v25.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = true)
v25 = v25.correct_left_side(width = 200).correct_left_side(width = 100)
v25_angle = 5.
v25 = v25.rotate(-v25_angle)
#return v25.adjustBorders.prefetch

v26 = full.trim(3707, 3943)
v26 = v26.crop(left + 20, top + 44, right - 20, bot + 16)
v26 = v26.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v26.trim(3, 0)
v26 = v26.deflickOverlapped(width = 600, step = 200, radius = 16, toward_darkest = true, right2left = true)
v26 = v26.correct_left_side(width = 200).correct_left_side(width = 100)
v26_angle = 3.
v26 = v26.rotate(-v26_angle)
#return v26.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v27 = full.trim(3944, 4042)
v27 = v27.crop(left - 20, top + 20, right - 20, bot + 20)
v27 = v27.correct_left_side(width = 200).correct_left_side(width = 100)
v27_angle = 5.
v27 = v27.rotate(-v27_angle)
#return v27.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo
*/
v28 = full.trim(4043, 4209)
v28 = v28.crop(left - 10, top + 20, right - 10, bot + 20)
v28 = v28.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v28.trim(3, 0)
#v28 = v28.deflickOverlapped(width = 10600, step = 200, radius = 7, toward_darkest = false, right2left = false)
v28 = v28.correct_left_side(width = 200).correct_left_side(width = 100)
v28_angle = 2.5
v28 = v28.rotate(-v28_angle)
#return v28.adjustBorders.prefetch
/*
v29 = full.trim(4210, 4351)
v29 = v29.crop(left - 10, top + 20, right - 10, bot + 20)
v29 = v29.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v29.trim(3, 0)
#v29 = v29.deflickOverlapped(width = 10600, step = 200, radius = 7, toward_darkest = false, right2left = false)
v29 = v29.correct_left_side(width = 200).correct_left_side(width = 100)
v29_angle = 3.5
v29 = v29.rotate(-v29_angle)
#return v29.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v30 = full.trim(4352, 4465)
v30 = v30.crop(left - 10, top + 20, right - 30, bot + 6)
v30 = v30.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v30.trim(3, 0)
#v30 = v30.deflickOverlapped(width = 10600, step = 200, radius = 7, toward_darkest = false, right2left = false)
v30 = v30.correct_left_side(width = 200).correct_left_side(width = 100)
v30_angle = 5.
v30 = v30.rotate(-v30_angle)
#return v30.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v31 = full.trim(4466, 4545)
v31 = v31.crop(left - 10, top + 20, right - 10, bot + 20)
v31 = v31.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v31.trim(3, 0)
v31_angle = 3.
v31 = v31.rotate(-v31_angle)
#return v31.adjustBorders.prefetch

v32 = full.trim(4546, 4623)
v32 = v32.crop(left - 10, top + 10, right - 10, bot + 10)
v32 = v32.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v32.trim(3, 0)
v32 = v32.deflickOverlapped(width = 10600, step = 200, radius = 7, toward_darkest = false, right2left = false)
v32 = v32.correct_left_side(width = 200).correct_left_side(width = 100)
v32_angle = 2.
v32 = v32.rotate(-v32_angle)
#return v32.adjustBorders.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 1

v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
v1 = v1.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v1 = v1.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v1 = v1.colorYUV(off_u = +6, off_v = -4)
v1 = v1.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate

v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
v2 = v2.colorYUV(off_y = -16)
b_ex = undefined
v2 = v2.AdjustColor(ou = +12, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.1, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v2 = v2.colorYUV(off_u = +2, off_v = -2)
v2 = v2.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate

v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
v3 = v3.colorYUV(off_y = -20)
b_ex = undefined
v3 = v3.AdjustColor(ou = +4, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v3 = v3.colorYUV(off_u = +6, off_v = -6)
v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate

v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
v4 = v4.animate(110, 130, "offset_y", -20, -12)
b_ex = undefined
v4 = v4.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.1, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v4 = v4.colorYUV(off_u = +6, off_v = -6)
v4 = v4.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate

v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").ConvertToYV24()
v5 = v5.colorYUV(off_y = -12)
b_ex = undefined
v5 = v5.AdjustColor(ou = +8, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v5 = v5.colorYUV(off_u = +6, off_v = -6)
v5 = v5.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
v5 = v5.add_blank_audio
return v5.prefetch
#adjustframerate

v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
b_ex = undefined
v6 = v6.AdjustColor(ou = +12, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v6 = v6.colorYUV(off_u = +6, off_v = -6)
v6 = v6.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate

v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").ConvertToYV24()
b_ex = undefined
v7 = v7.AdjustColor(ou = +12, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v7 = v7.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
v7 = v7.add_blank_audio
return v7.prefetch
#adjustframerate

v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").ConvertToYV24()
b_ex = undefined
v8 = v8.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v8 = v8.colorYUV(off_u = +2, off_v = -4)
v8 = v8.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
v8 = v8.add_blank_audio
return v8.prefetch
#adjustframerate

v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
v9 = v9.colorYUV(off_y = -16)
b_ex = undefined
v9 = v9.AdjustColor(ou = +12, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.5, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v9 = v9.colorYUV(off_u = +6, off_v = -6)
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate

v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
v10 = v10.colorYUV(off_y = -20)
b_ex = undefined
v10 = v10.AdjustColor(ou = +12, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v10 = v10.colorYUV(off_u = +4, off_v = -4)
v10 = v10.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate

v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
b_ex = undefined
v11 = v11.AdjustColor(ou = +6, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v11 = v11.colorYUV(off_u = +6, off_v = -6)
v11 = v11.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate

v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").ConvertToYV24()
v12 = v12.colorYUV(off_y = -20)
b_ex = undefined
v12 = v12.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
v12 = v12.add_blank_audio
return v12.prefetch
#adjustframerate

v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
v13 = v13.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v13 = v13.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v13 = v13.colorYUV(off_u = +6, off_v = -6)
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate

v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").ConvertToYV24()
v14 = v14.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v14 = v14.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v14 = v14.colorYUV(off_u = +6, off_v = -6)
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
v14 = v14.add_blank_audio
return v14.prefetch
#adjustframerate

v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
v15 = v15.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v15 = v15.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v15 = v15.colorYUV(off_u = +6, off_v = -6)
v15 = v15.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate

v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
v16 = v16.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v16 = v16.AdjustColor(ou = +8, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v16 = v16.colorYUV(off_u = +6, off_v = -6)
v16 = v16.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate

v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
v17 = v17.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v17 = v17.AdjustColor(ou = +2, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v17 = v17.colorYUV(off_u = +6, off_v = -6)
v17 = v17.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate

v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").ConvertToYV24()
v18 = v18.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v18 = v18.AdjustColor(ou = +6, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v18 = v18.colorYUV(off_u = +6, off_v = -6)
v18 = v18.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
v18 = v18.add_blank_audio
return v18.prefetch
#adjustframerate

v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
v19 = v19.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v19 = v19.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v19 = v19.colorYUV(off_u = +2, off_v = -2)
v19 = v19.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.1)#, autolevel=false, input_low=16, input_high=235)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate

v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
v20 = v20.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v20 = v20.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v20 = v20.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.1)#, autolevel=false, input_low=16, input_high=235)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate

v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").ConvertToYV24()
b_ex = undefined
v21 = v21.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v21 = v21.colorYUV(off_u = +8, off_v = -8)
v21 = v21.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
v21 = v21.add_blank_audio
return v21.prefetch
#adjustframerate

v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
v22 = v22.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v22 = v22.AdjustColor(ou = +6, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v22 = v22.colorYUV(off_u = +6, off_v = -6)
v22 = v22.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate

v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
b_ex = undefined
v23 = v23.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v23 = v23.colorYUV(off_u = +6, off_v = -6)
v23 = v23.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate

v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").ConvertToYV24()
v24 = v24.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v24 = v24.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v24 = v24.colorYUV(off_u = +6, off_v = -6)
v24 = v24.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
v24 = v24.add_blank_audio
return v24.prefetch
#adjustframerate

v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
b_ex = undefined
v25 = v25.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v25 = v25.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate

v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
b_ex = undefined
v26 = v26.AdjustColor(ou = +8, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v26 = v26.colorYUV(off_u = +6, off_v = -6)
v26 = v26.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate

v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
b_ex = undefined
v27 = v27.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v27 = v27.colorYUV(off_u = +2, off_v = -2)
v27 = v27.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate

v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
v28 = v28.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v28 = v28.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v28 = v28.colorYUV(off_u = +6, off_v = -6)
v28 = v28.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate

v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
b_ex = undefined
v29 = v29.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v29 = v29.colorYUV(off_u = +6, off_v = -6)
v29 = v29.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate

v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").ConvertToYV24()
b_ex = undefined
v30 = v30.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v30 = v30.colorYUV(off_u = +6, off_v = -6)
v30 = v30.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
v30 = v30.add_blank_audio
return v30.prefetch
#adjustframerate

v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
b_ex = undefined
v31 = v31.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v31 = v31.colorYUV(off_u = -2, off_v = +2)
v31 = v31.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate

v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
#v32 = v32.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v32 = v32.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v32 = v32.colorYUV(off_u = -2, off_v = +2)
v32 = v32.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.02, gamma=1.3)#, autolevel=false, input_low=16, input_high=235)
#return v32.hist_levels.prefetch
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate

#******

*/