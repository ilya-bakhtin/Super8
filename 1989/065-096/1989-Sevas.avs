SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

LSMASHVideoSource("F:Media\video\Super8\Sources\1989\1 část - Res2K43.Aspect43In43.Speed18Fps.mov") +\
LSMASHVideoSource("F:Media\video\Super8\Sources\1989\2 čast - Res2K43.Aspect43In43.Speed18Fps.mov")
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
# skip (13486, 13497)
# 13785, 14161, 14283, 14568, 14974, 15275, 15325, 15624, 15791, 15921, 16186, 16411, 16558, 16622, 16752, 17133, 17378, 17762, # 76
# 18200, 18407, 18775, 18996, 19409, 19425, 19439, 19551, 19938, 20255, 20288, 20397, 20704, 20921, 21264, 21420, 21531, 21798, # 94
# skip (19425, 19439)
# 22004, 22317, 22518, 22761, 23304, 23432, 23436, 23606, 23709, 24024, 24206, 24498, 24564, 24569,
#                                           24570, 24771, 24888, 25224, 25421, 25732, 25889, 25947, 26222, 26356, 26662, 26924, # 112
#

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
top = top + 20
right = right - 46
bot = bot - 18

v65 = full.trim(15624, 15790)
v65 = v65.rotate(0.7)
v65 = v65.crop(left + 30, top + 20, right + 30, bot + 20)
v65 = v65.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v65.trim(3, 0)
va = BlankClip(v65, audio_rate = 48000, channels = 2).killVideo
v65 = v65.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v66 = full.trim(15791, 15920)
v66 = v66.rotate(0.9)
v66 = v66.crop(left + 30, top + 20, right + 30, bot + 20)
v66 = v66.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v66.trim(3, 0)
va = BlankClip(v66, audio_rate = 48000, channels = 2).killVideo
v66 = v66.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v67 = full.trim(15921, 16185)
v67 = v67.rotate(0.9)
v67 = v67.crop(left + 30, top + 20, right + 30, bot + 20)
v67 = v67.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v67.trim(3, 0)
va = BlankClip(v67, audio_rate = 48000, channels = 2).killVideo
v67 = v67.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v68 = full.trim(16186, 16410)
v68 = v68.rotate(0.9)
v68 = v68.crop(left + 30, top + 20, right + 30, bot + 20)
v68 = v68.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v68.trim(3, 0)
va = BlankClip(v68, audio_rate = 48000, channels = 2).killVideo
v68 = v68.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v69 = full.trim(16411, 16557)
v69 = v69.rotate(0.9)
v69 = v69.crop(left + 30, top + 20, right + 30, bot + 20)
v69 = v69.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v69.trim(3, 0)
va = BlankClip(v69, audio_rate = 48000, channels = 2).killVideo
v69 = v69.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v70 = full.trim(16558, 16621)
v70 = v70.rotate(0.9)
v70 = v70.crop(left + 30, top + 20, right + 30, bot + 20)
v70 = v70.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v70.trim(3, 0)
va = BlankClip(v70, audio_rate = 48000, channels = 2).killVideo
v70 = v70.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v71 = full.trim(16622, 16751)
v71 = v71.rotate(0.9)
v71 = v71.crop(left + 30, top + 20, right + 30, bot + 20)
v71 = v71.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v71.trim(3, 0)
#v71 = v71.correct_left_side(width = 400).correct_left_side(width = 200)
#v71_angle = -0.7
#v71 = v71.rotate(-v71_angle)
#return v71.adjustBorders.hist_levels.prefetch
va = BlankClip(v71, audio_rate = 48000, channels = 2).killVideo
v71 = v71.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v72 = full.trim(16752, 17132)
v72 = v72.rotate(0.9)
v72 = v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(0, 184) +\
      v72.crop(left + 30, top + 0, right + 30, bot + 0).trim(185, -1) +\
      v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(186, -1) +\
      v72.crop(left + 30, top + 0, right + 30, bot + 0).trim(187, -1) +\
      v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(188, 200) +\
      v72.crop(left + 30, top + 0, right + 30, bot + 0).trim(201, -1) +\
      v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(202, 203) +\
      v72.crop(left + 30, top + 0, right + 30, bot + 0).trim(204, 205) +\
      v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(206, 207) +\
      v72.crop(left + 30, top - 10, right + 30, bot - 10).trim(208, -1) +\
      v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(209, 210) +\
      v72.crop(left + 30, top - 10, right + 30, bot - 10).trim(211, -1) +\
      v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(212, 238) +\
      v72.crop(left + 30, top - 10, right + 30, bot - 10).trim(239, -1) +\
      v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(240, 328) +\
      v72.crop(left + 30, top - 0, right + 30, bot - 0).trim(329, -1) +\
      v72.crop(left + 30, top + 20, right + 30, bot + 20).trim(330, 0)
v72 = v72.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v72.trim(3, 0)
#v72 = v72.correct_left_side(width = 400).correct_left_side(width = 200)
#v72_angle = -0.7
#v72 = v72.rotate(-v72_angle)
#return v72.adjustBorders.hist_levels.prefetch
va = BlankClip(v72, audio_rate = 48000, channels = 2).killVideo
v72 = v72.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v73 = full.trim(17133, 17377)
#v73 = v73.rotate(0.9)
v73 = v73.crop(left + 30, top + 20, right + 30, bot + 20)
v73 = v73.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v73.trim(3, 0)
v73 = v73.trim(0, 210) + v73.trim(211, 0).correct_left_side(width = 400).correct_left_side(width = 200)
v73 = v73.trim(0, 217) + v73.trim(218, 228).deflickOverlappedInc(step = 200, toward_darkest = true, right2left = false) + v73.trim(229, 0)
#v73_angle = -0.7
#v73 = v73.rotate(-v73_angle)
#return v73.adjustBorders.hist_levels.prefetch
va = BlankClip(v73, audio_rate = 48000, channels = 2).killVideo
v73 = v73.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v74 = full.trim(17378, 17761)
v74 = v74.rotate(0.9)
v74 = v74.crop(left + 30, top + 20, right + 30, bot + 20)
#v74 = v74.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v74.trim(3, 0)
v74 = v74.trim(0, 43).correct_left_side(width = 400).correct_left_side(width = 200) +\
      v74.trim(44, 0)
#v74_angle = -0.7
#v74 = v74.rotate(-v74_angle)
#return v74.adjustBorders.hist_levels.prefetch
va = BlankClip(v74, audio_rate = 48000, channels = 2).killVideo
v74 = v74.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v75 = full.trim(17762, 18199)
v75 = v75.rotate(0.9)
v75 = v75.crop(left + 30, top + 20, right + 30, bot + 20)
v75 = v75.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v75.trim(3, 0)
va = BlankClip(v75, audio_rate = 48000, channels = 2).killVideo
v75 = v75.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v76 = full.trim(18200, 18406)
v76 = v76.rotate(0.9)
v76 = v76.crop(left + 30, top + 20, right + 30, bot + 20)
v76 = v76.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v76.trim(3, 0)
#v76 = v76.correct_left_side(width = 400).correct_left_side(width = 200)
#v76_angle = -0.7
#v76 = v76.rotate(-v76_angle)
#return v76.adjustBorders.hist_levels.prefetch
va = BlankClip(v76, audio_rate = 48000, channels = 2).killVideo
v76 = v76.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v77 = full.trim(18407, 18774)
v77 = v77.rotate(0.9)
v77 = v77.crop(left + 30, top + 20, right + 30, bot + 20)
v77 = v77.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v77.trim(3, 0)
va = BlankClip(v77, audio_rate = 48000, channels = 2).killVideo
v77 = v77.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v78 = full.trim(18775, 18995)
v78 = v78.rotate(0.9)
v78 = v78.crop(left + 30, top + 20, right + 30, bot + 20).trim(0, 77) +\
      v78.crop(left + 30, top - 100, right + 30, bot - 100).trim(78, -1) +\
      v78.crop(left + 30, top + 20, right + 30, bot + 20).trim(79, 0)
v78 = v78.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v78.trim(3, 0)
va = BlankClip(v78, audio_rate = 48000, channels = 2).killVideo
v78 = v78.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v79 = full.trim(18996, 19408)
v79 = v79.rotate(0.9)
v79 = v79.crop(left + 30, top + 20, right + 30, bot + 20).trim(0, 12) +\
      v79.crop(left + 30, top - 20, right + 30, bot - 20).trim(13, -1) +\
      v79.crop(left + 30, top + 20, right + 30, bot + 20).trim(14, 46) +\
      v79.crop(left + 30, top + 10, right + 30, bot + 10).trim(47, -1) +\
      v79.crop(left + 30, top + 20, right + 30, bot + 20).trim(48, 76) +\
      v79.crop(left + 30, top + 10, right + 30, bot + 10).trim(77, -1) +\
      v79.crop(left + 30, top + 20, right + 30, bot + 20).trim(78, 81) +\
      v79.crop(left + 30, top + 10, right + 30, bot + 10).trim(82, -1) +\
      v79.crop(left + 30, top + 20, right + 30, bot + 20).trim(83, 0)
v79 = v79.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v79.trim(3, 0)
v79 = v79.trim(0, 397) +\
      v79.trim(398, 404).deflickOverlappedInc(width = 400, step = 200, toward_darkest = true, right2left = true) +\
      v79.trim(405, 0)
#v79 = v79.correct_left_side(width = 400).correct_left_side(width = 200)
#v79_angle = -0.7
#v79 = v79.rotate(-v79_angle)
#return v79.adjustBorders.hist_levels.prefetch
va = BlankClip(v79, audio_rate = 48000, channels = 2).killVideo
v79 = v79.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v80 = full.trim(19409, 19424)
v80 = v80.rotate(0.9)
v80 = v80.crop(left + 30, top + 20, right + 30, bot + 20)
v80 = v80.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v80.trim(3, 0)
v80 = v80.correct_left_side(width = 400).correct_left_side(width = 200)
#v80_angle = -0.7
#v80 = v80.rotate(-v80_angle)
#return v80.adjustBorders.hist_levels.prefetch
va = BlankClip(v80, audio_rate = 48000, channels = 2).killVideo
v80 = v80.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v81 = full.trim(19439, 19550)
v81 = v81.rotate(0.9)
v81 = v81.crop(left + 30, top + 20, right + 30, bot + 20)
v81 = v81.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v81.trim(3, 0)
v81 = v81.trim(0, 47).correct_left_side(width = 400).correct_left_side(width = 200) +\
      v81.trim(48, 0)
va = BlankClip(v81, audio_rate = 48000, channels = 2).killVideo
v81 = v81.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 20
right = right - 46
bot = bot - 18

v82 = full.trim(19551, 19937)
v82 = v82.rotate(0.9)
v82 = v82.crop(left + 30, top + 0, right + 30, bot + 0)
v82 = v82.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v82.trim(3, 0)
#v82 = v82.correct_left_side(width = 400).correct_left_side(width = 200)
v82_angle = 0
#v82 = v82.rotate(-v82_angle)
#return v82.adjustBorders.hist_levels.prefetch
va = BlankClip(v82, audio_rate = 48000, channels = 2).killVideo
v82 = v82.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v83 = full.trim(19938, 20254)
v83 = v83.rotate(0.9)
v83 = v83.crop(left + 30, top + 0, right + 30, bot + 0)
v83 = v83.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v83.trim(3, 0)
#v83 = v83.correct_left_side(width = 400).correct_left_side(width = 200)
v83_angle = 0.
#v83 = v83.rotate(-v83_angle)
#return v83.adjustBorders.hist_levels.prefetch
va = BlankClip(v83, audio_rate = 48000, channels = 2).killVideo
v83 = v83.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v84 = full.trim(20255, 20287)
v84 = v84.rotate(0.9)
v84 = v84.crop(left + 30, top + 0, right + 30, bot + 0)
v84 = v84.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v84.trim(3, 0)
#v84 = v84.correct_left_side(width = 400).correct_left_side(width = 200)
v84_angle = 0.
#v84 = v84.rotate(-v84_angle)
#return v84.adjustBorders.hist_levels.prefetch
va = BlankClip(v84, audio_rate = 48000, channels = 2).killVideo
v84 = v84.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v85 = full.trim(20289, 20396)
v85 = v85.rotate(0.9)
v85 = v85.crop(left + 30, top + 0, right + 30, bot + 0)
v85 = v85.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v85.trim(3, 0)
#v85 = v85.correct_left_side(width = 400).correct_left_side(width = 200)
v85_angle = 0.
#v85 = v85.rotate(-v85_angle)
#return v85.adjustBorders.hist_levels.prefetch
va = BlankClip(v85, audio_rate = 48000, channels = 2).killVideo
v85 = v85.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v86 = full.trim(20397, 20703)
v86 = v86.rotate(0.9)
v86 = v86.crop(left + 30, top + 0, right + 30, bot + 0)
v86 = v86.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v86.trim(3, 0)
v86_angle = 0.
#return v86.adjustBorders.hist_levels.prefetch
va = BlankClip(v86, audio_rate = 48000, channels = 2).killVideo
v86 = v86.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v87 = full.trim(20704, 20920)
v87 = v87.rotate(0.9)
v87 = v87.crop(left + 30, top + 0, right + 30, bot + 0)
v87 = v87.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v87.trim(3, 0)
v87_angle = 0.
va = BlankClip(v87, audio_rate = 48000, channels = 2).killVideo
v87 = v87#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v88 = full.trim(20921, 21263)
#v88 = v88.rotate(0.9)
v88 = v88.crop(left + 30, top + 0, right + 30, bot + 0).trim(0, 192) +\
      v88.crop(left + 30, top - 30, right + 30, bot - 30).trim(193, -1) +\
      v88.crop(left + 30, top + 0, right + 30, bot + 0).trim(194, 222) +\
      v88.crop(left + 30, top - 20, right + 30, bot - 20).trim(223, 225) +\
      v88.crop(left + 30, top + 0, right + 30, bot + 0).trim(226, 0)
v88 = v88.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v88.trim(3, 0)
#v88 = v88.correct_left_side(width = 400).correct_left_side(width = 200)
v88_angle = 0.
#v88 = v88.rotate(-v88_angle)
#return v88.adjustBorders.hist_levels.prefetch
va = BlankClip(v88, audio_rate = 48000, channels = 2).killVideo
v88 = v88#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v89 = full.trim(21264, 21419)
v89 = v89.rotate(0.4)
v89_78 = v89.trim(77, -1).crop(0, 40, 0, -1036).colorYUV(off_y=10).stackVertical(v89.trim(78, -1).crop(0, 10, 0, 1086 - v89.height))
v89_79 = v89.trim(78, -1).crop(0, 950, 0, -166).colorYUV(off_y=16).stackVertical(v89.trim(79, -1).crop(0, 20, 0, 1136 - v89.height))
v89_118 = v89.trim(118, -1).crop(0, 870, 0, -100).stackVertical(v89.trim(118, -1).crop(0, 40, 0, 1010 - v89.height).colorYUV(off_y=-16))
v89_119 = v89.trim(119, -1).crop(0, 650, 0, -100).stackVertical(v89.trim(119, -1).crop(0, 20, 0, 770 - v89.height).colorYUV(off_y=-16))
v89_154 = v89.trim(154, -1).crop(0, 650, 0, -6).colorYUV(off_y=12).stackVertical(v89.trim(155, -1).crop(0, 10, 0, 666 - v89.height).colorYUV(off_y=-10))
v89_155 = v89.trim(155, -1).crop(0, 560, 0, -100).colorYUV(off_y=12).stackVertical(v89.trim(155, -1).crop(0, 20, 0, 680 - v89.height).colorYUV(off_y=-10))
v89 = v89.trim(0, 77) + v89_78 + v89_79 + v89.trim(80, 117) + v89_118 + v89_119 + v89.trim(120, 153) + v89_154 + v89_155
#return v89
v89 = v89.crop(left + 30, top - 20, right + 30, bot - 20).trim(0, 45) +\
      v89.crop(left + 30, top - 90, right + 30, bot - 90).trim(46, -1) +\
      v89.crop(left + 30, top - 20, right + 30, bot - 20).trim(47, 75) +\
      v89.crop(left + 30, top - 90, right + 30, bot - 90).trim(76, -1) +\
      v89.crop(left + 30, top + 10, right + 30, bot + 10).trim(77, -1) +\
      v89.crop(left + 30, top - 20, right + 30, bot - 20).trim(78, 116) +\
      v89.crop(left + 30, top - 70, right + 30, bot - 70).trim(117, -1) +\
      v89.crop(left + 30, top - 20, right + 30, bot - 20).trim(118, 152) +\
      v89.crop(left + 30, top - 70, right + 30, bot - 70).trim(153, -1) +\
      v89.crop(left + 30, top - 20, right + 30, bot - 20).trim(154, 0)
v89 = v89.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v89.trim(3, 0)
#v89 = v89.correct_left_side(width = 400).correct_left_side(width = 200)
#v89_angle = 0.
#v89 = v89.rotate(-v89_angle)
#return v89.adjustBorders.hist_levels.prefetch
va = BlankClip(v89, audio_rate = 48000, channels = 2).killVideo
v89 = v89#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v90 = full.trim(21420, 21530)
v90 = v90.rotate(0.9)
v90_66 = v90.trim(66, -1).crop(0, 1130, 0, -100).colorYUV(off_y=12).stackVertical(v90.trim(66, -1).crop(0, 20, 0, 1250 - v90.height).colorYUV(off_y=-10))
v90 = v90.trim(0, 65) + v90_66 + v90.trim(67, 0)
#return v90
v90 = v90.crop(left + 30, top - 0, right + 30, bot - 0)
#v90 = v90.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v90.trim(3, 0)
#v90 = v90.correct_left_side(width = 400).correct_left_side(width = 200)
#v90_angle = 0.
#v90 = v90.rotate(-v90_angle)
#return v90.adjustBorders.hist_levels.prefetch
va = BlankClip(v90, audio_rate = 48000, channels = 2).killVideo
v90 = v90#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v91 = full.trim(21531, 21797)
#v91 = v91.rotate(0.9)
#return v91
v91 = v91.crop(left + 30, top - 0, right + 30, bot - 0)
v91 = v91.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v91.trim(3, 0)
#v91 = v91.correct_left_side(width = 400).correct_left_side(width = 200)
#v91_angle = 0.
#v91 = v91.rotate(-v91_angle)
#return v91.adjustBorders.hist_levels.prefetch
va = BlankClip(v91, audio_rate = 48000, channels = 2).killVideo
v91 = v91#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v92 = full.trim(21798, 22003)
#v92 = v92.rotate(0.9)
#return v92
v92 = v92.crop(left + 30, top - 10, right + 30, bot - 10)
v92 = v92.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v92.trim(3, 0)
#v92 = v92.correct_left_side(width = 400).correct_left_side(width = 200)
v92_angle = 0.
#v92 = v92.rotate(-v92_angle)
#return v92.adjustBorders.hist_levels.prefetch
va = BlankClip(v92, audio_rate = 48000, channels = 2).killVideo
v92 = v92#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v93 = full.trim(22004, 22316)
v93_263 = v93.trim(263, -1).crop(0, 740, 0, -40).colorYUV(off_y=12).stackVertical(v93.trim(263, -1).crop(0, 170, 0, 950 - v93.height).colorYUV(off_y=-10))
v93 = v93.trim(0, 262) + v93_263 + v93.trim(264, 0)
v93 = v93.crop(left + 30, top - 10, right + 30, bot - 10)
v93 = v93.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v93.trim(3, 0)
v93_angle = 0.
va = BlankClip(v93, audio_rate = 48000, channels = 2).killVideo
v93 = v93#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v94 = full.trim(22317, 22517)
v94 = v94.crop(left + 30, top - 10, right + 30, bot - 10)
v94 = v94.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v94.trim(3, 0)
v94_angle = 0.
va = BlankClip(v94, audio_rate = 48000, channels = 2).killVideo
v94 = v94#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v95 = full.trim(22518, 22760)
v95 = v95.crop(left + 30, top - 10, right + 30, bot - 10)
v95 = v95.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v95.trim(3, 0)
v95_angle = 0.
va = BlankClip(v95, audio_rate = 48000, channels = 2).killVideo
v95 = v95#.audioDub(va)

left = lo
top = to
right = ro
bot = bo
*/
left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v96 = full.trim(22761, 23303)
#v96_263 = v96.trim(263, -1).crop(0, 740, 0, -40).colorYUV(off_y=12).stackVertical(v96.trim(263, -1).crop(0, 170, 0, 950 - v96.height).colorYUV(off_y=-10))
#v96 = v96.trim(0, 262) + v96_263 + v96.trim(264, 0)
v96 = v96.crop(left + 30, top - 10, right + 30, bot - 10)
v96 = v96.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v96.trim(3, v96.frameCount - 2) +\
      v96.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v96.frameCount - 1, 0)
#v96 = v96.correct_left_side(width = 400).correct_left_side(width = 200)
v96_angle = 0.
#v96 = v96.rotate(-v96_angle)
#return v96.adjustBorders.hist_levels.prefetch
va = BlankClip(v96, audio_rate = 48000, channels = 2).killVideo
v96 = v96#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

#global filter16 = true

import("..\common.avs")

/*

#******

# 65

v65 = LSMASHVideoSource(dst_dir + "v65f.mp4").ConvertToYV24()
b_ex = undefined
add_height = 200
v65 = v65.trim(133, -1).loop(v65.frameCount).crop(0, 0, 0, add_height - v65.height).stackVertical(v65)
v65 = v65.AdjustColor(ou = +16, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v65 = v65.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v65 = v65.crop(0, add_height, 0, 0)
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
v65 = v65.add_blank_audio
return v65.prefetch
#adjustframerate

function gamma_a(clip c, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}
v66 = LSMASHVideoSource(dst_dir + "v66f.mp4").ConvertToYV24()
b_ex = undefined
v66 = v66.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v66 = v66.colorYUV(off_u = -2, off_v = +2)
v66 = v66.animate(70, 129, "gamma_a", 0.5, 0.8)
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
v66 = v66.add_blank_audio
return v66.prefetch
#adjustframerate

v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
b_ex = undefined
v67 = v67.AdjustColor(ou = +14, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v67 = v67.colorYUV(off_u = -2, off_v = +2)
v67 = v67.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate

v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
b_ex = undefined
v68 = v68.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v68 = v68.colorYUV(off_u = -2, off_v = -2)
v68 = v68.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate

function gamma_a(clip c, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}
v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
b_ex = undefined
v69 = v69.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v69 = v69.colorYUV(off_u = -2, off_v = -2)
v69 = v69.animate(98, 102, "gamma_a", 0.9, 0.7)
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate

v70 = LSMASHVideoSource(dst_dir + "v70f.mp4").ConvertToYV24()
b_ex = undefined
v70 = v70.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v70 = v70.colorYUV(off_u = -2, off_v = +2)
v70 = v70.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.9)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
v70 = v70.add_blank_audio
return v70.prefetch
#adjustframerate

v71 = LSMASHVideoSource(dst_dir + "v71f.mp4").ConvertToYV24()
b_ex = undefined
v71 = v71.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v71 = v71.colorYUV(off_u = +2, off_v = -4)
v71 = v71.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v71 = v71.adjustSize
v71 = v71.assumeFPS(18)
v71 = v71.add_blank_audio
return v71.prefetch
#adjustframerate

v72 = LSMASHVideoSource(dst_dir + "v72f.mp4").ConvertToYV24()
b_ex = undefined
v72 = v72.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v72 = v72.colorYUV(off_u = -2, off_v = +2)
v72 = v72.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
v72 = v72.add_blank_audio
return v72.prefetch
#adjustframerate

v73 = LSMASHVideoSource(dst_dir + "v73f.mp4").ConvertToYV24()
b_ex = undefined
v73 = v73.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v73 = v73.colorYUV(off_u = -2, off_v = +2)
v73 = v73.adjustSize
v73 = v73.assumeFPS(18)
v73 = v73.add_blank_audio
return v73.prefetch
#adjustframerate

v74 = LSMASHVideoSource(dst_dir + "v74f.mp4").ConvertToYV24()
b_ex = undefined
v74 = v74.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v74 = v74.colorYUV(off_u = -2, off_v = +2)
v74 = v74.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
v74 = v74.add_blank_audio
return v74.prefetch
#adjustframerate

v75 = LSMASHVideoSource(dst_dir + "v75f.mp4").ConvertToYV24()
b_ex = undefined
v75 = v75.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v75 = v75.colorYUV(off_u = -2, off_v = +2)
v75 = v75.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
v75 = v75.add_blank_audio
return v75.prefetch
#adjustframerate

v76 = LSMASHVideoSource(dst_dir + "v76f.mp4").ConvertToYV24()
b_ex = undefined
v76 = v76.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=3., gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v76 = v76.colorYUV(off_u = -2, off_v = +2)
v76 = v76.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v76 = v76.adjustSize
v76 = v76.assumeFPS(18)
v76 = v76.add_blank_audio
return v76.prefetch
#adjustframerate

v77 = LSMASHVideoSource(dst_dir + "v77f.mp4").ConvertToYV24()
b_ex = undefined
v77 = v77.AdjustColor(ou = +13, ov = -7, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=3., gam_mac=true, b_expr=b_ex)
v77 = v77.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
v77 = v77.add_blank_audio
return v77.prefetch
#adjustframerate

v78 = LSMASHVideoSource(dst_dir + "v78f.mp4").ConvertToYV24()
b_ex = undefined
v78 = v78.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v78 = v78.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.9)
v78 = v78.adjustSize
v78 = v78.assumeFPS(18)
v78 = v78.add_blank_audio
return v78.prefetch
#adjustframerate

v79 = LSMASHVideoSource(dst_dir + "v79f.mp4").ConvertToYV24()
#v79 = v79.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
add_height = 200
v79 = v79.trim(399, -1).loop(v79.frameCount).crop(0, 0, 0, add_height - v79.height).stackVertical(v79)
#return v79.histogram.prefetch
v79 = v79.AdjustColor(ou = +12, ov = -5, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v79 = v79.colorYUV(off_u = -4, off_v = +4)
v79 = v79.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v79 = v79.crop(0, add_height, 0, 0)
v79 = v79.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
#return v79.hist_levels.prefetch
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
v79 = v79.add_blank_audio
return v79.prefetch
#adjustframerate

v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
b_ex = undefined
v80 = v80.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v80 = v80.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate

v81 = LSMASHVideoSource(dst_dir + "v81f.mp4").ConvertToYV24()
b_ex = undefined
v81 = v81.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v81 = v81.colorYUV(off_u = -2, off_v = +2)
v81 = v81.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
v81 = v81.add_blank_audio
return v81.prefetch
#adjustframerate

v82 = LSMASHVideoSource(dst_dir + "v82f.mp4").ConvertToYV24()
v82_i = v82
#v82 = v82.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v82 = v82.trim(399, -1).loop(v82.frameCount).crop(0, 0, 0, add_height - v82.height).stackVertical(v82)
#return v82.histogram.prefetch
v82 = v82.AdjustColor(ou = +26, ov = -16, x=100, y=10, w=-10, h=-200, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v82 = v82.colorYUV(off_u = -2, off_v = +2)
v82 = v82.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.5)
#v82 = v82.crop(0, add_height, 0, 0)
#v82 = v82.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
#return v82.hist_levels.prefetch
###
v82_0 = v82
v82 = v82_i
add_height = 100
v82 = v82.stackVertical(v82.trim(29, -1).loop(v82.frameCount).crop(0, 0, 0, add_height - v82.height))
v82 = v82.AdjustColor(ou = +26, ov = -16, x=v82.width*3/4, y=v82.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v82 = v82.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v82.frameCount, width = v82.width, height = v82.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v82 = v82_0.mt_merge(v82, mask, luma = true)
#return v82_0.interleave(v82).prefetch
###
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
v82 = v82.add_blank_audio
return v82.prefetch
#adjustframerate

v83 = LSMASHVideoSource(dst_dir + "v83f.mp4").ConvertToYV24()
b_ex = undefined
v83 = v83.AdjustColor(ou = +14, ov = -10, x=100, y=10, w=-10, h=-200, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v83 = v83.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.6, border_l=100, border_b=200)
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
v83 = v83.add_blank_audio
return v83.prefetch
#adjustframerate

v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
b_ex = undefined
v84 = v84.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v84 = v84.colorYUV(off_u = -2, off_v = +2)
v84 = v84.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate

v85 = LSMASHVideoSource(dst_dir + "v85f.mp4").ConvertToYV24()
b_ex = undefined
v85 = v85.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v85 = v85.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
v85 = v85.add_blank_audio
return v85.prefetch
#adjustframerate

v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
b_ex = undefined
v86 = v86.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v86 = v86.colorYUV(off_u = -2, off_v = +2)
v86 = v86.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3)
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate

v87 = LSMASHVideoSource(dst_dir + "v87f.mp4").ConvertToYV24()
b_ex = undefined
v87 = v87.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v87 = v87.colorYUV(off_u = -2, off_v = +2)
v87 = v87.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3)
v87 = v87.adjustSize
v87 = v87.assumeFPS(18)
v87 = v87.add_blank_audio
return v87.prefetch
#adjustframerate

v88 = LSMASHVideoSource(dst_dir + "v88f.mp4").ConvertToYV24()
b_ex = undefined
v88 = v88.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v88 = v88.colorYUV(off_u = -2, off_v = +2)
v88 = v88.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6)
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
v88 = v88.add_blank_audio
return v88.prefetch
#adjustframerate

v89 = LSMASHVideoSource(dst_dir + "v89f.mp4").ConvertToYV24()
b_ex = undefined
v89 = v89.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v89 = v89.colorYUV(off_u = -2, off_v = +2)
v89 = v89.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v89 = v89.adjustSize
v89 = v89.assumeFPS(18)
v89 = v89.add_blank_audio
return v89.prefetch
#adjustframerate

v90 = LSMASHVideoSource(dst_dir + "v90f.mp4").ConvertToYV24()
b_ex = undefined
v90 = v90.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v90 = v90.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v90 = v90.adjustSize
v90 = v90.assumeFPS(18)
v90 = v90.add_blank_audio
return v90.prefetch
#adjustframerate

function gamma_a(clip c, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}
v91 = LSMASHVideoSource(dst_dir + "v91f.mp4").ConvertToYV24()
v91_i = v91
b_ex = undefined
v91 = v91.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v91 = v91.colorYUV(off_u = -4, off_v = +4)
v91 = v91.animate(200, 220, "gamma_a", 0.3, 0.6)
###
v91_0 = v91
v91 = v91_i
v91 = v91.AdjustColor(ou = +14, ov = -8, x=v91.width*3/4, y=v91.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v91 = v91.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6, border_l=v91.width*3/4, border_t=v91.height*2/3)
mask = BlankClip(length = v91.frameCount, width = v91.width, height = v91.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
v91 = v91_0.mt_merge(v91, mask, luma = true)
###
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
v91 = v91.add_blank_audio
return v91.prefetch
#adjustframerate

function gamma_a(clip c, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}
v92 = LSMASHVideoSource(dst_dir + "v92f.mp4").ConvertToYV24()
v92_i = v92
#v92 = v92.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v92 = v92.trim(399, -1).loop(v92.frameCount).crop(0, 0, 0, add_height - v92.height).stackVertical(v92)
#return v92.histogram.prefetch
v92 = v92.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v92 = v92.colorYUV(off_u = -4, off_v = +4)
v92 = v92.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
#return v92.hist_levels.prefetch
#v92 = v92.animate(200, 220, "gamma_a", 0.3, 0.6)
#v92 = v92.crop(0, add_height, 0, 0)
#v92 = v92.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
###
v92_0 = v92
v92 = v92_i
add_height = 100
v92 = v92.stackVertical(v92.trim(100, -1).loop(v92.frameCount).crop(0, v92.height - add_height, 0, 0))
v92 = v92.AdjustColor(ou = +14, ov = -8, x=v92.width*3/4, y=v92.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v92 = v92.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5, border_l=v92.width*3/4, border_t=v92.height*2/3)
v92 = v92.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v92.frameCount, width = v92.width, height = v92.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v92 = v92_0.mt_merge(v92, mask, luma = true)
#return v92_0.interleave(v92).prefetch
###
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
v92 = v92.add_blank_audio
return v92.prefetch
#adjustframerate

v93 = LSMASHVideoSource(dst_dir + "v93f.mp4").ConvertToYV24()
v93_i = v93
v93 = v93.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
add_height = 200
v93 = v93.trim(113, -1).loop(v93.frameCount).crop(0, v93.height - add_height - 200, 0, -200).stackVertical(v93)
v93 = v93.AdjustColor(ou = +13, ov = -10, x=10, y=10, w=-10, h=-300, lo_th=0.4, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v93 = v93.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.4)
v93 = v93.crop(0, add_height, 0, 0)
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
v93 = v93.add_blank_audio
return v93.prefetch
#adjustframerate

v94 = LSMASHVideoSource(dst_dir + "v94f.mp4").ConvertToYV24()
v94_i = v94
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v94 = v94.AdjustColor(ou = +10, ov = -7, x=800, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v94 = v94.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.5)
v94 = v94.adjustSize
v94 = v94.assumeFPS(18)
v94 = v94.add_blank_audio
return v94.prefetch
#adjustframerate

v95 = LSMASHVideoSource(dst_dir + "v95f.mp4").ConvertToYV24()
v95_i = v95
#v95 = v95.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v95 = v95.trim(113, -1).loop(v95.frameCount).crop(0, v95.height - add_height - 200, 0, -200).stackVertical(v95)
#return v95.histogram.prefetch
v95 = v95.AdjustColor(ou = +10, ov = -7, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v95 = v95.colorYUV(off_u = -4, off_v = +4)
v95 = v95.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.5)
#v95 = v95.animate(200, 220, "gamma_a", 0.3, 0.6)
#v95 = v95.crop(0, add_height, 0, 0)
#return v95.hist_levels.prefetch
#v95 = v95.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
v95 = v95.adjustSize
v95 = v95.assumeFPS(18)
v95 = v95.add_blank_audio
return v95.prefetch
#adjustframerate

v96 = LSMASHVideoSource(dst_dir + "v96f.mp4").ConvertToYV24()
v96_i = v96
#v96 = v96.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v96 = v96.trim(113, -1).loop(v96.frameCount).crop(0, v96.height - add_height - 200, 0, -200).stackVertical(v96)
#return v96.histogram.prefetch
v96 = v96.AdjustColor(ou = +10, ov = -7, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v96 = v96.colorYUV(off_u = -4, off_v = +4)
v96 = v96.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
#v96 = v96.animate(200, 220, "gamma_a", 0.3, 0.6)
#v96 = v96.crop(0, add_height, 0, 0)
#return v96.hist_levels.prefetch
#v96 = v96.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
v96 = v96.adjustSize
v96 = v96.assumeFPS(18)
v96 = v96.add_blank_audio
return v96.prefetch
#adjustframerate

#******
*/