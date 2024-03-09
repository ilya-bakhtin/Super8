SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

LSMASHVideoSource("F:Media\video\Super8\Sources\1989\1 část - Res2K43.Aspect43In43.Speed18Fps.mov")
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 121, 270, 495, 686, 915, 1017, 1104, 1481, 1588, 1930, 2311, 2477, 2715, 2995, 3101, 3401, 3772, 3935, 4326, 4466,         # 20
# 4614, 4818, 5062, 5115, 5448, 5653, 5921, 6341, 6775, 7014, 7125, 7479, 7586, 7589, 8065, 8585, 9114, 9187, 9384, 9610,       # 40

global src = last
#return last.autolevels(minRng=0, filterRadius=0, border_l = 200, border_t = 100, border_r = 200, border_b = 100, ignore_low = 0.03).colorYUV(autowhite=true, autogain=true)
#return full

left = 56
top = 94
right = -104
bot = -100
lo = left
ro = right
to = top
bo = bot

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v1 = full.trim(0, 120)
v1 = v1.trim(0, 8) + v1.trim(10, 0)
v1_33 = v1.trim(33, -1).crop(0, 550, 0, 0).stackVertical(v1.trim(34, -1).crop(0, 126, -20, 676 - v1.height).addBorders(20, 0, 0, 0))
v1_34 = v1.trim(34, -1).crop(0, 550, 0, 0).stackVertical(v1.trim(35, -1).crop(0, 214, -20, 764 - v1.height).addBorders(20, 0, 0, 0))
v1 = v1.trim(0, 32) + v1_33 + v1_34 + v1.trim(36, 45) + v1.trim(47, 0)
#v1 = v1.crop(left + 30, top + 20, right + 30, bot + 20)
v1 = v1.animate(0, 10, "crop", left + 60, 0, right + 60, 0, left + 40, 0, right + 40, 0)
v1 = v1.trim(0, 3).crop(0, top + 20, 0, bot + 20) +\
     v1.trim(4, 5).crop(0, top + 40, 0, bot + 40) +\
     v1.trim(6, 6).crop(0, top + 20, 0, bot + 20) +\
     v1.trim(7, 7).crop(0, top + 00, 0, bot + 00) +\
     v1.trim(8, 39).crop(0, top + 20, 0, bot + 20) +\
     v1.animate(40, 42, "crop", 0, top + 20, 0, bot + 20, 0, top - 40, 0, bot - 40).trim(40, 42) +\
     v1.animate(42, 48, "crop", 0, top - 40, 0, bot - 40, 0, top + 20, 0, bot + 20).trim(43, 57) +\
     v1.trim(58, 59).crop(0, top + 0, 0, bot + 0) +\
     v1.trim(60, 72).crop(0, top + 20, 0, bot + 20) +\
     v1.trim(73, 75).crop(0, top + 0, 0, bot + 0) +\
     v1.trim(76, 0).crop(0, top + 20, 0, bot + 20)
v1 = v1.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v1.trim(3, 0)
#v1 = v1.deflickOverlapped(width = 600, step = 200, radius = 3, toward_darkest = true, right2left = true)
v1 = v1.correct_left_side(width = 400).correct_left_side(width = 100)
#v1_angle = 2.
#v1 = v1.rotate(-v1_angle)
#return v1.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v2 = full.trim(121, 269)
v2 = v2.crop(left + 30, top + 0, right + 30, bot + 0)
v2 = v2.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v2.trim(3, 0)
#return v2.adjustBorders.hist_levels.prefetch
left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v3 = full.trim(270, 494)
v3 = v3.crop(left + 30, top + 0, right + 30, bot + 0)
v3 = v3.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v3.trim(3, 0)
#return v3.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v4 = full.trim(495, 685)
v4 = v4.crop(left + 30, top + 10, right + 30, bot + 10)
v4 = v4.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v4.trim(3, 0)
#return v4.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

v5 = full.trim(686, 914)
v5 = v5.crop(left + 30, top + 10, right + 30, bot + 10)
v5 = v5.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v5.trim(3, 0)
#return v5.adjustBorders.hist_levels.prefetch

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v6 = full.trim(915, 1016)
v6 = v6.crop(left + 30, top + 10, right + 30, bot + 10)
v6 = v6.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v6.trim(3, 0)
#return v6.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v7 = full.trim(1017, 1103)
v7 = v7.crop(left + 30, top + 10, right + 30, bot + 10)
v7 = v7.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v7.trim(3, 0)
#return v7.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v8 = full.trim(1104, 1480)
#v8 = v8.crop(left + 30, top + 10, right + 30, bot + 10)
v8 = v8.crop(left + 30, top - 10, right + 30, bot - 10).trim(0, 2) +\
     v8.crop(left + 30, top + 00, right + 30, bot + 00).trim(3, 3) +\
     v8.crop(left + 30, top - 30, right + 30, bot - 30).trim(4, 4) +\
     v8.crop(left + 30, top - 20, right + 30, bot - 20).trim(5, 10) +\
     v8.crop(left + 30, top - 00, right + 30, bot - 00).trim(11, 59) +\
     v8.crop(left + 30, top - 10, right + 30, bot - 10).trim(60, 60) +\
     v8.crop(left + 30, top - 00, right + 30, bot - 00).trim(61, 111) +\
     v8.crop(left + 30, top - 20, right + 30, bot - 20).trim(112, 113) +\
     v8.crop(left + 30, top - 00, right + 30, bot - 00).trim(114, 0) #+\
v8 = v8.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v8.trim(3, 0)
#return v8.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v9 = full.trim(1481, 1587)
v9 = v9.crop(left + 30, top + 10, right + 30, bot + 10)
v9 = v9.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v9.trim(3, 0)
v9 = v9.trim(0, 88) +\
     v9.deflickOverlapped(step = 100, radius = 10, toward_darkest = true, right2left = false).trim(89, 0)
#return v9.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v10 = full.trim(1588, 1929)
#v10 = v10.crop(left + 20, top - 30, right + 20, bot - 30)
v10 = v10.trim(0, 155).crop(left + 20, top - 30, right + 20, bot - 30) +\
      v10.trim(156, 157).crop(left + 20, top - 50, right + 20, bot - 50) +\
      v10.trim(158, 164).crop(left + 20, top - 30, right + 20, bot - 30) +\
      v10.trim(165, 165).crop(left + 20, top - 50, right + 20, bot - 50) +\
      v10.trim(166, 267).crop(left + 20, top - 30, right + 20, bot - 30) +\
      v10.trim(268, 269).crop(left + 20, top - 50, right + 20, bot - 50) +\
      v10.animate(270, 273, "crop", left + 20, top - 30, right + 20, bot - 30, left + 20, top - 70, right + 20, bot - 70).trim(270, 273) +\
      v10.animate(273, 288, "crop", left + 20, top - 70, right + 20, bot - 70, left + 20, top - 50, right + 20, bot - 50).trim(274, 288) +\
      v10.animate(288, 291, "crop", left + 20, top - 50, right + 20, bot - 50, left + 20, top - 30, right + 20, bot - 30).trim(289, 0)
#v10 = v10.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#     v10.trim(3, 0)
v10 = v10.addBorders(2,2,2,2).crop(2,2,-2,-2)
#return v10.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v11 = full.trim(1930, 2310)
v11 = v11.crop(left + 20, top - 30, right + 20, bot - 30)
v11 = v11.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v11.trim(3, 0)
#return v11.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v12 = full.trim(2311, 2476)
v12 = v12.crop(left + 20, top - 30, right + 20, bot - 30)
v12 = v12.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v12.trim(3, v12.frameCount - 2) +\
      v12.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v12.frameCount - 1, -1)
#return v12.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v13 = full.trim(2477, 2714)
v13 = v13.crop(left + 20, top - 30, right + 20, bot - 30)
v13 = v13.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v13.trim(3, 0)
#return v13.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v14 = full.trim(2715, 2994)
v14 = v14.crop(left + 20, top - 30, right + 20, bot - 30)
v14 = v14.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v14.trim(3, 0)
#return v14.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v15 = full.trim(2995, 3100)
#v15 = v15.crop(left + 20, top - 30, right + 20, bot - 30)
v15 = v15.animate(98, 104, "crop", left + 20, top - 30, right + 20, bot - 30, left + 20, top + 40, right + 20, bot + 40)
v15 = v15.addBorders(2,2,2,2).crop(2,2,-2,-2)
v15 = v15.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v15.trim(3, 0)
#return v15.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v16 = full.trim(3102, 3400)
v16 = v16.crop(left + 30, top - 10, right + 30, bot - 10)
v16 = v16.deflickOverlapped(step = 100, radius = 2, toward_darkest = true, right2left = false).trim(0, 3) +\
      v16.trim(4, 0)
v16 = v16.trim(0, 38).deFlickOverlappedInc(width = 10000, step = 200, toward_darkest = true, right2left = false) +\
      v16.trim(39, 43) +\
      v16.trim(44, 68).deFlickOverlappedInc(width = 10000, step = 200, toward_darkest = true, right2left = false) +\
      v16.trim(69, 91) +\
      v16.trim(92, 100).deFlickOverlappedInc(width = 10000, step = 200, toward_darkest = true, right2left = false) +\
      v16.trim(101, 0)
#return v16.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v17 = full.trim(3401, 3771)
v17 = v17.crop(left + 30, top - 10, right + 30, bot - 10)
v17 = v17.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v17.trim(3, 0)
#return v17.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v18 = full.trim(3772, 3934)
v18 = v18.crop(left + 30, top - 10, right + 30, bot - 10)
v18 = v18.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v18.trim(3, 0)
#return v18.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v19 = full.trim(3935, 4325)
v19 = v19.crop(left + 50, top - 30, right + 50, bot - 30)
v19 = v19.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v19.trim(3, 0)
#return v19.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v20 = full.trim(4326, 4465)
v20_27 = v20.trim(27, -1).crop(0, 530, 0, -20).colorYUV(off_y=10).stackVertical(v20.trim(28, -1).crop(0, 146, -20, 696 - v20.height).addBorders(20, 0, 0, 0).colorYUV(off_y=-10))
v20_28 = v20.trim(28, -1).crop(0, 550, 0, -00).colorYUV(off_y=10).stackVertical(v20.trim(29, -1).crop(0,  80, -16, 630 - v20.height).addBorders(16, 0, 0, 0).colorYUV(off_y=-10))
v20_29 = v20.trim(29, -1).crop(0, 510, 0, -00).colorYUV(off_y=10).stackVertical(v20.trim(30, -1).crop(0, 140, -16, 650 - v20.height).addBorders(16, 0, 0, 0).colorYUV(off_y=-10))
v20_30 = v20.trim(30, -1).crop(0, 510, 0, -00).colorYUV(off_y=10).stackVertical(v20.trim(31, -1).crop(0, 190, -10, 700 - v20.height).addBorders(10, 0, 0, 0).colorYUV(off_y=-10))
v20_31 = v20.trim(31, -1).crop(0, 580, 0, -00).colorYUV(off_y=10).stackVertical(v20.trim(32, -1).crop(0, 360, -30, 940 - v20.height).addBorders(30, 0, 0, 0).colorYUV(off_y=-10))
v20_32 = v20.trim(32, -1).crop(0, 800, 0, -00).colorYUV(off_y=10).stackVertical(v20.trim(32, -1).crop(0, 140, -0, 940 - v20.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-10))
v20_37 = v20.trim(37, -1).crop(0, 690, 0, -00).colorYUV(off_y=10).stackVertical(v20.trim(37, -1).crop(10, 130, -0, 820 - v20.height).addBorders(0, 0, 10, 0).colorYUV(off_y=-10))
v20_40 = v20.trim(40, -1).crop(0, 520, 0, -00).colorYUV(off_y=10).stackVertical(v20.trim(40, -1).crop(0, 130, -10, 650 - v20.height).addBorders(10, 0, 0, 0).colorYUV(off_y=-10))
v20 = v20.trim(0, 26) + v20_27 + v20_28 + v20_29 + v20_30 + v20_31 + v20_32 + v20.trim(33, 36) + v20_37 + v20.trim(38, 39) + v20_40 + v20.trim(41, 0)
v20 = v20.crop(left + 50, top - 30, right + 50, bot - 30)
v20 = v20.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v20.trim(3, 0)
#return v20.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v21 = full.trim(4467, 4613)
v21 = v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(0, 1) +\
      v21.crop(left + 50, top - 60, right + 50, bot - 60).trim(2, -1) +\
      v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(3, -1) +\
      v21.crop(left + 50, top - 40, right + 50, bot - 40).trim(4, -1) +\
      v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(5, 13) +\
      v21.crop(left + 50, top - 40, right + 50, bot - 40).trim(14, -1) +\
      v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(15, 56) +\
      v21.crop(left + 50, top - 70, right + 50, bot - 70).trim(57, -1) +\
      v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(58, 61) +\
      v21.crop(left + 50, top - 50, right + 50, bot - 50).trim(62, 65) +\
      v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(66, 69) +\
      v21.crop(left + 50, top - 50, right + 50, bot - 50).trim(70, 72) +\
      v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(73, 75) +\
      v21.crop(left + 50, top - 50, right + 50, bot - 50).trim(76, -1) +\
      v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(77, 94) +\
      v21.crop(left + 30, top - 50, right + 30, bot - 50).trim(95, 101) +\
      v21.crop(left + 50, top - 20, right + 50, bot - 20).trim(102, 0)
v21 = v21.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v21.trim(3, 0)
#return v21.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v22 = full.trim(4614, 4817)
v22 = v22.crop(left + 50, top - 20, right + 50, bot - 20).trim(0, 176) +\
      v22.crop(left + 50, top - 40, right + 50, bot - 40).trim(177, 178) +\
      v22.crop(left + 50, top - 40, right + 50, bot - 40).trim(179, 0)
v22 = v22.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v22.trim(3, 0)
#return v22.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 26
top = top + 20
right = right - 26
bot = bot - 18

v23 = full.trim(4818, 5061)
v23 = v23.crop(left + 50, top - 20, right + 50, bot - 20).trim(0, 82) +\
      v23.crop(left + 30, top - 40, right + 30, bot - 40).trim(83, 95) +\
      v23.crop(left + 50, top - 20, right + 50, bot - 20).trim(96, 123) +\
      v23.crop(left + 30, top - 40, right + 30, bot - 40).trim(124, 160) +\
      v23.crop(left + 50, top - 20, right + 50, bot - 20).trim(161, 0)
v23 = v23.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v23.trim(3, 0)
#return v23.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v24 = full.trim(5062, 5114)
v24 = v24.animate(0, 4, "crop", left + 50, top - 20, right + 50, bot - 20, left + 50, top - 80, right + 50, bot - 80).trim(0, 4) +\
      v24.animate(4, 6, "crop", left + 50, top - 80, right + 50, bot - 80, left + 50, top - 20, right + 50, bot - 20).trim(5, 0)
v24 = v24.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v24.trim(3, 0)
v24 = v24.trim(0, 30) +\
      v24.trim(31, 41).deFlickOverlappedInc(width = 10000, step = 200, toward_darkest = true, right2left = false) +\
      v24.trim(42, 48) +\
      v24.trim(48, 0).deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(1, 0)
v24_angle = 3.
#v24 = v24.rotate(-v24_angle)
#return v24.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v25 = full.trim(5116, 5447)
v25 = v25.animate(90, 100, "crop", left + 50, top - 20, right + 50, bot - 20, left + 50, top - 0, right + 50, bot - 0).trim(0, 100) +\
      v25.animate(101, 108, "crop", left + 50, top - 0, right + 50, bot - 0, left + 50, top - 10, right + 50, bot - 10).trim(101, 123) +\
      v25.animate(124, 131, "crop", left + 50, top - 10, right + 50, bot - 10, left + 50, top - 0, right + 50, bot - 0).trim(124, 131) +\
      v25.animate(131, 143, "crop", left + 50, top - 0, right + 50, bot - 0, left + 50, top - 10, right + 50, bot - 10).trim(132, 190) +\
      v25.trim(191, 199).crop(left + 50, top + 10, right + 50, bot + 10) +\
      v25.trim(200, 201).crop(left + 50, top - 10, right + 50, bot - 10) +\
      v25.trim(202, 220).crop(left + 20, top - 30, right + 20, bot - 30) +\
      v25.trim(221, 234).crop(left + 20, top - 10, right + 20, bot - 10) +\
      v25.trim(235, 263).crop(left + 20, top - 30, right + 20, bot - 30) +\
      v25.trim(264, -1).crop(left + 20, top - 60, right + 20, bot - 60) +\
      v25.trim(265, 268).crop(left + 20, top - 50, right + 20, bot - 50) +\
      v25.trim(269, 282).crop(left + 20, top - 60, right + 20, bot - 60) +\
      v25.trim(283, 285).crop(left + 20, top - 30, right + 20, bot - 30) +\
      v25.trim(286, 0).crop(left + 20, top - 10, right + 20, bot - 10)
v25 = v25.addBorders(2,2,2,2).crop(2,2,-2,-2)
#v25 = v25.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v25.trim(3, 0)
v25_angle = 3.
#v25 = v25.rotate(-v25_angle)
#return v25.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v26 = full.trim(5448, 5652)
v26 = v26.crop(left + 50, top - 20, right + 50, bot - 20).trim(0, 50) +\
      v26.crop(left + 50, top - 0, right + 50, bot - 0).trim(51, -1) +\
      v26.crop(left + 50, top - 20, right + 50, bot - 20).trim(52, 110) +\
      v26.crop(left + 50, top - 0, right + 50, bot - 0).trim(111, -1) +\
      v26.crop(left + 50, top - 20, right + 50, bot - 20).trim(112, 138) +\
      v26.crop(left + 50, top - 0, right + 50, bot - 0).trim(139, 140) +\
      v26.crop(left + 50, top - 20, right + 50, bot - 20).trim(141, 176) +\
      v26.crop(left + 50, top - 40, right + 50, bot - 40).trim(177, -1) +\
      v26.crop(left + 50, top - 80, right + 50, bot - 80).trim(178, -1) +\
      v26.crop(left + 50, top - 40, right + 50, bot - 40).trim(179, 183) +\
      v26.crop(left + 50, top - 80, right + 50, bot - 80).trim(184, -1) +\
      v26.crop(left + 50, top - 40, right + 50, bot - 40).trim(185, -1) +\
      v26.crop(left + 50, top - 70, right + 50, bot - 70).trim(186, -1) +\
      v26.crop(left + 50, top - 30, right + 50, bot - 30).trim(187, 188) +\
      v26.crop(left + 50, top - 10, right + 50, bot - 10).trim(189, 194) +\
      v26.crop(left + 50, top - 30, right + 50, bot - 30).trim(195, 197) +\
      v26.crop(left + 50, top - 0, right + 50, bot - 0).trim(198, -1) +\
      v26.crop(left + 50, top - 30, right + 50, bot - 30).trim(199, -1) +\
      v26.crop(left + 20, top - 0, right + 20, bot - 0).trim(200, 0)
v26 = v26.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v26.trim(3, v26.frameCount - 3)
v26_angle = 3.
#v26 = v26.rotate(-v26_angle)
#return v26.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v27 = full.trim(5653, 5920)
v27_8 = v27.trim(7, -1).crop(0, 4, 0, -1216).stackVertical(v27.trim(8, -1).crop(0, 0, -0, 1220 - v27.height).addBorders(0, 0, 0, 0))
v27_9 = v27.trim(8, -1).crop(10, 1110, 0, -200).colorYUV(off_Y=16).addBorders(0, 0, 10, 0).stackVertical(v27.trim(9, -1).crop(0, 0, -0, 1310 - v27.height))
v27 = v27.trim(0, 7) + v27_8 + v27_9 + v27.trim(10, 0)
v27 = v27.crop(left + 30, top - 30, right + 30, bot - 30).trim(0, 3) +\
      v27.crop(left + 50, top - 20, right + 50, bot - 20).trim(4, 32) +\
      v27.crop(left + 30, top - 20, right + 30, bot - 20).trim(33, 40) +\
      v27.crop(left + 50, top - 20, right + 50, bot - 20).trim(41, 164) +\
      v27.crop(left + 50, top - 0, right + 50, bot - 0).trim(165, 171) +\
      v27.crop(left + 50, top - 20, right + 50, bot - 20).trim(172, 185) +\
      v27.crop(left + 50, top - 40, right + 50, bot - 40).trim(186, 190) +\
      v27.crop(left + 50, top - 0, right + 50, bot - 0).trim(191, 218) +\
      v27.crop(left + 30, top - 40, right + 30, bot - 40).trim(219, 222) +\
      v27.crop(left + 50, top - 0, right + 50, bot - 0).trim(223, 0)
v27 = v27.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v27.trim(3, 0)
#return v27.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v28 = full.trim(5921, 6340)
v28 = v28.crop(left + 50, top - 0, right + 50, bot - 0).trim(0, 130) +\
      v28.crop(left + 30, top - 0, right + 30, bot - 0).trim(131, 134) +\
      v28.crop(left + 50, top - 0, right + 50, bot - 0).trim(135, 0)
v28 = v28.trim(0, 130) + v28.trim(132, 0)
v28 = v28.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v28.trim(3, 0)
#return v28.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v29 = full.trim(6341, 6774)
v29 = v29.crop(left + 30, top + 0, right + 30, bot + 0).trim(0, 68) +\
      v29.crop(left + 30, top - 10, right + 30, bot - 10).trim(69, 70) +\
      v29.crop(left + 30, top - 124, right + 30, bot - 124).trim(71, -1) +\
      v29.crop(left + 30, top + 10, right + 30, bot + 10).trim(72, 223) +\
      v29.crop(left + 30, top - 20, right + 30, bot - 20).trim(224, -1) +\
      v29.crop(left + 30, top + 10, right + 30, bot + 10).trim(225, 254) +\
      v29.crop(left + 30, top - 20, right + 30, bot - 20).trim(255, -1) +\
      v29.crop(left + 30, top - 40, right + 30, bot - 40).trim(256, -1) +\
      v29.crop(left + 30, top + 10, right + 30, bot + 10).trim(257, 259) +\
      v29.crop(left + 30, top - 20, right + 30, bot - 20).trim(260, -1) +\
      v29.crop(left + 30, top + 10, right + 30, bot + 10).trim(261, 423) +\
      v29.crop(left + 30, top - 0, right + 30, bot - 0).trim(424, 425) +\
      v29.crop(left + 30, top + 10, right + 30, bot + 10).trim(426, 0)
v29 = v29.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v29.trim(3, 0)
#return v29.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v30 = full.trim(6775, 7013)
v30 = v30.crop(left + 30, top + 0, right + 30, bot + 0)
v30 = v30.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v30.trim(3, 0)
#return v30.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v31 = full.trim(7014, 7124)
#v31 = v31.crop(left + 30, top + 0, right + 30, bot + 0)
v31 = v31.crop(left + 30, top + 0, right + 30, bot + 0).trim(0,106) +\
      v31.crop(left + 30, top + 10, right + 30, bot + 10).trim(107,108) +\
      v31.crop(left + 30, top + 50, right + 30, bot + 50).trim(109, -1) +\
      v31.crop(left + 30, top + 70, right + 30, bot + 70).trim(110, 0)
v31 = v31.trim(0, 40) +\
      v31.trim(41, 53).deFlickOverlappedInc(width = 10000, step = 200, toward_darkest = true, right2left = true) +\
      v31.trim(54, 73) +\
      v31.trim(74, 94).deFlickOverlappedInc(width = 10000, step = 200, toward_darkest = true, right2left = true) +\
      v31.trim(95, 0)
v31 = v31.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v31.trim(3, 0)
#return v31.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v32 = full.trim(7127, 7478)
v32 = v32.crop(left + 50, top + 20, right + 50, bot + 20)
#return v32.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

#global filter16 = true

import("..\common.avs")

/*

#******


# 1
*/
v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
v1_i = v1
b_ex = undefined
#v1 = v1.AdjustColor(ou = +12, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v1 = v1.AdjustColor(ou = +12, ov = -10, x=100, y=10, w=-400, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v1 = v1.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
###
v1_0 = v1
v1 = v1_i
#v1 = v1.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v1 = v1.AdjustColor(ou = +18, ov = -12, x=v1.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v1 = v1.colorYUV(off_u = +2, off_v = -2)
v1 = v1.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l=v1.width*2/3, border_t=0, gamma=0.8)
mask = BlankClip(length = v1.frameCount, width = v1.width, height = v1.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v1 = v1_0.mt_merge(v1, mask, luma = true)#.interleave(v1_0)
###
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate
/*
v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v2 = v2.AdjustColor(ou = +30, ov = -20, x=900, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.04, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v2 = v2.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.7)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate

v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
b_ex = undefined
v3 = v3.AdjustColor(ou = +20, ov = -14, x=800, y=100, w=-200, h=-600, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=800, border_t=100, border_r=200, border_b=600)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate

v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
b_ex = undefined
v4 = v4.AdjustColor(ou = +20, ov = -14, x=300, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v4 = v4.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=300)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate

v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").ConvertToYV24()
b_ex = undefined
v5 = v5.AdjustColor(ou = +10, ov = -10, x=600, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v5 = v5.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7, border_l=600)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
v5 = v5.add_blank_audio
return v5.prefetch
#adjustframerate

v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
b_ex = undefined
v6 = v6.AdjustColor(ou = +20, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v6 = v6.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate

v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").ConvertToYV24()
b_ex = undefined
v7 = v7.AdjustColor(ou = +20, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v7 = v7.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
v7 = v7.add_blank_audio
return v7.prefetch
#adjustframerate

v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").ConvertToYV24()
b_ex = undefined
v8 = v8.AdjustColor(ou = +20, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v8 = v8.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
v8 = v8.add_blank_audio
return v8.prefetch
#adjustframerate

v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
b_ex = undefined
v9 = v9.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate

v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
b_ex = undefined
v10 = v10.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate

function adjColBord(clip c, int x, int w)
{
    return c.AdjustColor(ou = +16, ov = -12, x=x, y=10, w=-w, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true)
}
v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
b_ex = undefined
v11 = v11.animate(170, 180, "adjColBord", 10, 10, 10, 1000).trim(0, 279) +\
      v11.animate(280, 320, "adjColBord", 10, 1000, 10, 10).trim(280, 0)
v11 = v11.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate

v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").ConvertToYV24()
b_ex = undefined
v12 = v12.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-400, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
v12 = v12.add_blank_audio
return v12.prefetch
#adjustframerate

function adjColBord(clip c, int w, int h)
{
    return c.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-w, h=-h, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true)
}
v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
b_ex = undefined
v13 = v13.animate(200, 220, "adjColBord", 10, 1000, 400, 10)
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate

v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").ConvertToYV24()
b_ex = undefined
v14 = v14.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=2., gam_mac=true, b_expr=b_ex)
v14 = v14.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
v14 = v14.add_blank_audio
return v14.prefetch
#adjustframerate

v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
b_ex = undefined
v15 = v15.AdjustColor(ou = +12, ov = -12, x=10, y=10, w=-10, h=-100, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=1.7, gam_mac=true, b_expr=b_ex)
v15 = v15.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8, border_b = 100)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate

v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
b_ex = undefined
v16 = v16.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v16 = v16.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate

v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
b_ex = undefined
v17 = v17.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-700, h=-500, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=1.7, gam_mac=true, b_expr=b_ex)
v17 = v17.colorYUV(off_u = -4, off_v = +4)
v17 = v17.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8, border_r=700, border_b=500)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate

v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").ConvertToYV24()
b_ex = undefined
v18 = v18.AdjustColor(ou = +8, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=1.7, gam_mac=true, b_expr=b_ex)
v18 = v18.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.8)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
v18 = v18.add_blank_audio
return v18.prefetch
#adjustframerate

v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
v19_i = v19
b_ex = undefined
v19 = v19.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=1.9, gam_mac=true, b_expr=b_ex)
v19 = v19.colorYUV(off_u = -1, off_v = +1)
v19 = v19.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 70, input_high = 240, autolevel = false, gamma=0.8)
v19_0 = v19
v19 = v19_i
b_ex = undefined
v19 = v19.AdjustColor(ou = +14, ov = -8, x=v19.width*2/3, y=600, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat_0=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v19 = v19.colorYUV(off_u = -1, off_v = +1)
v19 = v19.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 245, autolevel = false, gamma=0.8)
mask = BlankClip(length = v19.frameCount, width = v19.width, height = v19.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.2 - 0.8 / 256 *", chroma="-128") 
#return mask
v19 = v19_0.mt_merge(v19, mask, luma = true)#.interleave(v19_0)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate

v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
b_ex = undefined
v20 = v20.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=2.1, gam_mac=true, b_expr=b_ex)
v20 = v20.colorYUV(off_u = +2, off_v = -2)
v20 = v20.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.9)#, border_l=100, border_t=100, border_r=100, border_b=100)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate

v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").ConvertToYV24()
b_ex = undefined
v21 = v21.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=3., gam_mac=true, b_expr=b_ex)
v21 = v21.colorYUV(off_u = +8, off_v = -4)
v21 = v21.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.6)#, border_l=100, border_t=100, border_r=100, border_b=100)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
v21 = v21.add_blank_audio
return v21.prefetch
#adjustframerate

function levels(clip c, int input_low)
{
    return c.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = input_low, input_high = 240, autolevel = false, gamma=0.8)
}
v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
v22 = v22.autolevels(input_low = 90, output_low = 0, input_high = 240, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
v22_i = v22
b_ex = undefined
v22 = v22.AdjustColor(ou = +26, ov = -22, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v22 = v22.animate(118, 135, "levels", 20, 80)
v22_0 = v22
v22 = v22_i
v22 = v22.AdjustColor(ou = +26, ov = -22, x=v22.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
mask = BlankClip(length = v22.frameCount, width = v22.width, height = v22.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.2 - 0.8 / 256 *", chroma="-128") 
#return mask
v22 = v22_0.mt_merge(v22, mask, luma = true)#.interleave(v22_0)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate

function levels(clip c, int input_low, int input_high, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = input_low, input_high = input_high, autolevel = false, gamma=gamma)
}
v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
v23_i = v23
b_ex = undefined
v23 = v23.AdjustColor(ou = +20, ov = -16, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v23 = v23.colorYUV(off_u = -2, off_v = +2)
v23 = v23.animate(100, 160, "levels", 20, 255, 1., 85, 240, 0.8)
v23_0 = v23
v23 = v23_i
v23 = v23.AdjustColor(ou = +20, ov = -16, x=v23.width*2/3, y=600, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v23.frameCount, width = v23.width, height = v23.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.2 - 0.8 / 256 *", chroma="-128") 
#return mask
v23 = v23_0.mt_merge(v23, mask, luma = true)#.interleave(v23_0)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate

v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").ConvertToYV24()
b_ex = undefined
v24 = v24.AdjustColor(ou = +26, ov = -16, x=10, y=10, w=-10, h=-300, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v24 = v24.colorYUV(off_u = +2, off_v = -2)
v24 = v24.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8, border_b=300)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
v24 = v24.add_blank_audio
return v24.prefetch
#adjustframerate

v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
b_ex = undefined
v25 = v25.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v25_1 = v25.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, autolevel=false, input_low=16, input_high=235, output_low=0, output_high=240)
v25 = v25.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, autolevel=false, input_low=16, input_high=235, output_low=0)#, output_high=235)
v25 = v25_1.trim(0, 87) + v25.trim(88, 0)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate

v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
b_ex = undefined
v26 = v26.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v26 = v26.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate

v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
b_ex = undefined
v27 = v27.AdjustColor(ou = +16, ov = -12, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v27 = v27.colorYUV(off_u = -2, off_v = +2)
v27 = v27.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate

v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
b_ex = undefined
v28 = v28.AdjustColor(ou = +20, ov = -14, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v28 = v28.colorYUV(off_u = -2, off_v = +2)
v28 = v28.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.7)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate

v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
b_ex = undefined
v29 = v29.AdjustColor(ou = +10, ov = -14, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v29 = v29.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate

v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").ConvertToYV24()
b_ex = undefined
v30 = v30.AdjustColor(ou = +10, ov = -8, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v30 = v30.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.6)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
v30 = v30.add_blank_audio
return v30.prefetch
#adjustframerate

v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
b_ex = undefined
v31 = v31.AdjustColor(ou = +16, ov = -8, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v31 = v31.colorYUV(off_u = +4, off_v = -4)
v31 = v31.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate

v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
#v32 = v32.autolevels(input_low = 90, output_low = 0, input_high = 240, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v32_i = v32
v32 = v32.AdjustColor(ou = +36, ov = -28, x=200, y=10, w=-400, h=-400, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)#,\
#                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v32 = v32.colorYUV(off_u = +4, off_v = -4)
v32 = v32.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.5)
#v32 = v32.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 80, input_high = 250, autolevel = false, gamma=0.8)
#return v32.hist_levels.prefetch
v32_0 = v32
v32 = v32_i
v32 = v32.AdjustColor(ou = +36, ov = -28, x=v32.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)#,\
#                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v32 = v32.colorYUV(off_u = +4, off_v = -4)
#v32 = v32.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.5)
mask = BlankClip(length = v32.frameCount, width = v32.width, height = v32.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v32 = v32_0.mt_merge(v32, mask, luma = true)#.interleave(v32_0)
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate

#******
*/