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
# 12140, 12292, 12382, 12547, 12846, 13006, 13008, 13158, 13366, 13393, 13540, 13625, 13698, 13876, 13966, 14004, 14040, 14063, # 116
# 14080, 14176, 

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
v65 = full.trim(8606, 8860)
v65 = v65.crop(left + 64, top - 60, right - 0, bot - 108)
v65 = v65.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v65 = v65.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v65.trim(3, 0)
v65 = v65.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = false)
v65 = v65.correct_left_side(width = 200).correct_left_side(width = 100)
#return v65.adjustBorders.hist_levels.prefetch

v66 = full.trim(8861, 8935)
v66 = v66.crop(left + 64, top - 60, right - 0, bot - 108)
v66 = v66.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v66 = v66.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v66.trim(3, 0)
v66 = v66.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = false)
v66 = v66.correct_left_side(width = 200).correct_left_side(width = 100)
#return v66.adjustBorders.hist_levels.prefetch

v67 = full.trim(8936, 8965)
v67 = v67.crop(left + 64, top - 60, right - 0, bot - 108)
v67 = v67.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v67 = v67.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v67.trim(3, 0)
v67 = v67.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = false)
v67 = v67.correct_left_side(width = 200).correct_left_side(width = 100)
#return v67.adjustBorders.hist_levels.prefetch

v68 = full.trim(8966, 9050)
#v68 = full.trim(8966, 9147)
v68 = v68.crop(left + 64, top - 60, right - 0, bot - 108)
v68 = v68.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v68 = v68.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v68.trim(3, 0)
v68 = v68.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = false)
v68 = v68.correct_left_side(width = 200).correct_left_side(width = 100)
#return v68.adjustBorders.hist_levels.prefetch

#v69 = full.trim(8966, 9050)
v69 = full.trim(9051, 9147)
v69 = v69.crop(left + 64, top - 60, right - 0, bot - 108)
v69 = v69.autolevels(input_low = 0, output_low = 24, input_high = 231, output_high = 255, autolevel = false)
v69 = v69.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v69.trim(3, 0)
v69 = v69.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = false)
v69 = v69.correct_left_side(width = 200).correct_left_side(width = 100)
#return v69.adjustBorders.hist_levels.prefetch

v70 = full.trim(9148, 9306)
v70 = v70.crop(left + 64, top - 40, right - 0, bot - 88)
v70 = v70.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v70 = v70.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v70.trim(3, 0)
v70 = v70.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = false)
v70 = v70.correct_left_side(width = 200).correct_left_side(width = 100)
#return v70.adjustBorders.hist_levels.prefetch

v71 = full.trim(9307, 9577)
v71 = v71.crop(left + 64, top - 60, right - 0, bot - 108)
v71 = v71.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v71 = v71.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v71.trim(3, 0)
v71 = v71.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = false)
v71 = v71.correct_left_side(width = 200).correct_left_side(width = 100)
#return v71.adjustBorders.hist_levels.prefetch

v72 = full.trim(9578, 9716)
v72 = v72.crop(left + 64, top - 60, right - 0, bot - 108)
v72 = v72.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v72 = v72.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v72.trim(3, 0)
v72 = v72.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = false).trim(0, 128) +\
      v72.trim(129, 0)
v72 = v72.correct_left_side(width = 200).correct_left_side(width = 100)
#return v72.adjustBorders.hist_levels.prefetch

v73 = full.trim(9717, 9813)
v73 = v73.crop(left + 64, top - 60, right - 0, bot - 108)
v73 = v73.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v73 = v73.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v73.trim(3, 0)
v73 = v73.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = false)
v73 = v73.correct_left_side(width = 200).correct_left_side(width = 100)
#return v73.adjustBorders.hist_levels.prefetch

v74 = full.trim(9814, 9905)
v74 = v74.crop(left + 64, top - 60, right - 0, bot - 108)
#v74 = v74.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v74 = v74.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v74.trim(3, 0)
v74 = v74.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = false)
v74 = v74.correct_left_side(width = 200).correct_left_side(width = 100)
#return v74.adjustBorders.hist_levels.prefetch

v75 = full.trim(9906, 10009)
v75 = v75.crop(left + 64, top - 60, right - 0, bot - 108)
v75 = v75.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v75 = v75.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v75.trim(3, 0)
v75 = v75.trim(0, 54).deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false).\
                      correct_left_side(width = 200).correct_left_side(width = 100) +\
      v75.trim(55, 74) +\
      v75.trim(75, 0).deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false).\
                      correct_left_side(width = 200).correct_left_side(width = 100)
#v75 = v75.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = false)
#v75 = v75.correct_left_side(width = 200).correct_left_side(width = 100)
#return v75.adjustBorders.hist_levels.prefetch

v76 = full.trim(10010, 10167)
v76 = v76.crop(left + 64, top - 60, right - 0, bot - 108)
v76 = v76.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v76 = v76.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v76.trim(3, 0)
v76o = v76
v76 = v76.trim(0, 52) + v76.trim(51, 52) + v76.trim(55, 65) + v76.trim(64, 65) + v76.trim(68, 0)
v76 = v76.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
v76 = v76.correct_left_side(width = 200).correct_left_side(width = 100)
v76 = v76.trim(0, 52) + v76o.trim(53, 54) + v76.trim(55, 65) + v76o.trim(66, 67) + v76.trim(68, 0)
#return v76.adjustBorders.hist_levels.prefetch

v77 = full.trim(10168, 10261)
v77 = v77.crop(left + 64, top - 60, right - 0, bot - 108)
v77 = v77.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v77fc = v77.frameCount
v77 = v77.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v77.trim(3, v77fc - 2) +\
      v77.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v77fc - 1, 0)
v77o = v77
v77 = v77.trim(0, 39) + v77.trim(39, -1) + v77.trim(41, 0)#46) + v77.trim(46, -1) + v77.trim(48, 0)
v77 = v77.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
v77 = v77.correct_left_side(width = 200).correct_left_side(width = 100)
v77 = v77.trim(0, 39) + v77o.trim(40, -1) + v77.trim(41, 0)#46) + v77o.trim(47, -1) + v77.trim(48, 0)
#return v77.adjustBorders.hist_levels.prefetch

v78 = full.trim(10262, 10334)
v78 = v78.crop(left + 64, top - 0, right - 0, bot - 48)
v78 = v78.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v78 = v78.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v78.trim(3, 0)
#v78 = v78.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
v78 = v78.correct_left_side(width = 200).correct_left_side(width = 100)
#return v78.adjustBorders.hist_levels.prefetch

v79 = full.trim(10335, 10410)
v79 = v79.crop(left + 64, top - 60, right - 0, bot - 108)
#v79 = v79.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
#v79 = v79.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v79.trim(3, 0)
v79 = v79.deflickOverlapped(width = 800, step = 200, radius = 9, toward_darkest = true, right2left = true)
v79 = v79.correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100)
#return v79.adjustBorders.hist_levels.prefetch

v80 = full.trim(10411, 10525)
v80 = v80.crop(left + 64, top - 60, right - 0, bot - 108)
v80 = v80.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v80 = v80.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v80.trim(3, 0)
#v80 = v80.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
v80 = v80.correct_left_side(width = 200).correct_left_side(width = 100)
#return v80.adjustBorders.hist_levels.prefetch

v81 = full.trim(10526, 10679)
v81 = v81.crop(left + 64, top - 60, right - 0, bot - 108)
#v81 = v81.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v81 = v81.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v81.trim(3, 0)
#v81 = v81.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v81 = v81.correct_left_side(width = 200).correct_left_side(width = 100)
#return v81.adjustBorders.hist_levels.prefetch

v82 = full.trim(10680, 10734)
v82 = v82.crop(left + 64, top - 60, right - 0, bot - 108)
#v82 = v82.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v82 = v82.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v82.trim(3, 0)
#v82 = v82.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v82 = v82.correct_left_side(width = 200).correct_left_side(width = 100)
#return v82.adjustBorders.hist_levels.prefetch

v83 = full.trim(10735, 10803)
v83 = v83.crop(left + 64, top - 60, right - 0, bot - 108)
#v83 = v83.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v83 = v83.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v83.trim(3, 0)
#v83 = v83.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v83 = v83.correct_left_side(width = 200).correct_left_side(width = 100)
#return v83.adjustBorders.hist_levels.prefetch

v84 = full.trim(10804, 10909)
v84 = v84.crop(left + 64, top - 60, right - 0, bot - 108)
#v84 = v84.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v84 = v84.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v84.trim(3, 0)
#v84 = v84.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
v84 = v84.correct_left_side(width = 100).correct_left_side(width = 50)
#return v84.adjustBorders.hist_levels.prefetch

#                                             83            85            87           89
# 10335, 10411, 10526, 10680, 10735, 10804, 10910, 10977, 11029, 11232, 11416, 11521, 11674, 11723, 11757, 11999, 12140, 12292, # 98
v85 = full.trim(10910, 10976)
v85 = v85.crop(left + 64, top - 60, right - 0, bot - 108)
#v85 = v85.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v85 = v85.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v85.trim(3, 0)
#v85 = v85.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
v85 = v85.correct_left_side(width = 100).correct_left_side(width = 50)
#return v85.adjustBorders.hist_levels.prefetch

v86 = full.trim(10977, 11028)
v86 = v86.crop(left + 64, top - 60, right - 0, bot - 108)
v86 = v86.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v86 = v86.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v86.trim(3, 0)
#v86 = v86.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
v86 = v86.correct_left_side(width = 100).correct_left_side(width = 50)
#return v86.adjustBorders.hist_levels.prefetch

v87 = full.trim(11029, 11124)
v87 = v87.crop(left + 64, top - 60, right - 0, bot - 108)
v87 = v87.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v87 = v87.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v87.trim(3, 0)
#v87 = v87.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v87 = v87.correct_left_side(width = 100).correct_left_side(width = 50)
#return v87.adjustBorders.hist_levels.prefetch

v88 = full.trim(11125, 11231)
v88 = v88.crop(left + 64, top - 60, right - 0, bot - 108)
v88 = v88.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v88 = v88.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v88.trim(3, 0)
#v88 = v88.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v88 = v88.correct_left_side(width = 100).correct_left_side(width = 50)
#return v88.adjustBorders.hist_levels.prefetch

v89 = full.trim(11232, 11415)
v89 = v89.crop(left + 64, top - 60, right - 0, bot - 108)
v89 = v89.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v89 = v89.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v89.trim(3, 0)
#v89 = v89.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v89 = v89.correct_left_side(width = 100).correct_left_side(width = 50)
#return v89.adjustBorders.hist_levels.prefetch

v90 = full.trim(11416, 11520)
v90 = v90.crop(left + 64, top - 60, right - 0, bot - 108)
v90 = v90.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v90fc = v90.frameCount
v90 = v90.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v90.trim(3, v90fc - 2) +\
      v90.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v90fc - 1, 0)
#v90 = v90.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v90 = v90.correct_left_side(width = 100).correct_left_side(width = 50)
#return v90.adjustBorders.hist_levels.prefetch

v91 = full.trim(11521, 11673)
v91 = v91.crop(left + 64, top - 60, right - 0, bot - 108)
v91 = v91.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v91 = v91.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v91.trim(3, 0)
#v91 = v91.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v91 = v91.correct_left_side(width = 100).correct_left_side(width = 50)
#return v91.adjustBorders.hist_levels.prefetch

v92 = full.trim(11674, 11722)
v92 = v92.crop(left + 64, top - 60, right - 0, bot - 108)
v92 = v92.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v92 = v92.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v92.trim(3, 0)
#v92 = v92.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v92 = v92.correct_left_side(width = 100).correct_left_side(width = 50)
#return v92.adjustBorders.hist_levels.prefetch

v93 = full.trim(11723, 11756)
v93 = v93.crop(left + 64, top - 60, right - 0, bot - 108)
v93 = v93.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v93fc = v93.frameCount
v93 = v93.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v93.trim(3, v93fc - 2) +\
      v93.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v93fc - 1, 0)
#v93 = v93.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v93.trim(3, 0)
#v93 = v93.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v93 = v93.correct_left_side(width = 100).correct_left_side(width = 50)
#return v93.adjustBorders.hist_levels.prefetch

v94 = full.trim(11757, 11998)
v94 = v94.crop(left + 64, top - 60, right - 0, bot - 108)
#v94 = v94.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v94 = v94.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v94.trim(3, 0)
#v94 = v94.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v94 = v94.correct_left_side(width = 100).correct_left_side(width = 50)
v94_angle = 3.
#return v94.adjustBorders.hist_levels.prefetch

v95 = full.trim(11999, 12139)
v95 = v95.crop(left + 64, top - 60, right - 0, bot - 108)
v95 = v95.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v95 = v95.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v95.trim(3, 0)
#v95 = v95.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v95 = v95.correct_left_side(width = 100).correct_left_side(width = 50)
v95_angle = 3.
#return v95.adjustBorders.hist_levels.prefetch

v96 = full.trim(12140, 12291)
v96 = v96.crop(left + 64, top - 60, right - 0, bot - 108)
v96 = v96.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v96 = v96.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v96.trim(3, 0)
#v96 = v96.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = false)
#v96 = v96.correct_left_side(width = 100).correct_left_side(width = 50)
#return v96.adjustBorders.hist_levels.prefetch

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
*/
/*
# 12382, 12547, 12846, 13006, 13008, 13158, 13366, 13393, 13540, 13625, 13698, 13876, 13966, 14004, 14040, 14063, 14080, 14176, # 116
v99 = full.trim(12547, 12845)
v99 = v99.crop(left + 64, top + 0, right - 0, bot - 48)
#v99 = v99.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v99 = v99.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v99.trim(3, 0)
v99 = v99.deflickOverlapped(width = 1000, step = 200, radius = 6, toward_darkest = true, right2left = false)
v99 = v99.correct_left_side(width = 200).correct_left_side(width = 100)
#return v99.adjustBorders.hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*
#******

# 65

v65 = LSMASHVideoSource(dst_dir + "v65f.mp4").ConvertToYV24()
b_ex = undefined
v65o = v65
v65 = v65.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v65i = v65
v65 = expr(v65.extractY, v65.extractU, v65.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v65 = v65.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v65a = v65i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
v65 = v65.add_blank_audio
return v65.prefetch
#adjustframerate

v66 = LSMASHVideoSource(dst_dir + "v66f.mp4").ConvertToYV24()
b_ex = undefined
v66o = v66
v66 = v66.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v66i = v66
v66 = expr(v66.extractY, v66.extractU, v66.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v66 = v66.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v66a = v66i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
v66 = v66.add_blank_audio
return v66.prefetch
#adjustframerate

v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
b_ex = undefined
v67o = v67
v67 = v67.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v67i = v67
v67 = expr(v67.extractY, v67.extractU, v67.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v67 = v67.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v67a = v67i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate

v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
b_ex = undefined
v68o = v68
v68 = v68.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v68i = v68
v68 = expr(v68.extractY, v68.extractU, v68.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v68 = v68.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v68a = v68i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v68 = v68.colorYUV(off_u = -4, off_v = -4)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate

v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
b_ex = undefined
v69o = v69
v69 = v69.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v69i = v69
v69 = expr(v69.extractY, v69.extractU, v69.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v69 = v69.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v69a = v69i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v69 = v69.colorYUV(off_u = -4, off_v = -4)
#return v69i.interleave(v69).hist_levels.prefetch
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate

v70 = LSMASHVideoSource(dst_dir + "v70f.mp4").ConvertToYV24()
b_ex = undefined
v70o = v70
v70 = v70.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v70i = v70
v70 = expr(v70.extractY, v70.extractU, v70.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v70 = v70.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v70a = v70i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v70 = v70.colorYUV(off_u = -4, off_v = -4)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
v70 = v70.add_blank_audio
return v70.prefetch
#adjustframerate

v71 = LSMASHVideoSource(dst_dir + "v71f.mp4").ConvertToYV24()
b_ex = undefined
v71o = v71
v71 = v71.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v71i = v71
v71 = expr(v71.extractY, v71.extractU, v71.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v71 = v71.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v71a = v71i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v71 = v71.colorYUV(off_u = -2, off_v = -2)
v71 = v71.adjustSize
v71 = v71.assumeFPS(18)
v71 = v71.add_blank_audio
return v71.prefetch
#adjustframerate

v72 = LSMASHVideoSource(dst_dir + "v72f.mp4").ConvertToYV24()
b_ex = undefined
v72o = v72
v72 = v72.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.18 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v72i = v72
v72 = expr(v72.extractY, v72.extractU, v72.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v72 = v72.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v72a = v72i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v72 = v72.colorYUV(off_u = -2, off_v = -2)
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
v72 = v72.add_blank_audio
return v72.prefetch
#adjustframerate

v73 = LSMASHVideoSource(dst_dir + "v73f.mp4").ConvertToYV24()
b_ex = undefined
v73o = v73
v73 = v73.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v73i = v73
v73 = expr(v73.extractY, v73.extractU, v73.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v73 = v73.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v73a = v73i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v73 = v73.colorYUV(off_u = -2, off_v = -2)
v73 = v73.adjustSize
v73 = v73.assumeFPS(18)
v73 = v73.add_blank_audio
return v73.prefetch
#adjustframerate

v74 = LSMASHVideoSource(dst_dir + "v74f.mp4").ConvertToYV24()
b_ex = undefined
v74o = v74
v74 = v74.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v74i = v74
v74 = expr(v74.extractY, v74.extractU, v74.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v74 = v74.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v74a = v74i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v74 = v74.colorYUV(off_u = -2, off_v = -2)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
v74 = v74.add_blank_audio
return v74.prefetch
#adjustframerate

v75 = LSMASHVideoSource(dst_dir + "v75f.mp4").ConvertToYV24()
b_ex = undefined
v75o = v75
v75 = v75.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v75i = v75
v75 = expr(v75.extractY, v75.extractU, v75.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v75 = v75.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v75a = v75i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v75 = v75.colorYUV(off_u = -2, off_v = -2)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
v75 = v75.add_blank_audio
return v75.prefetch
#adjustframerate

v76 = LSMASHVideoSource(dst_dir + "v76f.mp4").ConvertToYV24()
b_ex = undefined
v76o = v76
v76 = v76.AdjustColor(ou = +3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v76i = v76
v76 = expr(v76.extractY, v76.extractU, v76.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v76 = v76.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v76a = v76i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v76 = v76.colorYUV(off_u = -2, off_v = -2)
v76 = v76.adjustSize
v76 = v76.assumeFPS(18)
v76 = v76.add_blank_audio
return v76.prefetch
#adjustframerate

v77 = LSMASHVideoSource(dst_dir + "v77f.mp4").ConvertToYV24()
b_ex = undefined
v77o = v77
v77 = v77.AdjustColor(ou = +3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v77i = v77
v77 = expr(v77.extractY, v77.extractU, v77.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v77 = v77.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v77a = v77i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v77 = v77.colorYUV(off_u = -2, off_v = -0)
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
v77 = v77.add_blank_audio
return v77.prefetch
#adjustframerate

v78 = LSMASHVideoSource(dst_dir + "v78f.mp4").ConvertToYV24()
b_ex = undefined
v78o = v78
v78 = v78.AdjustColor(ou = +3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v78i = v78
v78 = expr(v78.extractY, v78.extractU, v78.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v78 = v78.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v78a = v78i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v78 = v78.colorYUV(off_u = -2, off_v = -0)
v78 = v78.adjustSize
v78 = v78.assumeFPS(18)
v78 = v78.add_blank_audio
return v78.prefetch
#adjustframerate

v79 = LSMASHVideoSource(dst_dir + "v79f.mp4").ConvertToYV24()
b_ex = undefined
v79o = v79
v79 = v79.AdjustColor(ou = +3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v79i = v79
v79 = expr(v79.extractY, v79.extractU, v79.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v79 = v79.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v79a = v79i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v79 = v79.colorYUV(off_u = -2, off_v = -0)
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
v79 = v79.add_blank_audio
return v79.prefetch
#adjustframerate

v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
b_ex = undefined
v80o = v80
v80 = v80.AdjustColor(ou = +3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v80i = v80
v80 = expr(v80.extractY, v80.extractU, v80.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v80 = v80.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v80a = v80i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v80 = v80.colorYUV(off_u = -2, off_v = -0)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate

v81 = LSMASHVideoSource(dst_dir + "v81f.mp4").ConvertToYV24()
b_ex = undefined
v81o = v81
v81 = v81.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v81i = v81
v81 = expr(v81.extractY, v81.extractU, v81.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v81 = v81.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v81a = v81i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v81 = v81.colorYUV(off_u = -2, off_v = -2)
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
v81 = v81.add_blank_audio
return v81.prefetch
#adjustframerate

v82 = LSMASHVideoSource(dst_dir + "v82f.mp4").ConvertToYV24()
b_ex = undefined
v82o = v82
v82 = v82.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v82i = v82
v82 = expr(v82.extractY, v82.extractU, v82.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v82 = v82.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v82a = v82i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v82 = v82.colorYUV(off_u = -2, off_v = -2)
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
v82 = v82.add_blank_audio
return v82.prefetch
#adjustframerate

v83 = LSMASHVideoSource(dst_dir + "v83f.mp4").ConvertToYV24()
b_ex = undefined
v83o = v83
v83 = v83.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v83i = v83
v83 = expr(v83.extractY, v83.extractU, v83.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v83 = v83.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v83a = v83i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v83 = v83.colorYUV(off_u = -2, off_v = -2)
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
v83 = v83.add_blank_audio
return v83.prefetch
#adjustframerate

v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
b_ex = undefined
v84o = v84
v84 = v84.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v84i = v84
v84 = expr(v84.extractY, v84.extractU, v84.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v84 = v84.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v84a = v84i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v84 = v84.colorYUV(off_u = -2, off_v = -2)
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate

v85 = LSMASHVideoSource(dst_dir + "v85f.mp4").ConvertToYV24()
v85 = v85.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v85o = v85
v85 = v85.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v85i = v85
v85 = expr(v85.extractY, v85.extractU, v85.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v85 = v85.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v85a = v85i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v85 = v85.colorYUV(off_u = -2, off_v = -2)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
v85 = v85.add_blank_audio
return v85.prefetch
#adjustframerate

v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
b_ex = undefined
v86o = v86
v86 = v86.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v86i = v86
v86 = expr(v86.extractY, v86.extractU, v86.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v86 = v86.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v86a = v86i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v86 = v86.colorYUV(off_u = -2, off_v = -2)
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate

v87 = LSMASHVideoSource(dst_dir + "v87f.mp4").ConvertToYV24()
b_ex = undefined
v87o = v87
v87 = v87.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v87i = v87
v87 = expr(v87.extractY, v87.extractU, v87.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v87 = v87.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v87a = v87i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v87 = v87.colorYUV(off_u = -2, off_v = -2)
v87 = v87.adjustSize
v87 = v87.assumeFPS(18)
v87 = v87.add_blank_audio
return v87.prefetch
#adjustframerate

v88 = LSMASHVideoSource(dst_dir + "v88f.mp4").ConvertToYV24()
b_ex = undefined
v88o = v88
v88 = v88.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v88i = v88
v88 = expr(v88.extractY, v88.extractU, v88.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v88 = v88.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v88a = v88i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v88 = v88.colorYUV(off_u = -2, off_v = -2)
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
v88 = v88.add_blank_audio
return v88.prefetch
#adjustframerate

v89 = LSMASHVideoSource(dst_dir + "v89f.mp4").ConvertToYV24()
b_ex = undefined
v89o = v89
v89 = v89.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v89i = v89
v89 = expr(v89.extractY, v89.extractU, v89.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v89 = v89.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v89a = v89i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v89 = v89.colorYUV(off_u = -2, off_v = -2)
v89 = v89.adjustSize
v89 = v89.assumeFPS(18)
v89 = v89.add_blank_audio
return v89.prefetch
#adjustframerate

v90 = LSMASHVideoSource(dst_dir + "v90f.mp4").ConvertToYV24()
b_ex = undefined
v90o = v90
v90 = v90.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v90i = v90
v90 = expr(v90.extractY, v90.extractU, v90.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v90 = v90.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v90a = v90i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v90 = v90.colorYUV(off_u = -2, off_v = -2)
v90 = v90.adjustSize
v90 = v90.assumeFPS(18)
v90 = v90.add_blank_audio
return v90.prefetch
#adjustframerate

v91 = LSMASHVideoSource(dst_dir + "v91f.mp4").ConvertToYV24()
b_ex = undefined
v91o = v91
v91 = v91.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v91i = v91
v91 = expr(v91.extractY, v91.extractU, v91.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v91 = v91.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v91a = v91i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v91 = v91.colorYUV(off_u = -2, off_v = -2)
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
v91 = v91.add_blank_audio
return v91.prefetch
#adjustframerate

v92 = LSMASHVideoSource(dst_dir + "v92f.mp4").ConvertToYV24()
b_ex = undefined
v92o = v92
v92 = v92.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v92i = v92
v92 = expr(v92.extractY, v92.extractU, v92.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v92 = v92.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v92a = v92i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v92 = v92.colorYUV(off_u = -2, off_v = -2)
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
v92 = v92.add_blank_audio
return v92.prefetch
#adjustframerate

v93 = LSMASHVideoSource(dst_dir + "v93f.mp4").ConvertToYV24()
b_ex = undefined
v93o = v93
v93 = v93.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v93i = v93
v93 = expr(v93.extractY, v93.extractU, v93.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v93 = v93.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v93a = v93i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v93 = v93.colorYUV(off_u = -2, off_v = -2)
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
v93 = v93.add_blank_audio
return v93.prefetch
#adjustframerate

v94 = LSMASHVideoSource(dst_dir + "v94f.mp4").ConvertToYV24()
b_ex = undefined
v94o = v94
v94 = v94.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v94i = v94
v94 = expr(v94.extractY, v94.extractU, v94.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v94 = v94.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v94a = v94i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v94 = v94.colorYUV(off_u = -2, off_v = -2)
v94 = v94.adjustSize
v94 = v94.assumeFPS(18)
v94 = v94.add_blank_audio
return v94.prefetch
#adjustframerate

v95 = LSMASHVideoSource(dst_dir + "v95f.mp4").ConvertToYV24()
b_ex = undefined
v95o = v95
v95 = v95.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v95i = v95
v95 = expr(v95.extractY, v95.extractU, v95.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v95 = v95.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v95a = v95i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v95 = v95.colorYUV(off_u = -2, off_v = -2)
v95 = v95.adjustSize
v95 = v95.assumeFPS(18)
v95 = v95.add_blank_audio
return v95.prefetch
#adjustframerate

v96 = LSMASHVideoSource(dst_dir + "v96f.mp4").ConvertToYV24()
#v96 = v96.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 400
#v96 = v96.trim(188, -1).loop(v96.frameCount).crop(0, v96.height - add_height, 0, 0).stackVertical(v96)
#return v96.histogram.prefetch
v96o = v96
v96 = v96.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v96.hist_levels.prefetch
#v96 = v96.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v96 = expr(v96.extractY, v96.extractU, v96.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v96i = v96
v96 = expr(v96.extractY, v96.extractU, v96.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v96 = v96.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v96a = v96i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v96 = v96.crop(0, add_height, 0, 0)
#v96a = v96a.crop(0, add_height, 0, 0)
#v96 = v96.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v96 = v96.colorYUV(off_u = -2, off_v = -2)
#return v96i.interleave(v96).hist_levels.prefetch
v96 = v96.adjustSize
v96 = v96.assumeFPS(18)
v96 = v96.add_blank_audio
return v96.prefetch
#adjustframerate

#******

*/