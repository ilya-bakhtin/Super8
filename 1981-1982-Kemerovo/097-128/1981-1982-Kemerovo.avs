SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

vs1 = LSMASHVideoSource("F:\Media\Video\Super8\Sources\1981-1982-Kemerovo\01.Res2K43.Aspect43In43.Speed16Fps.mov")
vs2 = LSMASHVideoSource("F:\Media\Video\Super8\Sources\1981-1982-Kemerovo\02.Res2K43.Aspect43In43.Speed16Fps.mov")
vs3 = LSMASHVideoSource("F:\Media\Video\Super8\Sources\1981-1982-Kemerovo\03.Res2K43.Aspect43In43.Speed16Fps.mov")
last = (vs1 + vs2 + vs3).assumefps(18)

full = last

crop(140, 150, -100, -30)

w = width
h = height
w = w*900/h
h = 900
#gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 183, 336, 421, 471, 590, 671, 763, 978, 1115, 1159, 1273, 1314, 1451, 1622, 1827, 2067, 2090, 2168, 2409, 2441, 2448,         # 20
#skip (2409, 2440) (2441, 2447)
# 2550, 2718, 2726, 2902, 2935, 2997, 3103, 3131, 3239, 3459, 3493, 3584, 3687, 3822, 4074, 4248, 4395, 4497, 4558, 4629,       # 40
# 4759, 5158, 5369, 5568, 5675, 5683, 5942, 6023, 6101, 6105, 6110, 6136, 6264, 6298, 6511, 6516, 6750, 6996, 7103, 7192,       # 60
#skip (5675, 5682)
# 7345, 7621, 7673, 8001, 8208, 8296, 8438, 8606, 8861, 8936, 8966, 9051, 9148, 9307, 9578, 9717, 9814, 9906, 10010, 10168,     # 80
#skip (8208, 8295)
# 10262, 10335, 10411, 10526, 10680, 10735, 10804, 10910, 10977, 11029, 11125, 11232, 11416, 11521, 11674, 11723, 11757, 11999, # 98
# 12140, 12292, 12382, 12547, 12846, 12917, 13006, 13008, 13158, 13366, 13393, 13540, 13625, 13698, 13876, 13966, 14004, 14040, # 116
#skip (13006, 13008)
# 14063, 14080, 14176, 14285, 14343, 14345, 14481, 14563, 14664, 14692, 14785, 14974, 15042, 15112, 15178, 15265, 15491, 15584, # 134
#skip (14343, 14344)

global src = last
#return last.autolevels(minRng=0, filterRadius=0, border_l = 200, border_t = 100, border_r = 200, border_b = 100, ignore_low = 0.03).colorYUV(autowhite=true, autogain=true)
#return full

left = 140
top = 150
right = -140
bot = -60
lo = left
ro = right
to = top
bo = bot
/*
v97 = full.trim(12292, 12381)
v97 = v97.crop(left + 64, top - 60, right - 0, bot - 108)
v97 = v97.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v97 = v97.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v97.trim(3, 0)
#v97 = v97.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v97 = v97.correct_left_side(width = 100).correct_left_side(width = 50)
#return v97.adjustBorders.hist_levels.prefetch

v98 = full.trim(12382, 12546)
v98 = v98.crop(left + 64, top - 60, right - 0, bot - 108)
v98 = v98.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
#v98 = v98.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v98.trim(3, 0)
v98 = v98.deflickOverlapped(width = 1000, step = 200, radius = 5, toward_darkest = true, right2left = false)
v98 = v98.correct_left_side(width = 200).correct_left_side(width = 100)
#return v98.adjustBorders.hist_levels.prefetch

v99 = full.trim(12547, 12845)
v99 = v99.crop(left + 64, top - 60, right - 0, bot - 108)
#v99 = v99.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v99 = v99.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v99.trim(3, 0)
v99 = v99.deflickOverlapped(width = 1000, step = 200, radius = 6, toward_darkest = true, right2left = false)
v99 = v99.correct_left_side(width = 200).correct_left_side(width = 100)
#return v99.adjustBorders.hist_levels.prefetch

v100 = full.trim(12846, 12916)
v100 = v100.crop(left + 64, top - 80, right - 0, bot - 128)
#v100 = v100.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v100 = v100.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v100.trim(3, 0)
v100 = v100.deflickOverlapped(width = 1500, step = 200, radius = 6, toward_darkest = true, right2left = false)
v100 = v100.correct_left_side(width = 200).correct_left_side(width = 100)
#return v100.adjustBorders.hist_levels.prefetch

v101 = full.trim(12917, 13005)
v101 = v101.crop(left + 64, top - 80, right - 0, bot - 128)
v101 = v101.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v101 = v101.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v101.trim(3, 0)
#v101 = v101.info
v101 = v101.deflickOverlapped(width = 1000, step = 200, radius = 7, toward_darkest = true, right2left = false).trim(0, 9) +\
       v101.trim(9, 15).deflickOverlappedInc(width = 1000, step = 200, toward_darkest = true, right2left = false).trim(1, 0) +\
       v101.trim(15, 21).deflickOverlappedInc(width = 1000, step = 200, toward_darkest = true, right2left = false).trim(1, 0) +\
       v101.trim(21, 72).deflickOverlapped(width = 1000, step = 200, radius = 7, toward_darkest = true, right2left = false).trim(1, 0) +\
       v101.trim(72, 78).deflickOverlappedInc(width = 1000, step = 200, toward_darkest = true, right2left = false).trim(1, 0) +\
       v101.trim(78, 85).deflickOverlappedInc(width = 1000, step = 200, toward_darkest = true, right2left = false).trim(1, 0) +\
       v101.trim(85, 0).deflickOverlappedFwd(width = 1000, step = 200, toward_darkest = true, right2left = false).trim(1, 0)
v101 = v101.correct_left_side(width = 200).correct_left_side(width = 100)
#return v101.adjustBorders.hist_levels.prefetch

v102 = full.trim(13008, 13157)
v102 = v102.crop(left + 64, top - 80, right - 0, bot - 128)
v102 = v102.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v102 = v102.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v102.trim(3, 0)
v102 = v102.deflickOverlapped(width = 1500, step = 200, radius = 7, toward_darkest = true, right2left = false)
v102 = v102.correct_left_side(width = 400).correct_left_side(width = 100)
#return v102.adjustBorders.hist_levels.prefetch

v103 = full.trim(13158, 13365)
v103 = v103.crop(left + 64, top - 80, right - 0, bot - 128)
v103 = v103.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v103 = v103.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v103.trim(3, 0)
v103 = v103.deflickOverlapped(width = 1500, step = 200, radius = 7, toward_darkest = true, right2left = false)
v103 = v103.correct_left_side(width = 400).correct_left_side(width = 100)
#return v103.adjustBorders.hist_levels.prefetch

v104 = full.trim(13366, 13392)
v104 = v104.crop(left + 64, top - 80, right - 0, bot - 128)
v104 = v104.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v104 = v104.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v104.trim(3, 0)
v104 = v104.deflickOverlapped(width = 1000, step = 200, radius = 7, toward_darkest = true, right2left = true)
v104 = v104.correct_left_side(width = 400).correct_left_side(width = 100)
#return v104.adjustBorders.hist_levels.prefetch

v105 = full.trim(13393, 13539)
v105 = v105.crop(left + 64, top - 80, right - 0, bot - 128)
v105 = v105.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v105 = v105.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v105.trim(3, 0)
v105 = v105.deflickOverlapped(width = 1000, step = 200, radius = 8, toward_darkest = true, right2left = true)
v105 = v105.correct_left_side(width = 400).correct_left_side(width = 100)
#return v105.adjustBorders.hist_levels.prefetch

v106 = full.trim(13540, 13624)
v106 = v106.crop(left + 64, top - 80, right - 0, bot - 128)
v106 = v106.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v106 = v106.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v106.trim(3, 0)
v106 = v106.deflickOverlapped(width = 1000, step = 200, radius = 8, toward_darkest = true, right2left = true)
v106 = v106.correct_left_side(width = 400).correct_left_side(width = 100)
#return v106.adjustBorders.hist_levels.prefetch

v107 = full.trim(13625, 13697)
v107 = v107.crop(left + 64, top - 80, right - 0, bot - 128)
v107 = v107.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v107 = v107.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v107.trim(3, 0)
v107 = v107.deflickOverlapped(width = 1500, step = 200, radius = 8, toward_darkest = true, right2left = true)
v107 = v107.correct_left_side(width = 400).correct_left_side(width = 100)
#return v107.adjustBorders.hist_levels.prefetch

v108 = full.trim(13698, 13875)
v108 = v108.crop(left + 64, top - 80, right - 0, bot - 128)
v108 = v108.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v108 = v108.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v108.trim(3, 0)
#v108 = v108.info
v108 = v108.trim(0, 138).deflickOverlapped(width = 1500, step = 200, radius = 8, toward_darkest = true, right2left = true) +\
       v108.trim(138, 147).deflickOverlappedInc(width = 1500, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
       v108.trim(147, 155).deflickOverlappedInc(width = 1500, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
       v108.trim(155, 163).deflickOverlappedInc(width = 1500, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
       v108.trim(163, 0).deflickOverlapped(width = 1500, step = 200, radius = 8, toward_darkest = true, right2left = true).trim(1, 0)
v108 = v108.correct_left_side(width = 400).correct_left_side(width = 100)
#return v108.adjustBorders.hist_levels.prefetch

v109 = full.trim(13876, 13965)
v109 = v109.crop(left + 64, top - 80, right - 0, bot - 128)
v109 = v109.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v109 = v109.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v109.trim(3, 0)
#v109 = v109.info
v109 = v109.deflickOverlapped(width = 1000, step = 200, radius = 9, toward_darkest = true, right2left = true).trim(0, 60) +\
       v109.trim(60, 69).deflickOverlappedInc(width = 1000, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
       v109.trim(69, 77).deflickOverlappedInc(width = 1000, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
       v109.deflickOverlapped(width = 1000, step = 200, radius = 9, toward_darkest = true, right2left = true).trim(78, 0)
v109 = v109.correct_left_side(width = 400).correct_left_side(width = 100)
#return v109.adjustBorders.hist_levels.prefetch

v110 = full.trim(13966, 14003)
v110 = v110.crop(left + 64, top - 80, right - 0, bot - 128)
v110 = v110.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v110 = v110.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v110.trim(3, 0)
v110 = v110.deflickOverlapped(width = 1500, step = 200, radius = 9, toward_darkest = true, right2left = true)
v110 = v110.correct_left_side(width = 400).correct_left_side(width = 100)
#return v110.adjustBorders.hist_levels.prefetch

v111 = full.trim(14004, 14039)
v111 = v111.crop(left + 64, top - 80, right - 0, bot - 128)
v111 = v111.trim(0, 18) +\
       v111.trim(18, 26).deflickOverlappedInc(width = 1500, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
       v111.trim(26, 0).deflickOverlappedInc(width = 1500, step = 200, toward_darkest = true, right2left = true).trim(1, 0)
#return v111.adjustBorders.hist_levels.prefetch

v112 = full.trim(14040, 14062)
v112 = v112.crop(left + 64, top - 80, right - 0, bot - 128)
v112 = v112.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v112 = v112.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v112.trim(3, 0)
v112 = v112.deflickOverlapped(width = 1500, step = 200, radius = 8, toward_darkest = true, right2left = true)
v112 = v112.correct_left_side(width = 400).correct_left_side(width = 100)
v112_angle = 2.
#return v112.adjustBorders.hist_levels.prefetch

v113 = full.trim(14063, 14079)
v113 = v113.crop(left + 64, top - 80, right - 0, bot - 128)
v113 = v113.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v113 = v113.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v113.trim(3, 0)
v113 = v113.deflickOverlapped(width = 1500, step = 200, radius = 8, toward_darkest = true, right2left = true)
v113 = v113.correct_left_side(width = 400).correct_left_side(width = 100)
v113_angle = 2.
#return v113.adjustBorders.hist_levels.prefetch

v114 = full.trim(14080, 14175)
v114 = v114.crop(left + 64, top - 80, right - 0, bot - 128)
v114 = v114.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v114 = v114.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v114.trim(3, 0)
v114 = v114.deflickOverlapped(width = 1500, step = 200, radius = 9, toward_darkest = true, right2left = true)
v114 = v114.correct_left_side(width = 400).correct_left_side(width = 100)
v114_angle = 2.
#return v114.adjustBorders.hist_levels.prefetch

v115 = full.trim(14176, 14284)
v115 = v115.crop(left + 64, top - 80, right - 0, bot - 128)
v115 = v115.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v115 = v115.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v115.trim(3, 0)
v115 = v115.deflickOverlapped(width = 1500, step = 200, radius = 9, toward_darkest = true, right2left = true)
v115 = v115.correct_left_side(width = 400).correct_left_side(width = 100)
#return v115.adjustBorders.hist_levels.prefetch

v116 = full.trim(14285, 14342)
v116 = v116.crop(left + 64, top - 80, right - 0, bot - 128)
v116 = v116.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v116 = v116.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v116.trim(3, 0)
v116 = v116.deflickOverlapped(width = 1500, step = 200, radius = 9, toward_darkest = true, right2left = true)
v116 = v116.correct_left_side(width = 400).correct_left_side(width = 100)
#return v116.adjustBorders.hist_levels.prefetch

v117 = full.trim(14345, 14480)
v117 = v117.crop(left + 64, top - 80, right - 0, bot - 128)
v117 = v117.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v117 = v117.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v117.trim(3, 0)
v117 = v117.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
v117 = v117.correct_left_side(width = 400).correct_left_side(width = 100)
#return v117.adjustBorders.hist_levels.prefetch

v118 = full.trim(14481, 14562)
v118 = v118.crop(left + 64, top - 80, right - 0, bot - 128)
#v118 = v118.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v118 = v118.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v118.trim(3, 0)
#v118 = v118.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
v118 = v118.correct_left_side(width = 400).correct_left_side(width = 100)
#return v118.adjustBorders.hist_levels.prefetch

v119 = full.trim(14564, 14663)
v119 = v119.crop(left + 84, top - 80, right + 20, bot - 128)
#v119 = v119.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v119 = v119.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v119.trim(3, 0)
#v119 = v119.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
v119 = v119.correct_left_side(width = 400).correct_left_side(width = 100)
#return v119.adjustBorders.hist_levels.prefetch

v120 = full.trim(14664, 14690)
v120 = v120.crop(left + 84, top - 80, right + 20, bot - 128)
#v120 = v120.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v120 = v120.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v120.trim(3, 0)
v120 = v120.deflickOverlapped(width = 600, step = 200, radius = 12, toward_darkest = true, right2left = true)
v120 = v120.correct_left_side(width = 400).correct_left_side(width = 100)
#return v120.adjustBorders.hist_levels.prefetch

v121 = full.trim(14692, 14784)
v121 = v121.crop(left + 84, top - 80, right + 20, bot - 128)
#v121 = v121.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v121 = v121.deflickOverlapped(step = 100, radius = 7, toward_darkest = true, right2left = false).trim(0, 7) +\
       v121.trim(8, 0)
#v121 = v121.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
v121 = v121.correct_left_side(width = 400).correct_left_side(width = 100)
v121_angle = 3.
#return v121.adjustBorders.hist_levels.prefetch

v122 = full.trim(14785, 14973)
v122 = v122.crop(left + 84, top - 80, right + 20, bot - 128)
v122 = v122.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v122 = v122.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v122.trim(3, 0)
#v122 = v122.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
#v122 = v122.correct_left_side(width = 400).correct_left_side(width = 100)
#return v122.adjustBorders.hist_levels.prefetch

v123 = full.trim(14974, 15041)
v123 = v123.crop(left + 84, top - 80, right + 20, bot - 128)
v123 = v123.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v123 = v123.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v123.trim(3, 0)
#v123 = v123.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
#v123 = v123.correct_left_side(width = 400).correct_left_side(width = 100)
#return v123.adjustBorders.hist_levels.prefetch

v124 = full.trim(15042, 15111)
v124 = v124.crop(left + 84, top - 80, right + 20, bot - 128)
#v124 = v124.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v124 = v124.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v124.trim(3, 0)
#v124 = v124.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
#v124 = v124.correct_left_side(width = 400).correct_left_side(width = 100)
#return v124.adjustBorders.hist_levels.prefetch

v125 = full.trim(15112, 15177)
v125 = v125.crop(left + 84, top - 80, right + 20, bot - 128)
#v125 = v125.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v125 = v125.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v125.trim(3, 0)
#v125 = v125.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
#v125 = v125.correct_left_side(width = 400).correct_left_side(width = 100)
v125_angle = 3.
#return v125.adjustBorders.hist_levels.prefetch

v126 = full.trim(15178, 15264)
v126 = v126.crop(left + 84, top - 80, right + 20, bot - 128)
v126 = v126.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v126 = v126.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v126.trim(3, 0)
#v126 = v126.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
#v126 = v126.correct_left_side(width = 400).correct_left_side(width = 100)
#return v126.adjustBorders.hist_levels.prefetch

v127 = full.trim(15266, 15490)
v127 = v127.crop(left + 84, top - 80, right + 20, bot - 128)
#v127 = v127.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
#v127 = v127.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#       v127.trim(3, 0)
#v127 = v127.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
#v127 = v127.correct_left_side(width = 400).correct_left_side(width = 100)
#return v127.adjustBorders.hist_levels.prefetch

# 14063, 14080, 14176, 14285, 14343, 14345, 14481, 14563, 14664, 14692, 14785, 14974, 15042, 15112, 15178, 15265, 15491, 15584, # 134
v128 = full.trim(15491, 15583)
v128 = v128.crop(left + 84, top - 80, right + 20, bot - 128)
#v128 = v128.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v128 = v128.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v128.trim(3, 0)
#v128 = v128.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
#v128 = v128.correct_left_side(width = 400).correct_left_side(width = 100)
#return v128.adjustBorders.hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*
#******

# 97

v97 = LSMASHVideoSource(dst_dir + "v97f.mp4").ConvertToYV24()
b_ex = undefined
v97o = v97
v97 = v97.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v97i = v97
v97 = expr(v97.extractY, v97.extractU, v97.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v97 = v97.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v97a = v97i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v97 = v97.colorYUV(off_u = -2, off_v = -2)
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
v97 = v97.add_blank_audio
return v97.prefetch
#adjustframerate

v98 = LSMASHVideoSource(dst_dir + "v98f.mp4").ConvertToYV24()
b_ex = undefined
v98o = v98
v98 = v98.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v98i = v98
v98 = expr(v98.extractY, v98.extractU, v98.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v98 = v98.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v98a = v98i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
v98 = v98.add_blank_audio
return v98.prefetch
#adjustframerate

v99 = LSMASHVideoSource(dst_dir + "v99f.mp4").ConvertToYV24()
v99 = v99.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v99o = v99
v99 = v99.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v99i = v99
v99 = expr(v99.extractY, v99.extractU, v99.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v99 = v99.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v99a = v99i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
v99 = v99.add_blank_audio
return v99.prefetch
#adjustframerate

v100 = LSMASHVideoSource(dst_dir + "v100f.mp4").ConvertToYV24()
b_ex = undefined
v100o = v100
v100 = v100.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v100i = v100
v100 = expr(v100.extractY, v100.extractU, v100.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v100 = v100.autolevels(filterRadius=0, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v100a = v100i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
v100 = v100.add_blank_audio
return v100.prefetch
#adjustframerate

v101 = LSMASHVideoSource(dst_dir + "v101f.mp4").ConvertToYV24()
b_ex = undefined
add_width = 100
v101 = v101.trim(87, -1).loop(v101.frameCount).crop(v101.width - add_width, 0, 0, 0).stackHorizontal(v101)
v101o = v101
v101 = v101.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v101i = v101
v101 = expr(v101.extractY, v101.extractU, v101.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v101 = v101.autolevels(filterRadius=0, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v101a = v101i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v101 = v101.crop(add_width, 0, 0, 0)
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
v101 = v101.add_blank_audio
return v101.prefetch
#adjustframerate

v102 = LSMASHVideoSource(dst_dir + "v102f.mp4").ConvertToYV24()
b_ex = undefined
v102o = v102
v102 = v102.AdjustColor(ou = -2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v102i = v102
v102 = expr(v102.extractY, v102.extractU, v102.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v102 = v102.autolevels(filterRadius=0, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v102a = v102i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v102 = v102.adjustSize
v102 = v102.assumeFPS(18)
v102 = v102.add_blank_audio
return v102.prefetch
#adjustframerate

v103 = LSMASHVideoSource(dst_dir + "v103f.mp4").ConvertToYV24()
b_ex = undefined
v103o = v103
v103 = v103.AdjustColor(ou = -2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v103i = v103
v103 = expr(v103.extractY, v103.extractU, v103.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v103 = v103.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.003, gamma=1.)
v103a = v103i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v103 = v103.adjustSize
v103 = v103.assumeFPS(18)
v103 = v103.add_blank_audio
return v103.prefetch
#adjustframerate

v104 = LSMASHVideoSource(dst_dir + "v104f.mp4").ConvertToYV24()
b_ex = undefined
v104o = v104
v104 = v104.AdjustColor(ou = -2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v104i = v104
v104 = expr(v104.extractY, v104.extractU, v104.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v104 = v104.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.003, gamma=1.)
v104a = v104i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v104 = v104.adjustSize
v104 = v104.assumeFPS(18)
v104 = v104.add_blank_audio
return v104.prefetch
#adjustframerate

v105 = LSMASHVideoSource(dst_dir + "v105f.mp4").ConvertToYV24()
b_ex = undefined
v105o = v105
v105 = v105.AdjustColor(ou = -2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v105i = v105
v105 = expr(v105.extractY, v105.extractU, v105.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v105 = v105.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.003, gamma=1.)
v105a = v105i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v105 = v105.adjustSize
v105 = v105.assumeFPS(18)
v105 = v105.add_blank_audio
return v105.prefetch
#adjustframerate

v106 = LSMASHVideoSource(dst_dir + "v106f.mp4").ConvertToYV24()
b_ex = undefined
v106o = v106
v106 = v106.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v106i = v106
v106 = expr(v106.extractY, v106.extractU, v106.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v106 = v106.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.003, gamma=1.)
v106a = v106i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v106 = v106.adjustSize
v106 = v106.assumeFPS(18)
v106 = v106.add_blank_audio
return v106.prefetch
#adjustframerate

v107 = LSMASHVideoSource(dst_dir + "v107f.mp4").ConvertToYV24()
b_ex = undefined
v107o = v107
v107 = v107.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v107i = v107
v107 = expr(v107.extractY, v107.extractU, v107.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v107 = v107.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.003, gamma=1.)
v107a = v107i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
v107 = v107.add_blank_audio
return v107.prefetch
#adjustframerate

v108 = LSMASHVideoSource(dst_dir + "v108f.mp4").ConvertToYV24()
b_ex = undefined
add_width = 200
v108 = v108.trim(3, -1).loop(v108.frameCount).crop(v108.width - add_width - 200, 0, -200, 0).stackHorizontal(v108)
v108o = v108
v108 = v108.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v108i = v108
v108 = expr(v108.extractY, v108.extractU, v108.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v108 = v108.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.003, gamma=1.)
v108a = v108i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v108 = v108.crop(add_width, 0, 0, 0)
v108i = v108i.crop(add_width, 0, 0, 0)
v108 = v108.adjustSize
v108 = v108.assumeFPS(18)
v108 = v108.add_blank_audio
return v108.prefetch
#adjustframerate

v109 = LSMASHVideoSource(dst_dir + "v109f.mp4").ConvertToYV24()
b_ex = undefined
v109o = v109
v109 = v109.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v109i = v109
v109 = expr(v109.extractY, v109.extractU, v109.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v109 = v109.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v109a = v109i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
v109 = v109.add_blank_audio
return v109.prefetch
#adjustframerate

v110 = LSMASHVideoSource(dst_dir + "v110f.mp4").ConvertToYV24()
b_ex = undefined
v110o = v110
v110 = v110.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v110i = v110
v110 = expr(v110.extractY, v110.extractU, v110.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v110 = v110.autolevels(filterRadius=9, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.)
v110a = v110i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v110 = v110.adjustSize
v110 = v110.assumeFPS(18)
v110 = v110.add_blank_audio
return v110.prefetch
#adjustframerate

v111 = LSMASHVideoSource(dst_dir + "v111f.mp4").ConvertToYV24()
b_ex = undefined
v111o = v111
v111 = v111.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v111i = v111
v111 = expr(v111.extractY, v111.extractU, v111.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v111 = v111.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v111a = v111i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
v111 = v111.add_blank_audio
return v111.prefetch
#adjustframerate

v112 = LSMASHVideoSource(dst_dir + "v112f.mp4").ConvertToYV24()
b_ex = undefined
v112o = v112
v112 = v112.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v112i = v112
v112 = expr(v112.extractY, v112.extractU, v112.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v112 = v112.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v112a = v112i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v112 = v112.adjustSize
v112 = v112.assumeFPS(18)
v112 = v112.add_blank_audio
return v112.prefetch
#adjustframerate

v113 = LSMASHVideoSource(dst_dir + "v113f.mp4").ConvertToYV24()
b_ex = undefined
v113o = v113
v113 = v113.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v113i = v113
v113 = expr(v113.extractY, v113.extractU, v113.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v113 = v113.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v113a = v113i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v113 = v113.adjustSize
v113 = v113.assumeFPS(18)
v113 = v113.add_blank_audio
return v113.prefetch
#adjustframerate

v114 = LSMASHVideoSource(dst_dir + "v114f.mp4").ConvertToYV24()
b_ex = undefined
v114o = v114
v114 = v114.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v114i = v114
v114 = expr(v114.extractY, v114.extractU, v114.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v114 = v114.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v114a = v114i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v114 = v114.adjustSize
v114 = v114.assumeFPS(18)
v114 = v114.add_blank_audio
return v114.prefetch
#adjustframerate

v115 = LSMASHVideoSource(dst_dir + "v115f.mp4").ConvertToYV24()
b_ex = undefined
v115o = v115
v115 = v115.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)#,\
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v115i = v115
v115 = expr(v115.extractY, v115.extractU, v115.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v115 = v115.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v115a = v115i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v115 = v115.adjustSize
v115 = v115.assumeFPS(18)
v115 = v115.add_blank_audio
return v115.prefetch
#adjustframerate

v116 = LSMASHVideoSource(dst_dir + "v116f.mp4").ConvertToYV24()
b_ex = undefined
v116o = v116
v116 = v116.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v116i = v116
v116 = expr(v116.extractY, v116.extractU, v116.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v116 = v116.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v116a = v116i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v116 = v116.adjustSize
v116 = v116.assumeFPS(18)
v116 = v116.add_blank_audio
return v116.prefetch
#adjustframerate

v117 = LSMASHVideoSource(dst_dir + "v117f.mp4").ConvertToYV24()
b_ex = undefined
v117o = v117
v117 = v117.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v117i = v117
v117 = expr(v117.extractY, v117.extractU, v117.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v117 = v117.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v117a = v117i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v117 = v117.adjustSize
v117 = v117.assumeFPS(18)
v117 = v117.add_blank_audio
return v117.prefetch
#adjustframerate

v118 = LSMASHVideoSource(dst_dir + "v118f.mp4").ConvertToYV24()
b_ex = undefined
v118o = v118
v118 = v118.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v118i = v118
v118 = expr(v118.extractY, v118.extractU, v118.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v118 = v118.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v118a = v118i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v118 = v118.adjustSize
v118 = v118.assumeFPS(18)
v118 = v118.add_blank_audio
return v118.prefetch
#adjustframerate

v119 = LSMASHVideoSource(dst_dir + "v119f.mp4").ConvertToYV24()
b_ex = undefined
v119o = v119
v119 = v119.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v119i = v119
v119 = expr(v119.extractY, v119.extractU, v119.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v119 = v119.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v119a = v119i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v119 = v119.adjustSize
v119 = v119.assumeFPS(18)
v119 = v119.add_blank_audio
return v119.prefetch
#adjustframerate

v120 = LSMASHVideoSource(dst_dir + "v120f.mp4").ConvertToYV24()
b_ex = undefined
v120o = v120
v120 = v120.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v120i = v120
v120 = expr(v120.extractY, v120.extractU, v120.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v120 = v120.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v120a = v120i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v120 = v120.adjustSize
v120 = v120.assumeFPS(18)
v120 = v120.add_blank_audio
return v120.prefetch
#adjustframerate

v121 = LSMASHVideoSource(dst_dir + "v121f.mp4").ConvertToYV24()
b_ex = undefined
add_width = 200
v121 = v121.trim(81, -1).loop(v121.frameCount).crop(v121.width - add_width, 0, 0, 0).stackHorizontal(v121)
v121o = v121
v121 = v121.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v121i = v121
v121 = expr(v121.extractY, v121.extractU, v121.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v121 = v121.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v121a = v121i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v121 = v121.crop(add_width, 0, 0, 0)
v121i = v121i.crop(add_width, 0, 0, 0)
v121 = v121.adjustSize
v121 = v121.assumeFPS(18)
v121 = v121.add_blank_audio
return v121.prefetch
#adjustframerate

v122 = LSMASHVideoSource(dst_dir + "v122f.mp4").ConvertToYV24()
b_ex = undefined
v122o = v122
v122 = v122.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v122i = v122
v122 = expr(v122.extractY, v122.extractU, v122.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v122 = v122.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v122a = v122i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v122 = v122.adjustSize
v122 = v122.assumeFPS(18)
v122 = v122.add_blank_audio
return v122.prefetch
#adjustframerate

v123 = LSMASHVideoSource(dst_dir + "v123f.mp4").ConvertToYV24()
b_ex = undefined
v123o = v123
v123 = v123.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v123i = v123
v123 = expr(v123.extractY, v123.extractU, v123.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v123 = v123.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v123a = v123i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v123 = v123.adjustSize
v123 = v123.assumeFPS(18)
v123 = v123.add_blank_audio
return v123.prefetch
#adjustframerate

v124 = LSMASHVideoSource(dst_dir + "v124f.mp4").ConvertToYV24()
b_ex = undefined
add_width = 300
v124 = v124.trim(3, -1).loop(v124.frameCount).crop(0, 0, -(v124.width - add_width), 0).stackHorizontal(v124)
v124o = v124
v124 = v124.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v124i = v124
v124 = expr(v124.extractY, v124.extractU, v124.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v124 = v124.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v124a = v124i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v124 = v124.crop(add_width, 0, 0, 0)
v124i = v124i.crop(add_width, 0, 0, 0)
v124 = v124.colorYUV(off_u = +2, off_v = -2)
v124 = v124.adjustSize
v124 = v124.assumeFPS(18)
v124 = v124.add_blank_audio
return v124.prefetch
#adjustframerate

v125 = LSMASHVideoSource(dst_dir + "v125f.mp4").ConvertToYV24()
b_ex = undefined
v125o = v125
v125 = v125.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v125i = v125
v125 = expr(v125.extractY, v125.extractU, v125.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v125 = v125.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v125a = v125i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v125 = v125.colorYUV(off_u = +4, off_v = -4)
v125 = v125.adjustSize
v125 = v125.assumeFPS(18)
v125 = v125.add_blank_audio
return v125.prefetch
#adjustframerate

v126 = LSMASHVideoSource(dst_dir + "v126f.mp4").ConvertToYV24()
b_ex = undefined
v126o = v126
v126 = v126.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v126i = v126
v126 = expr(v126.extractY, v126.extractU, v126.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v126 = v126.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v126a = v126i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v126 = v126.adjustSize
v126 = v126.assumeFPS(18)
v126 = v126.add_blank_audio
return v126.prefetch
#adjustframerate

v127 = LSMASHVideoSource(dst_dir + "v127f.mp4").ConvertToYV24()
b_ex = undefined
add_width = 200
v127 = v127.trim(105, -1).loop(v127.frameCount).crop(0, 0, -(v127.width - add_width), 0).stackHorizontal(v127)
v127o = v127
v127 = v127.AdjustColor(ou = -0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v127i = v127
v127 = expr(v127.extractY, v127.extractU, v127.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v127 = v127.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v127a = v127i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v127 = v127.crop(add_width, 0, 0, 0)
v127i = v127i.crop(add_width, 0, 0, 0)
#v127 = v127.colorYUV(off_u = +1, off_v = -1)
v127 = v127.adjustSize
v127 = v127.assumeFPS(18)
v127 = v127.add_blank_audio
return v127.prefetch
#adjustframerate

v128 = LSMASHVideoSource(dst_dir + "v128f.mp4").ConvertToYV24()
#v128 = v128.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v128 = v128.trim(105, -1).loop(v128.frameCount).crop(0, 0, -(v128.width - add_width), 0).stackHorizontal(v128)
#return v128.histogram.prefetch
v128o = v128
v128 = v128.AdjustColor(ou = -0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v128.hist_levels.prefetch
#v128 = v128.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v128 = expr(v128.extractY, v128.extractU, v128.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v128i = v128
v128 = expr(v128.extractY, v128.extractU, v128.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v128 = v128.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v128a = v128i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v128 = v128.crop(add_width, 0, 0, 0)
#v128i = v128i.crop(add_width, 0, 0, 0)
#v128a = v128a.crop(add_width, 0, 0, 0)
#v128 = v128.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v128 = v128.colorYUV(off_u = +1, off_v = -1)
#v128 = v128i
#return v128i.interleave(v128).hist_levels.prefetch
v128 = v128.adjustSize
v128 = v128.assumeFPS(18)
v128 = v128.add_blank_audio
return v128.prefetch
#adjustframerate

#******
*/