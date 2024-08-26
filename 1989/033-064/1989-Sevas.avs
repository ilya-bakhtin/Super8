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
# skip (7586, 7588)
# 9878, 10154, 10435, 10645, 11114, 11250, 11301, 11382, 11686, 12014, 12496, 12897, 13227, 13264, 13486, 13497, 13529, 13670,  # 58
#skip (13486, 13497)
# 13785, 14161, 14283, 14568, 14974, 15275, 15325, 15624, 15791, 15921, 16186, 16411, 16558, 16622, 16752, 17133, 17378, 17762, # 76

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
/*
left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v33 = full.trim(7479, 7585)
v33 = v33.crop(left + 50, top + 10, right + 50, bot + 10)
v33 = v33.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v33.trim(3, 0)
#return v33.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v34 = full.trim(7589, 8064)
v34 = v34.crop(left + 50, top + 10, right + 50, bot + 10)
v34 = v34.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v34.trim(3, 0)
#return v34.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v35 = full.trim(8065, 8584)
v35 = v35.crop(left + 50, top + 10, right + 50, bot + 10)
v35 = v35.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v35.trim(3, 0)
v35_angle = 3.
#v35 = v35.rotate(-v35_angle)
#return v35.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v36 = full.trim(8585, 9113)
v36 = v36.animate(90, 110, "crop", left + 50, top - 10, right + 50, bot - 10, left + 50, top + 10, right + 50, bot + 10).trim(0, 187) +\
      v36.crop(left + 50, top - 20, right + 50, bot - 20).trim(188, -1) +\
      v36.crop(left + 50, top + 10, right + 50, bot + 10).trim(189, 222) +\
      v36.crop(left + 50, top - 20, right + 50, bot - 20).trim(223, -1) +\
      v36.crop(left + 50, top + 10, right + 50, bot + 10).trim(224, 249) +\
      v36.crop(left + 50, top - 10, right + 50, bot - 10).trim(250, -1) +\
      v36.crop(left + 50, top + 10, right + 50, bot + 10).trim(251, 309) +\
      v36.crop(left + 50, top - 10, right + 50, bot - 10).trim(310, 312) +\
      v36.crop(left + 50, top + 10, right + 50, bot + 10).trim(313, 0)
v36 = v36.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v36.trim(3, 0)
#return v36.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v37 = full.trim(9114, 9186)
v37 = v37.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 70) +\
      v37.crop(left + 50, top + 30, right + 50, bot + 30).trim(71, -1) +\
      v37.crop(left + 50, top + 40, right + 50, bot + 40).trim(72, 0)
v37 = v37.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v37.trim(3, 0)
v37_angle = 5.
#v37 = v37.rotate(-v37_angle)
#return v37.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v38 = full.trim(9188, 9383)
v38 = v38.crop(left + 50, top + 10, right + 50, bot + 10)
#return v38.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 30
right = right - 46
bot = bot - 8

v39 = full.trim(9384, 9609)
v39 = v39.crop(left + 50, top + 10, right + 50, bot + 10)
v39 = v39.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v39.trim(3, 0)
#v39_angle = 5.
#v39 = v39.rotate(-v39_angle)
#return v39.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v40 = full.trim(9610, 9877)
v40 = v40.crop(left + 50, top + 10, right + 50, bot + 10)
v40 = v40.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v40.trim(3, 0)
#return v40.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v41 = full.trim(9878, 10153)
v41 = v41.crop(left + 50, top + 10, right + 50, bot + 10)
v41 = v41.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v41.trim(3, 0)
#return v41.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v42 = full.trim(10155, 10434)
#v42 = v42.crop(left + 50, top + 10, right + 50, bot + 10)
v42 = v42.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 2) +\
      v42.crop(left + 50, top - 30, right + 50, bot - 30).trim(3, 4) +\
      v42.crop(left + 50, top + 10, right + 50, bot + 10).trim(5, 139) +\
      v42.crop(left + 50, top - 20, right + 50, bot - 20).trim(140, -1) +\
      v42.crop(left + 50, top + 10, right + 50, bot + 10).trim(141, 194) +\
      v42.crop(left + 50, top - 20, right + 50, bot - 20).trim(195, -1) +\
      v42.crop(left + 50, top + 10, right + 50, bot + 10).trim(196, 274) +\
      v42.crop(left + 50, top - 20, right + 50, bot - 20).trim(275, -1) +\
      v42.crop(left + 50, top + 10, right + 50, bot + 10).trim(276, 0)
v42 = v42.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v42.trim(3, 0)
#return v42.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v43 = full.trim(10435, 10644)
v43 = v43.crop(left + 50, top + 10, right + 50, bot + 10)
v43 = v43.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v43.trim(3, 0)
#return v43.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v44 = full.trim(10645, 11113)
v44 = v44.crop(left + 50, top + 10, right + 50, bot + 10)
v44 = v44.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v44.trim(3, 0)
#v44_angle = 5.
#v44 = v44.rotate(-v44_angle)
#return v44.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v45 = full.trim(11114, 11249)
#v45 = v45.crop(left + 50, top + 10, right + 50, bot + 10)
v45 = v45.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 2) +\
      v45.crop(left + 50, top - 10, right + 50, bot - 10).trim(3, 4) +\
      v45.crop(left + 50, top + 10, right + 50, bot + 10).trim(5, 131) +\
      v45.crop(left + 50, top - 20, right + 50, bot - 20).trim(132, -1) +\
      v45.crop(left + 50, top + 70, right + 50, bot + 70).trim(133, 0)
v45 = v45.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v45.trim(3, v45.frameCount - 3)
#return v45.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v46 = full.trim(11250, 11300)
v46 = v46.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 36) +\
      v46.crop(left + 40, top + 10, right + 40, bot + 10).trim(37, 47) +\
      v46.crop(left + 40, top - 20, right + 40, bot - 20).trim(48, -1) +\
      v46.crop(left + 40, top - 10, right + 40, bot - 10).trim(49, -1) +\
      v46.crop(left + 40, top + 20, right + 40, bot + 20).trim(50, 0)
#return v46.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v47 = full.trim(11301, 11381)
v47 = v47.crop(left + 50, top + 10, right + 50, bot + 10)
#v47 = v47.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#     v47.trim(3, 0)
#v47 = v47.correct_left_side(width = 400)
#v47_angle = 5.
#v47 = v47.rotate(-v47_angle)
#return v47.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v48 = full.trim(11382, 11685)
v48 = v48.crop(left + 50, top + 10, right + 50, bot + 10)
v48 = v48.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v48.trim(3, 0)
#v48 = v48.correct_left_side(width = 400)
#v48_angle = 5.
#v48 = v48.rotate(-v48_angle)
#return v48.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v49 = full.trim(11686, 12013)
v49 = v49.crop(left + 50, top + 10, right + 50, bot + 10)
v49 = v49.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v49.trim(3, 0)
#return v49.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v50 = full.trim(12014, 12495)
v50 = v50.trim(14, 0)
v50 = v50.crop(left + 50, top + 10, right + 50, bot + 10)
#v50 = v50.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v50.trim(3, 0)
#v50 = v50.correct_left_side(width = 400)
v50_angle = -1.5
#v50 = v50.rotate(-v50_angle)
#return v50.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v51 = full.trim(12496, 12896)
v51_80 = v51.trim(80, -1).crop(0, 590, 0, 0).colorYUV(off_y = 8). \
         stackVertical(v51.trim(80, -1).crop(0, 120, -20, 710 - v51.height).addBorders(20, 0, 0, 0).colorYUV(off_y=-12))
v51 = v51.trim(0, 79) + v51_80 + v51.trim(81, 0)
v51 = v51.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 80) +\
      v51.crop(left + 40, top + 10, right + 40, bot + 10).trim(81, -1) +\
      v51.crop(left + 40, top - 16, right + 40, bot - 16).trim(82, -1) +\
      v51.crop(left + 30, top - 30, right + 30, bot - 30).trim(83, -1) +\
      v51.crop(left + 40, top + 10, right + 40, bot + 10).trim(84, -1) +\
      v51.crop(left + 50, top + 10, right + 50, bot + 10).trim(85, -1) +\
      v51.crop(left + 50, top + 10, right + 50, bot + 10).trim(87, 0)
v51 = v51.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v51.trim(3, 0)
#return v51.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v52 = full.trim(12897, 13226)
v52 = v52.crop(left + 50, top + 10, right + 50, bot + 10)
v52 = v52.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v52.trim(3, 0)
#v52 = v52.correct_left_side(width = 400)
#v52_angle = 1.
#v52 = v52.rotate(-v52_angle)
#return v52.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v53 = full.trim(13227, 13263)
v53 = v53.crop(left + 50, top + 10, right + 50, bot + 10)
v53 = v53.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v53.trim(3, 0)
#v53 = v53.correct_left_side(width = 400)
#v53_angle = 1.
#v53 = v53.rotate(-v53_angle)
#return v53.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v54 = full.trim(13265, 13484)
v54_70 = v54.trim(70, -1).crop(0, 770, 0, 0).colorYUV(off_y = 8). \
         stackVertical(v54.trim(70, -1).crop(0, 140, -20, 910 - v54.height).addBorders(20, 0, 0, 0).colorYUV(off_y=-12))
v54_198 = v54.trim(198, -1).crop(0, 1136, 0, -140).colorYUV(off_y = 18). \
          stackVertical(v54.trim(198, -1).crop(0, 0, -0, 1276 - v54.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-2))
#v54_198 = v54.trim(197, -1).crop(0, 1276, 0, 0).colorYUV(off_y = 18). \
#         stackVertical(v54.trim(198, -1).crop(0, 0, -0, 1276 - v54.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-2))
v54_201 = v54.trim(201, -1).crop(0, 1320, 0, 0).colorYUV(off_y = 18). \
          stackVertical(v54.trim(201, -1).crop(0, 120, -0, 1440 - v54.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-2))
v54_203 = v54.trim(203, -1).crop(0, 970, 0, -130).colorYUV(off_y = 18). \
          stackVertical(v54.trim(203, -1).crop(0, 0, -20, 1100 - v54.height).addBorders(20, 0, 0, 0).colorYUV(off_y=-2))
v54 = v54.trim(0, 69) + v54_70 + v54.trim(71, 159) + v54.trim(162, 197) + v54_198 + v54.trim(199, -1) +\
      v54_201 + v54.trim(202, -1) + v54_203 + v54.trim(204, 0)
v54 = v54.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 68) +\
      v54.crop(left + 50, top + 0, right + 50, bot + 0).trim(69, -1) +\
      v54.crop(left + 50, top + 10, right + 50, bot + 10).trim(70, 82) +\
      v54.crop(left + 50, top + 0, right + 50, bot + 0).trim(83, -1) +\
      v54.crop(left + 50, top + 10, right + 50, bot + 10).trim(84, -1) +\
      v54.crop(left + 50, top + 20, right + 50, bot + 20).trim(85, -1) +\
      v54.crop(left + 50, top + 10, right + 50, bot + 10).trim(86, 158) +\
      v54.crop(left + 50, top + 0, right + 50, bot + 0).trim(159, -1) +\
      v54.crop(left + 50, top + 10, right + 50, bot + 10).trim(160, 172) +\
      v54.crop(left + 50, top - 10, right + 50, bot - 10).trim(173, -1) +\
      v54.crop(left + 50, top + 10, right + 50, bot + 10).trim(174, 194) +\
      v54.crop(left + 50, top - 50, right + 50, bot - 50).trim(195, -1) +\
      v54.crop(left + 50, top + 10, right + 50, bot + 10).trim(196, -1) +\
      v54.crop(left + 50, top - 70, right + 50, bot - 70).trim(197, -1) +\
      v54.crop(left + 0, top - 110, right + 0, bot - 110).trim(198, -1) +\
      v54.crop(left + 0, top - 40, right + 0, bot - 40).trim(199, -1) +\
      v54.crop(left + 10, top + 10, right + 10, bot + 10).trim(200, -1) +\
      v54.crop(left + 10, top - 30, right + 10, bot - 30).trim(201, -1) +\
      v54.crop(left + 30, top + 10, right + 30, bot + 10).trim(202, -1) +\
      v54.crop(left + 50, top + 10, right + 50, bot + 10).trim(203, 0)
#v54 = v54.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v54.trim(3, 0)
#v54 = v54.correct_left_side(width = 400)
#v54_angle = 1.
#v54 = v54.rotate(-v54_angle)
#return v54.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v55 = full.trim(13503, 13528)
v55 = v55.crop(left + 50, top - 10, right + 50, bot - 10).trim(0, -1) +\
      v55.crop(left + 50, top - 20, right + 50, bot - 20).trim(1, -1) +\
      v55.crop(left + 50, top - 40, right + 50, bot - 40).trim(2, 5) +\
      v55.crop(left + 50, top + 10, right + 50, bot + 10).trim(6, 0)
v55 = v55.deflickOverlapped(step = 100, radius = 5, toward_darkest = true, right2left = false).trim(0, 5) +\
      v55.trim(6, 0)
#v55 = v55.correct_left_side(width = 400)
#v55_angle = 1.
#v55 = v55.rotate(-v55_angle)
#return v55.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v56 = full.trim(13529, 13669)
v56_45 = v56.trim(45, -1).crop(0, 1090, 0, -140).colorYUV(off_y = 14). \
         stackVertical(v56.trim(45, -1).crop(0, 0, -20, 1230 - v56.height).addBorders(20, 0, 0, 0).colorYUV(off_y=-6))
v56 = v56.trim(0, 44) + v56_45 + v56.trim(46, 0)
v56 = v56.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 51) +\
      v56.crop(left + 50, top - 90, right + 50, bot - 90).trim(52, -1) +\
      v56.crop(left + 50, top + 10, right + 50, bot + 10).trim(53, 0)
v56 = v56.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v56.trim(3, 0)
#v56 = v56.correct_left_side(width = 400)
#v56_angle = 1.
#v56 = v56.rotate(-v56_angle)
#return v56.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v57 = full.trim(13670, 13784)
v57 = v57.crop(left + 50, top + 10, right + 50, bot + 10)
v57 = v57.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v57.trim(3, 0)
#v57 = v57.correct_left_side(width = 400)
#v57_angle = 1.
#v57 = v57.rotate(-v57_angle)
#return v57.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v58 = full.trim(13785, 14160)
v58 = v58.crop(left + 50, top - 10, right + 50, bot - 10).trim(0, 16) +\
      v58.crop(left + 50, top + 0, right + 50, bot + 0).trim(17, 20) +\
      v58.crop(left + 50, top + 10, right + 50, bot + 10).trim(21, 23) +\
      v58.crop(left + 50, top + 0, right + 50, bot + 0).trim(24, 28) +\
      v58.crop(left + 50, top + 10, right + 50, bot + 10).trim(29, 47) +\
      v58.crop(left + 50, top + 0, right + 50, bot + 0).trim(48, 52) +\
      v58.crop(left + 50, top + 10, right + 50, bot + 10).trim(53, 61) +\
      v58.crop(left + 50, top + 0, right + 50, bot + 0).trim(62, 67) +\
      v58.crop(left + 50, top + 10, right + 50, bot + 10).trim(68, 83) +\
      v58.crop(left + 50, top + 0, right + 50, bot + 0).trim(84, 94) +\
      v58.crop(left + 50, top + 10, right + 50, bot + 10).trim(95, 202) +\
      v58.crop(left + 50, top - 20, right + 50, bot - 20).trim(203, -1) +\
      v58.crop(left + 50, top + 10, right + 50, bot + 10).trim(204, 205) +\
      v58.crop(left + 30, top + 10, right + 30, bot + 10).trim(206, 210) +\
      v58.crop(left + 30, top + 0, right + 30, bot + 0).trim(211, 212) +\
      v58.crop(left + 50, top + 10, right + 50, bot + 10).trim(213, 0)
v58 = v58.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v58.trim(3, 0)
#v58 = v58.correct_left_side(width = 400)
#v58_angle = 1.
#v58 = v58.rotate(-v58_angle)
#return v58.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v59 = full.trim(14161, 14282)
v59 = v59.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 11) +\
      v59.crop(left + 50, top - 24, right + 50, bot - 24).trim(12, -1) +\
      v59.crop(left + 50, top - 0, right + 50, bot - 0).trim(13, -1) +\
      v59.crop(left + 50, top + 10, right + 50, bot + 10).trim(14, 43) +\
      v59.crop(left + 50, top - 0, right + 50, bot - 0).trim(44, -1) +\
      v59.crop(left + 50, top + 10, right + 50, bot + 10).trim(45, 49) +\
      v59.crop(left + 50, top - 10, right + 50, bot - 10).trim(50, -1) +\
      v59.crop(left + 50, top + 10, right + 50, bot + 10).trim(51, 75) +\
      v59.crop(left + 50, top - 20, right + 50, bot - 20).trim(76, -1) +\
      v59.crop(left + 50, top + 10, right + 50, bot + 10).trim(77, 0)
v59 = v59.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v59.trim(3, 0)
#v59 = v59.correct_left_side(width = 400)
#v59_angle = 1.
#v59 = v59.rotate(-v59_angle)
#return v59.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v60 = full.trim(14283, 14567)
v60_264 = v60.trim(264, -1).crop(0, 1070, 0, -120).colorYUV(off_y = 16). \
          stackVertical(v60.trim(264, -1).crop(0, 0, -0, 1190 - v60.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-4))
v60 = v60.trim(0, 263) + v60_264 + v60.trim(265, 0)
v60 = v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 1) +\
      v60.crop(left + 50, top + 0, right + 50, bot + 0).trim(2, -1) +\
      v60.crop(left + 50, top - 10, right + 50, bot - 10).trim(3, -1) +\
      v60.crop(left + 50, top + 0, right + 50, bot + 0).trim(4, -1) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(5, 100) +\
      v60.crop(left + 50, top - 20, right + 50, bot - 20).trim(101, -1) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(102, 103) +\
      v60.crop(left + 50, top - 10, right + 50, bot - 10).trim(104, -1) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(105, 106) +\
      v60.crop(left + 50, top - 10, right + 50, bot - 10).trim(107, -1) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(108, 142) +\
      v60.crop(left + 50, top - 10, right + 50, bot - 10).trim(143, 144) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(145, -1) +\
      v60.crop(left + 50, top - 20, right + 50, bot - 20).trim(146, -1) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(147, -1) +\
      v60.crop(left + 50, top - 20, right + 50, bot - 20).trim(148, -1) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(149, 169) +\
      v60.crop(left + 50, top - 10, right + 50, bot - 10).trim(170, -1) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(171, 176) +\
      v60.crop(left + 50, top - 0, right + 50, bot - 0).trim(177, 178) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(179, 263) +\
      v60.crop(left + 10, top + 10, right + 10, bot + 10).trim(264, 268) +\
      v60.crop(left + 30, top + 10, right + 30, bot + 10).trim(269, 270) +\
      v60.crop(left + 50, top + 10, right + 50, bot + 10).trim(271, 0)
v60 = v60.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v60.trim(3, 0)
#v60 = v60.correct_left_side(width = 400)
#v60_angle = 1.
#v60 = v60.rotate(-v60_angle)
#return v60.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v61 = full.trim(14568, 14973)
v61 = v61.crop(left + 50, top + 10, right + 50, bot + 10)
v61 = v61.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v61.trim(3, 0)
#v61 = v61.correct_left_side(width = 400)
#v61_angle = 1.
#v61 = v61.rotate(-v61_angle)
#return v61.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v62 = full.trim(14974, 15274)
v62_129 = v62.trim(129, -1).crop(0, 1100, 0, -140).addBorders(0, 0, 0, 0).colorYUV(off_y = 16). \
          stackVertical(v62.trim(129, -1).crop(0, 0, -0, 1240 - v62.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-4))
v62_130 = v62.trim(130, -1).crop(0, 630, 0, -140).addBorders(0, 0, 0, 0).colorYUV(off_y = 10). \
          stackVertical(v62.trim(130, -1).crop(0, 0, -0, 770 - v62.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-10))
v62_136 = v62.trim(136, -1).crop(0, 1220, 0, -140).addBorders(0, 0, 0, 0).colorYUV(off_y = 10). \
          stackVertical(v62.trim(136, -1).crop(0, 0, -0, 1360 - v62.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-10))
v62 = v62.trim(0, 128) + v62_129 + v62_130 + v62.trim(131, 135) + v62_136 + v62.trim(137, 0)
v62 = v62.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 130) +\
      v62.crop(left + 40, top - 40, right + 40, bot - 40).trim(131, -1) +\
      v62.crop(left + 30, top - 20, right + 30, bot - 20).trim(132, 140) +\
      v62.crop(left + 50, top + 10, right + 50, bot + 10).trim(141, 296) +\
      v62.crop(left + 50, top - 40, right + 50, bot - 40).trim(297, -1) +\
      v62.crop(left + 50, top + 30, right + 50, bot + 30).trim(298, -1) +\
      v62.crop(left + 50, top + 10, right + 50, bot + 10).trim(299, 0)
v62 = v62.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v62.trim(3, 0)
#v62 = v62.correct_left_side(width = 400)
#v62_angle = 1.
#v62 = v62.rotate(-v62_angle)
#return v62.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v63 = full.trim(15275, 15324)
v63_48 = v63.trim(48, -1).crop(0, 790, 0, -150).addBorders(0, 0, 0, 0).colorYUV(off_y = 16). \
          stackVertical(v63.trim(48, -1).crop(0, 0, -0, 940 - v63.height).addBorders(0, 0, 0, 0).colorYUV(off_y=-4))
v63 = v63.trim(0, 47) + v63_48 + v63.trim(49, 0)
v63 = v63.crop(left + 30, top + 10, right + 30, bot + 10).trim(0, 3) +\
      v63.crop(left + 30, top - 40, right + 30, bot - 40).trim(4, -1) +\
      v63.crop(left + 30, top + 10, right + 30, bot + 10).trim(5, 0)
#v63 = v63.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v63.trim(3, 0)
v63 = v63.correct_left_side(width = 400).correct_left_side(width = 200)
#v63_angle = 1.
#v63 = v63.rotate(-v63_angle)
#return v63.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo
*/
left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v64 = full.trim(15325, 15623)
v64 = v64.crop(left + 30, top + 20, right + 30, bot + 20).trim(0, -1) +\
      v64.crop(left + 10, top + 20, right + 10, bot + 20).trim(1, 2) +\
      v64.crop(left + 30, top + 20, right + 30, bot + 20).trim(3, 139) +\
      v64.crop(left + 30, top - 30, right + 30, bot - 30).trim(140, -1) +\
      v64.crop(left + 30, top + 20, right + 30, bot + 20).trim(141, -1) +\
      v64.crop(left + 30, top - 0, right + 30, bot - 0).trim(142, -1) +\
      v64.crop(left + 30, top - 80, right + 30, bot - 80).trim(143, -1) +\
      v64.crop(left + 30, top + 0, right + 30, bot + 0).trim(144, 146) +\
      v64.crop(left + 30, top + 20, right + 30, bot + 20).trim(147, 159) +\
      v64.crop(left + 30, top + 0, right + 30, bot + 0).trim(160, -1) +\
      v64.crop(left + 30, top + 20, right + 30, bot + 20).trim(161, 0)
#v64 = v64.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v64.trim(3, 0)
#v64 = v64.correct_left_side(width = 400).correct_left_side(width = 200)
#v64_angle = 1.
#v64 = v64.rotate(-v64_angle)
#return v64.adjustBorders.hist_levels.prefetch

left = lo
top = to
right = ro
bot = bo

#global filter16 = true

import("..\common.avs")

/*

#******


# 33

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
b_ex = undefined
v33_i = v33
v33 = v33.AdjustColor(ou = +26, ov = -18, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v33 = v33.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.7)
v33_0 = v33
v33 = v33_i
v33 = v33.AdjustColor(ou = +26, ov = -18, x=v33.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v33.frameCount, width = v33.width, height = v33.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v33 = v33_0.mt_merge(v33, mask, luma = true)#.interleave(v33_0)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate

v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
b_ex = undefined
v34_i = v34
v34 = v34.AdjustColor(ou = +22, ov = -16, x=10, y=10, w=-200, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v34 = v34.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, border_r=200)
v34_0 = v34
v34 = v34_i
v34 = v34.AdjustColor(ou = +22, ov = -16, x=v34.width*2/3, y=400, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v34.frameCount, width = v34.width, height = v34.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v34 = v34_0.mt_merge(v34, mask, luma = true)#.interleave(v34_0)
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate

v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
b_ex = undefined
v35_i = v35
v35 = v35.AdjustColor(ou = +32, ov = -24, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v35 = v35.colorYUV(off_u = +2, off_v = -2)
v35 = v35.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.7, border_l=100)
v35_0 = v35
v35 = v35_i
v35 = v35.AdjustColor(ou = +32, ov = -24, x=v35.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v35.frameCount, width = v35.width, height = v35.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v35 = v35_0.mt_merge(v35, mask, luma = true)#.interleave(v35_0)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate

v36 = LSMASHVideoSource(dst_dir + "v36f.mp4").ConvertToYV24()
v36_i = v36
b_ex = undefined
v36 = v36.AdjustColor(ou = +18, ov = -14, x=200, y=10, w=-400, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v36 = v36.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6, border_l=200, border_r=400)
###
v36_0 = v36
v36 = v36_i
add_height = 50
v36 = v36.stackVertical(v36.trim(1052, -1).loop(v36.frameCount).crop(0, 0, 0, add_height - v36.height))
v36 = v36.AdjustColor(ou = +20, ov = -14, x=v36.width*3/4, y=v36.height*3/4, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
#v36 = v36.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=v36.width*3/4, border_t=v36.height*3/4, border_r=10, border_b=10)
v36 = v36.crop(0, 0, 0, -add_height)
v36 = v36.colorYUV(off_u = -8, off_v = +8)
mask = BlankClip(length = v36.frameCount, width = v36.width, height = v36.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.4 - 1.2 * 256 *", chroma="-128")
#return mask
v36 = v36_0.mt_merge(v36, mask, luma = true)
#v36 = v36.colorYUV(off_u = -4, off_v = -0)
#return v36_0.interleave(v36).prefetch
###
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
v36 = v36.add_blank_audio
return v36.prefetch
#adjustframerate

v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
v37_i = v37
b_ex = undefined
v37 = v37.AdjustColor(ou = +18, ov = -14, x=1000, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v37 = v37.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.6)
###
v37_0 = v37
v37 = v37_i
add_height = 50
v37 = v37.stackVertical(v37.trim(1, -1).loop(v37.frameCount).crop(0, 0, 0, add_height - v37.height))
v37 = v37.AdjustColor(ou = +18, ov = -14, x=v37.width*3/4, y=v37.height*3/4, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
#v37 = v37.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=v37.width*3/4, border_t=v37.height*3/4, border_r=10, border_b=10)
v37 = v37.crop(0, 0, 0, -add_height)
#v37 = v37.colorYUV(off_u = -8, off_v = +8)
mask = BlankClip(length = v37.frameCount, width = v37.width, height = v37.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.4 - 1.2 * 256 *", chroma="-128")
#return mask
v37 = v37_0.mt_merge(v37, mask, luma = true)
#v37 = v37.colorYUV(off_u = -4, off_v = -0)
#return v37_0.interleave(v37).prefetch
###
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate

v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
b_ex = undefined
v38 = v38.AdjustColor(ou = +14, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v38 = v38.colorYUV(off_u = -2, off_v = -2)
v38 = v38.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate

v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
b_ex = undefined
v39 = v39.AdjustColor(ou = +14, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v39 = v39.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate

v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
b_ex = undefined
v40_i = v40
v40 = v40.AdjustColor(ou = +20, ov = -14, x=v40.width*1/2, y=10, w=-v40.width*1/4, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v40 = v40.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.7, border_l=v40.width*1/2, border_r=v40.width*1/4)
v40_0 = v40
v40 = v40_i
v40 = v40.AdjustColor(ou = +20, ov = -14, x=v40.width*3/4, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v40.frameCount, width = v40.width, height = v40.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v40 = v40_0.mt_merge(v40, mask, luma = true)#.interleave(v40_0)
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate

v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
b_ex = undefined
v41_i = v41
v41 = v41.AdjustColor(ou = +18, ov = -12, x=200, y=10, w=-v41.width*1/4, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v41 = v41.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.5, border_l=200, border_r=v41.width*1/4)
###
v41_0 = v41
v41 = v41_i
add_height = 100
v41 = v41.stackVertical(v41.trim(115, -1).loop(v41.frameCount).crop(0, 0, 0, add_height - v41.height))
v41 = v41.AdjustColor(ou = +18, ov = -12, x=v41.width*3/4, y=v41.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v41 = v41.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v41.frameCount, width = v41.width, height = v41.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v41 = v41_0.mt_merge(v41, mask, luma = true)
#return v41_0.interleave(v41).prefetch
###
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate

v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
b_ex = undefined
v42 = v42.AdjustColor(ou = +22, ov = -14, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v42 = v42.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate

v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
b_ex = undefined
v43 = v43.AdjustColor(ou = +22, ov = -14, x=10, y=10, w=-200, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v43 = v43.colorYUV(off_u = -2, off_v = +2)
v43 = v43.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.6, border_r=200)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate

v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
v44_i = v44
b_ex = undefined
v44 = v44.AdjustColor(ou = +22, ov = -14, x=10, y=10, w=-600, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v44 = v44.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.5, border_r=600)
###
v44_0 = v44
v44 = v44_i
#add_height = 100
#v44 = v44.stackVertical(v44.trim(115, -1).loop(v44.frameCount).crop(0, 0, 0, add_height - v44.height))
v44 = v44.AdjustColor(ou = +18, ov = -12, x=v44.width*3/4, y=v44.height*3/4, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
#v44 = v44.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v44.frameCount, width = v44.width, height = v44.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.3 - 1.2 * 256 *", chroma="-128")
#return mask
v44 = v44_0.mt_merge(v44, mask, luma = true)
#return v44_0.interleave(v44).prefetch
###
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate

v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
b_ex = undefined
v45 = v45.AdjustColor(ou = +18, ov = -14, x=10, y=10, w=-600, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v45 = v45.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6, border_r=600)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate

v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
v46_i = v46
b_ex = undefined
v46 = v46.AdjustColor(ou = +20, ov = -10, x=10, y=100, w=-10, h=-400, lo_th=0.0, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v46 = v46.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, border_l=10, border_t=100, border_b=400)
###
v46_0 = v46
v46 = v46_i
add_height = 100
v46 = v46.stackVertical(v46.trim(3, -1).loop(v46.frameCount).crop(0, 0, 0, add_height - v46.height))
v46 = v46.AdjustColor(ou = +20, ov = -10, x=v46.width*3/4, y=v46.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v46 = v46.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v46.frameCount, width = v46.width, height = v46.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v46 = v46_0.mt_merge(v46, mask, luma = true)
#return v46_0.interleave(v46).prefetch
###
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate

v47 = LSMASHVideoSource(dst_dir + "v47f.mp4").ConvertToYV24()
v47_i = v47
b_ex = undefined
v47 = v47.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.0, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v47 = v47.autolevels(filterRadius=0, minRng=0, ignore_low=0.0, ignore_high=0.003, gamma=0.6)
###
v47_0 = v47
v47 = v47_i
#add_height = 100
#v47 = v47.stackVertical(v47.trim(115, -1).loop(v47.frameCount).crop(0, 0, 0, add_height - v47.height))
v47 = v47.AdjustColor(ou = +18, ov = -12, x=v47.width*1/2, y=v47.height*1/2, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
#v47 = v47.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v47.frameCount, width = v47.width, height = v47.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v47 = v47_0.mt_merge(v47, mask, luma = true)
#return v47_0.interleave(v47).prefetch
###
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
v47 = v47.add_blank_audio
return v47.prefetch
#adjustframerate

v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
v48_i = v48
b_ex = undefined
v48 = v48.AdjustColor(ou = +16, ov = -8, x=200, y=400, w=-400, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v48 = v48.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8, border_l=200)
###
v48_0 = v48
v48 = v48_i
add_height = 100
v48 = v48.stackVertical(v48.trim(5, -1).loop(v48.frameCount).crop(0, 0, 0, add_height - v48.height))
v48 = v48.AdjustColor(ou = +18, ov = -12, x=v48.width*3/4, y=v48.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v48 = v48.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v48.frameCount, width = v48.width, height = v48.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v48 = v48_0.mt_merge(v48, mask, luma = true)
#return v48_0.interleave(v48).prefetch
###
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate

v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
v49_i = v49
b_ex = undefined
v49 = v49.AdjustColor(ou = +16, ov = -8, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
###
v49_0 = v49
v49 = v49_i
add_height = 50
v49 = v49.stackVertical(v49.trim(3, -1).loop(v49.frameCount).crop(0, 0, 0, add_height - v49.height))
v49 = v49.AdjustColor(ou = +16, ov = -8, x=v49.width*3/4, y=v49.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v49 = v49.crop(0, 0, 0, -add_height)
v49 = v49.colorYUV(off_u=4, off_v=-4)
mask = BlankClip(length = v49.frameCount, width = v49.width, height = v49.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v49 = v49_0.mt_merge(v49, mask, luma = true)
#return v49_0.interleave(v49).prefetch
###
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate

v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
v50_i = v50
b_ex = undefined
add_height = 100
v50 = v50.stackVertical(v50.trim(315, -1).loop(v50.frameCount).crop(0, 0, 0, add_height - v50.height))
v50 = v50.AdjustColor(ou = +16, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v50 = v50.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003)
v50 = v50.crop(0, 0, 0, -add_height)
v50 = v50.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)#return v50.histogram.prefetch
###
v50_0 = v50
v50 = v50_i
add_height = 100
v50 = v50.stackVertical(v50.trim(423, -1).loop(v50.frameCount).crop(0, 0, 0, add_height - v50.height))
v50 = v50.AdjustColor(ou = +16, ov = -8, x=v50.width*3/4, y=v50.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v50 = v50.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v50.frameCount, width = v50.width, height = v50.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v50 = v50_0.mt_merge(v50, mask, luma = true)
#return v50_0.interleave(v50).prefetch
###
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate

v51 = LSMASHVideoSource(dst_dir + "v51f.mp4").ConvertToYV24()
v51_i = v51
b_ex = undefined
add_height = 200
v51 = v51.stackVertical(v51.trim(217, -1).loop(v51.frameCount).crop(0, 0, 0, add_height - v51.height))
v51 = v51.AdjustColor(ou = +16, ov = -8, x=200, y=300, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v51 = v51.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l = 200, border_t=300)
v51 = v51.crop(0, 0, 0, -add_height)
v51 = v51.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)#return v51.histogram.prefetch
###
v51_0 = v51
v51 = v51_i
add_height = 100
v51 = v51.stackVertical(v51.trim(83, -1).loop(v51.frameCount).crop(0, 0, 0, add_height - v51.height))
v51 = v51.AdjustColor(ou = +16, ov = -8, x=v51.width*3/4, y=v51.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v51 = v51.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v51.frameCount, width = v51.width, height = v51.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v51 = v51_0.mt_merge(v51, mask, luma = true)
#return v51_0.interleave(v51).prefetch
###
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
v51 = v51.add_blank_audio
return v51.prefetch
#adjustframerate

v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
v52_i = v52
b_ex = undefined
add_height = 200
v52 = v52.stackVertical(v52.trim(100, -1).loop(v52.frameCount).crop(0, 0, 0, add_height - v52.height))
v52 = v52.AdjustColor(ou = +16, ov = -8, x=200, y=300, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v52 = v52.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l = 200, border_t=0)
v52 = v52.crop(0, 0, 0, -add_height)
v52 = v52.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 30, input_high = 255, autolevel = false)#return v52.histogram.prefetch
###
v52_0 = v52
v52 = v52_i
add_height = 100
v52 = v52.stackVertical(v52.trim(102, -1).loop(v52.frameCount).crop(0, 0, 0, add_height - v52.height))
v52 = v52.AdjustColor(ou = +16, ov = -8, x=v52.width*3/4, y=v52.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v52 = v52.crop(0, 0, 0, -add_height)
v52 = v52.colorYUV(off_u = 4, off_v = -4)
mask = BlankClip(length = v52.frameCount, width = v52.width, height = v52.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v52 = v52_0.mt_merge(v52, mask, luma = true)
#return v52_0.interleave(v52).prefetch
###
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate

v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
b_ex = undefined
v53 = v53.AdjustColor(ou = +20, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.04, lock_chan=0, sat=1.7, gam_mac=true, b_expr=b_ex)
v53 = v53.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.7)
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate

v54 = LSMASHVideoSource(dst_dir + "v54f.mp4").ConvertToYV24()
v54_i = v54
b_ex = undefined
v54 = v54.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.0, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v54 = v54.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, border_l=100)
###
v54_0 = v54
v54 = v54_i
#add_height = 100
#v54 = v54.stackVertical(v54.trim(115, -1).loop(v54.frameCount).crop(0, 0, 0, add_height - v54.height))
v54 = v54.AdjustColor(ou = +16, ov = -10, x=v54.width*3/4, y=v54.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
#v54 = v54.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v54.frameCount, width = v54.width, height = v54.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v54 = v54_0.mt_merge(v54, mask, luma = true)
#return v54_0.interleave(v54).prefetch
###
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
v54 = v54.add_blank_audio
return v54.prefetch
#adjustframerate

v55 = LSMASHVideoSource(dst_dir + "v55f.mp4").ConvertToYV24()
b_ex = undefined
v55 = v55.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v55 = v55.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v55 = v55.adjustSize
v55 = v55.assumeFPS(18)
v55 = v55.add_blank_audio
return v55.prefetch
#adjustframerate

v56 = LSMASHVideoSource(dst_dir + "v56f.mp4").ConvertToYV24()
b_ex = undefined
v56 = v56.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v56 = v56.colorYUV(off_u = -2, off_v = +2)
v56 = v56.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
v56 = v56.add_blank_audio
return v56.prefetch
#adjustframerate

v57 = LSMASHVideoSource(dst_dir + "v57f.mp4").ConvertToYV24()
b_ex = undefined
v57 = v57.AdjustColor(ou = +24, ov = -16, x=900, y=300, w=-10, h=-300, lo_th=0.4, hi_th=0.04, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex)
v57 = v57.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=0.7, border_l=900, border_t=300, border_b=300)
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
v57 = v57.add_blank_audio
return v57.prefetch
#adjustframerate

v58 = LSMASHVideoSource(dst_dir + "v58f.mp4").ConvertToYV24()
v58_i = v58
b_ex = undefined
add_height = 200
v58 = v58.stackVertical(v58.trim(303, -1).loop(v58.frameCount).crop(0, v58.height - add_height, 0, 0))
v58 = v58.AdjustColor(ou = +14, ov = -8, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v58 = v58.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l=200, gamma=0.7)
v58 = v58.crop(0, 0, 0, -add_height)
v58 = v58.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 30, input_high = 255, autolevel = false)#return v58.histogram.prefetch
###
v58_0 = v58
v58 = v58_i
add_height = 100
v58 = v58.stackVertical(v58.trim(307, -1).loop(v58.frameCount).crop(0, v58.height - add_height, 0, 0))
v58 = v58.AdjustColor(ou = +14, ov = -8, x=v58.width*3/4, y=v58.height*2/333, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v58 = v58.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v58.frameCount, width = v58.width, height = v58.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v58 = v58_0.mt_merge(v58, mask, luma = true)
#return v58_0.interleave(v58).prefetch
###
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
v58 = v58.add_blank_audio
return v58.prefetch
#adjustframerate

v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
b_ex = undefined
v59 = v59.AdjustColor(ou = +18, ov = -12, x=200, y=10, w=-10, h=-400, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v59 = v59.colorYUV(off_u = +2, off_v = -2)
v59 = v59.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, border_l=200, border_t=400, gamma=0.9)
v59_0 = v59
v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
#v59 = v59.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v59 = v59.AdjustColor(ou = +18, ov = -12, x=v59.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v59 = v59.colorYUV(off_u = +2, off_v = -2)
v59 = v59.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l=v59.width*2/3, border_t=0, gamma=0.8)
mask = BlankClip(length = v59.frameCount, width = v59.width, height = v59.height, pixel_type="YV12")
mask1 = mask.mt_lutspa(mode="relative", expr="y 2. 3. / < 0 y 2. 3. / - 3 * 255 * ?", chroma="-128") 
mask2 = mask.mt_lutspa(mode="relative", expr="y 1. 4. / > 255 y 4 * 255 * ?", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 3. 6. / < 0 x 5. 6. / > 255 x 3. 6. / - 3 * 255 * ? ?", chroma="-128")
mask = mask.mt_logic(mask1, "max")
mask = mask.mt_logic(mask2, "min")
#return mask
v59 = v59_0.mt_merge(v59, mask, luma = true)#.interleave(v59_0)
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
v59 = v59.add_blank_audio
return v59.prefetch
#adjustframerate

v60 = LSMASHVideoSource(dst_dir + "v60f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v60 = v60.stackVertical(v60.trim(283, -1).loop(v60.frameCount).crop(0, 0, 0, add_height - v60.height))
v60 = v60.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.00, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v60 = v60.colorYUV(off_u = -2, off_v = +2)
v60 = v60.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.000, gamma=0.5)
v60 = v60.crop(0, 0, 0, -add_height)
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
v60 = v60.add_blank_audio
return v60.prefetch
#adjustframerate

v61 = LSMASHVideoSource(dst_dir + "v61f.mp4").ConvertToYV24()
v61_i =v61
b_ex = undefined
add_height = 200
v61 = v61.trim(405, -1).loop(v61.frameCount).crop(0, 0, 0, add_height - v61.height).stackVertical(v61)
v61 = v61.AdjustColor(ou = +14, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v61 = v61.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v61 = v61.crop(0, add_height, 0, 0)
v61 = v61.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 60, input_high = 255, autolevel = false)#return v61.histogram.prefetch
###
v61_0 = v61
v61 = v61_i
add_height = 100
v61 = v61.stackVertical(v61.trim(405, -1).loop(v61.frameCount).crop(0, 0, 0, add_height - v61.height))
v61 = v61.AdjustColor(ou = +14, ov = -10, x=v61.width*1/2, y=v61.height*2/333, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v61 = v61.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 60, input_high = 255, autolevel = false)#return v61.histogram.prefetch
v61 = v61.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v61.frameCount, width = v61.width, height = v61.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v61 = v61_0.mt_merge(v61, mask, luma = true)
#return v61_0.interleave(v61).prefetch
###
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
v61 = v61.add_blank_audio
return v61.prefetch
#adjustframerate

v62 = LSMASHVideoSource(dst_dir + "v62f.mp4").ConvertToYV24()
b_ex = undefined
v62 = v62.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v62 = v62.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v62 = v62.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 30, input_high = 255, autolevel = false)#return v62.histogram.prefetch
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
v62 = v62.add_blank_audio
return v62.prefetch
#adjustframerate

v63 = LSMASHVideoSource(dst_dir + "v63f.mp4").ConvertToYV24()
b_ex = undefined
v63 = v63.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v63 = v63.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003)
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
v63 = v63.add_blank_audio
return v63.prefetch
#adjustframerate

v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
#v64 = v64.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v64 = v64.trim(405, -1).loop(v64.frameCount).crop(0, 0, 0, add_height - v64.height).stackVertical(v64)
#return v64.histogram.prefetch
v64 = v64.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v64 = v64.colorYUV(off_u = -2, off_v = +2)
v64 = v64.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
#v64 = v64.crop(0, add_height, 0, 0)
#v64 = v64.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 30, input_high = 255, autolevel = false)#return v64.histogram.prefetch
#return v64.hist_levels.prefetch
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate

#******
*/