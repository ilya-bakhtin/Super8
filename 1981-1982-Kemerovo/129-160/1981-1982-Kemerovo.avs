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
# 15760, 15880, 16089, 16144, 16293, 16475, 16599, 16616, 16935, 17048, 17480, 18026, 18131, 18285, 18342, 18433, 18619, 18728, # 152
#skip (16599, 16615)
# 18743, 18816, 18911, 19018, 19103, 19309, 19406, 19414, 19605, 20080, 20340, 20515, 20705, 20819, 20893, 20915, 21071, 21166, # 170

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
v129 = full.trim(15584, 15759)
v129 = v129.crop(left + 84, top - 80, right + 20, bot - 128)
v129 = v129.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v129 = v129.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v129.trim(3, 0)
#return v129.adjustBorders.hist_levels.prefetch

v130 = full.trim(15760, 15879)
v130 = v130.crop(left + 84, top - 80, right + 20, bot - 128)
v130 = v130.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v130 = v130.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v130.trim(3, 0)
#return v130.adjustBorders.hist_levels.prefetch

v131 = full.trim(15880, 16088)
v131 = v131.crop(left + 84, top - 80, right + 20, bot - 128)
v131 = v131.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v131 = v131.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v131.trim(3, 0)
#return v131.adjustBorders.hist_levels.prefetch

v132 = full.trim(16089, 16143)
v132 = v132.crop(left + 84, top - 80, right + 20, bot - 128)
v132 = v132.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 232, autolevel = false)
v132 = v132.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v132.trim(3, 0)
#return v132.adjustBorders.hist_levels.prefetch

v133 = full.trim(16144, 16292)
v133 = v133.crop(left + 84, top - 80, right + 20, bot - 128)
v133 = v133.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
v133 = v133.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v133.trim(3, 0)
#return v133.adjustBorders.hist_levels.prefetch

v134 = full.trim(16293, 16474)
v134 = v134.crop(left + 84, top - 80, right + 20, bot - 128)
v134 = v134.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false)
v134 = v134.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v134.trim(3, 0)
#return v134.adjustBorders.hist_levels.prefetch

v135 = full.trim(16475, 16598)
v135 = v135.crop(left + 84, top - 80, right + 20, bot - 128)
v135 = v135.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v135.trim(3, 0)
v135 = v135.trim(0, 112) +\
       v135.trim(112, 115).deflickOverlappedInc(width = 1900, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
       v135.trim(115, 119).deflickOverlappedInc(width = 1900, step = 200, toward_darkest = true, right2left = true).trim(1, 0) +\
       v135.trim(119, 0).deflickOverlappedFwd(width = 1500, step = 200, toward_darkest = true, right2left = true).trim(1, 0)
#return v135.adjustBorders.hist_levels.prefetch

v136 = full.trim(16616, 16934)
v136 = v136.crop(left + 84, top - 60, right + 20, bot - 108)
v136 = v136.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 235, autolevel = false)
v136 = v136.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v136.trim(3, 0)
v136 = v136.deflickOverlapped(width = 600, step = 100, radius = 6, toward_darkest = true, right2left = true).trim(0, 304) +\
       v136.trim(305, 309).deflickOverlappedBck(width = 400, step = 50, toward_darkest = true, right2left = false) +\
       v136.trim(310, 314).deflickOverlappedBck(width = 400, step = 50, toward_darkest = true, right2left = false) +\
       v136.trim(314, 0).deflickOverlappedFwd(width = 400, step = 100, toward_darkest = true, right2left = false).trim(1, 0)
#return v136.adjustBorders.hist_levels.prefetch

v137 = full.trim(16935, 17047)
v137 = v137.crop(left + 84, top - 60, right + 20, bot - 108)
v137 = v137.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v137 = v137.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v137.trim(3, 0)
v137 = v137.deflickOverlapped(width = 600, step = 100, radius = 6, toward_darkest = true, right2left = true)
v137 = v137.correct_left_side(width = 400).correct_left_side(width = 100)
#return v137.adjustBorders.hist_levels.prefetch

v138 = full.trim(17048, 17479)
v138 = v138.crop(left + 84, top - 60, right + 20, bot - 108)
v138 = v138.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 230, autolevel = false)
v138 = v138.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v138.trim(3, 0)
v138 = v138.deflickOverlapped(width = 600, step = 100, radius = 6, toward_darkest = true, right2left = true)
v138 = v138.correct_left_side(width = 400).correct_left_side(width = 100)
#return v138.adjustBorders.hist_levels.prefetch

v139 = full.trim(17480, 18025)
v139 = v139.crop(left + 84, top - 60, right + 20, bot - 108)
v139 = v139.autolevels(input_low = 0, output_low = 24, input_high = 255, output_high = 235, autolevel = false)
v139 = v139.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v139.trim(3, 0)
v139 = v139.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true)
v139 = v139.correct_left_side(width = 400).correct_left_side(width = 100)
#return v139.adjustBorders.hist_levels.prefetch

v140 = full.trim(18026, 18130)
v140 = v140.crop(left + 84, top - 60, right + 20, bot - 108)
v140 = v140.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v140 = v140.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v140.trim(3, 0)
v140 = v140.deflickOverlapped(width = 400, step = 200, radius = 8, toward_darkest = true, right2left = true)
v140 = v140.correct_left_side(width = 400).correct_left_side(width = 100)
#return v140.adjustBorders.hist_levels.prefetch

v141 = full.trim(18131, 18284)
v141 = v141.crop(left + 84, top - 60, right + 20, bot - 108)
v141 = v141.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 235, autolevel = false)
v141 = v141.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v141.trim(3, 0)
v141 = v141.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
v141 = v141.correct_left_side(width = 400).correct_left_side(width = 100)
#return v141.adjustBorders.hist_levels.prefetch

v142 = full.trim(18285, 18341)
v142 = v142.crop(left + 84, top - 60, right + 20, bot - 108)
v142 = v142.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 255, autolevel = false)
v142 = v142.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v142.trim(3, 0)
v142 = v142.deflickOverlapped(width = 600, step = 200, radius = 9, toward_darkest = true, right2left = true)
v142 = v142.correct_left_side(width = 400).correct_left_side(width = 100)
#return v142.adjustBorders.hist_levels.prefetch

v143 = full.trim(18342, 18431)
v143 = v143.animate(82, 89, "crop", left + 84, top - 60, right + 20, bot - 108, left + 44, top - 20, right - 20, bot - 68)
v143 = v143.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 235, autolevel = false)
v143 = v143.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v143.trim(3, 0)
v143 = v143.deflickOverlapped(width = 800, step = 200, radius = 9, toward_darkest = true, right2left = true)
v143 = v143.correct_left_side(width = 400).correct_left_side(width = 100)
#return v143.adjustBorders.hist_levels.prefetch

v144 = full.trim(18433, 18618)
v144 = v144.crop(left + 84, top - 60, right + 20, bot - 108)
v144 = v144.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 235, autolevel = false)
v144 = v144.trim(0, 33).deflickOverlappedBck(width = 8000, step = 200, toward_darkest = true, right2left = true).\
       animate(0, 33, "color_uv", 20, 20, 0, 0) +\
       v144.trim(34, 0)
#return v144.adjustBorders.hist_levels.prefetch

v145 = full.trim(18619, 18727)
v145 = v145.crop(left + 84, top - 60, right + 20, bot - 108)
v145 = v145.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v145.trim(3, 0)
v145 = v145.correct_left_side(width = 400).correct_left_side(width = 100)
#return v145.adjustBorders.hist_levels.prefetch

v146 = full.trim(18728, 18741)
v146 = v146.crop(left + 84, top - 60, right + 20, bot - 108)
v146 = v146.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v146 = v146.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v146.trim(3, 0)
v146 = v146.trim(0, 4) +\
       v146.trim(5, 0).deflickOverlappedFwd(width = 8000, step = 200, toward_darkest = true, right2left = true)
v146 = v146.correct_left_side(width = 400).correct_left_side(width = 100)
#return v146.adjustBorders.hist_levels.prefetch

v147 = full.trim(18743, 18815)
v147 = v147.crop(left + 84, top - 60, right + 20, bot - 108)
v147 = v147.correct_left_side(width = 400).correct_left_side(width = 100)
#return v147.adjustBorders.hist_levels.prefetch

v148 = full.trim(18816, 18910)
v148 = v148.crop(left + 84, top - 60, right + 20, bot - 108)
v148 = v148.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v148 = v148.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v148.trim(3, 0)
v148 = v148.correct_left_side(width = 400).correct_left_side(width = 100)
#return v148.adjustBorders.hist_levels.prefetch

v149 = full.trim(18911, 19016)
v149 = v149.crop(left + 84, top - 60, right + 20, bot - 108).trim(0, 101) +\
       v149.crop(left + 84, top - 150, right + 20, bot - 198).trim(102, -1) +\
       v149.crop(left + 84, top - 40, right + 20, bot - 88).trim(103, -1) +\
       v149.crop(left + 84, top - 60, right + 20, bot - 108).trim(104, 0)
v149 = v149.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v149 = v149.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v149.trim(3, 0)
#return v149.adjustBorders.hist_levels.prefetch

v150 = full.trim(19018, 19102)
v150 = v150.crop(left + 84, top - 60, right + 20, bot - 108)
v150 = v150.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
#return v150.adjustBorders.hist_levels.prefetch

v151 = full.trim(19103, 19308)
v151 = v151.crop(left + 84, top - 60, right + 20, bot - 108)
v151 = v151.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v151 = v151.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v151.trim(3, 0)
#return v151.adjustBorders.hist_levels.prefetch

v152 = full.trim(19309, 19405)
v152 = v152.crop(left + 84, top - 60, right + 20, bot - 108)
v152 = v152.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v152.trim(3, 0)
#return v152.adjustBorders.hist_levels.prefetch

v153 = full.trim(19406, 19413)
v153 = v153.crop(left + 84, top - 60, right + 20, bot - 108)
v153 = v153.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v153.trim(3, 0)
#return v153.adjustBorders.hist_levels.prefetch

v154 = full.trim(19414, 19604)
v154 = v154.crop(left + 84, top - 60, right + 20, bot - 108)
v154 = v154.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v154 = v154.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v154.trim(3, 0)
#return v154.adjustBorders.hist_levels.prefetch

v155 = full.trim(19605, 20079)
v155 = v155.crop(left + 84, top - 60, right + 20, bot - 108)
v155 = v155.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v155 = v155.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v155.trim(3, 0)
#return v155.adjustBorders.hist_levels.prefetch

v156 = full.trim(20080, 20339)
v156 = v156.crop(left + 84, top - 60, right + 20, bot - 108)
v156 = v156.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v156 = v156.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v156.trim(3, 0)
#return v156.adjustBorders.hist_levels.prefetch

v157 = full.trim(20340, 20514)
v157 = v157.crop(left + 84, top - 60, right + 20, bot - 108)
v157 = v157.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v157 = v157.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v157.trim(3, 0)
v157 = v157.deflickOverlapped(width = 400, step = 200, radius = 1, toward_darkest = true, right2left = true)
#return v157.adjustBorders.hist_levels.prefetch

v158 = full.trim(20515, 20704)
v158 = v158.crop(left + 84, top - 60, right + 20, bot - 108)
v158 = v158.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v158 = v158.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v158.trim(3, 0)
v158 = v158.deflickOverlapped(width = 400, step = 200, radius = 1, toward_darkest = true, right2left = true)
#return v158.adjustBorders.hist_levels.prefetch

v159 = full.trim(20707, 20816)
v159 = v159.crop(left + 84, top - 60, right + 20, bot - 108)
v159 = v159.correct_left_side(width = 400).correct_left_side(width = 100)
#return v159.adjustBorders.hist_levels.prefetch

# 18743, 18816, 18911, 19018, 19103, 19309, 19406, 19414, 19605, 20080, 20340, 20515, 20705, 20819, 20893, 20915, 21071, 21166, # 170
v160 = full.trim(20819, 20892)
v160 = v160.crop(left + 84, top - 60, right + 20, bot - 108)
#v160 = v160.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v160 = v160.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v160.trim(3, 0)
v160 = v160.trim(0, 10) +\
       v160.trim(11, 26).deflickOverlappedInc(width = 4000, step = 200, toward_darkest = true, right2left = true) +\
       v160.trim(27, 0)
#v160 = v160.deflickOverlapped(width = 400, step = 200, radius = 1, toward_darkest = true, right2left = true)
v160 = v160.correct_left_side(width = 400).correct_left_side(width = 100)
#return v160.adjustBorders.hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*
#******

# 129

v129 = LSMASHVideoSource(dst_dir + "v129f.mp4").ConvertToYV24()
b_ex = undefined
v129o = v129
v129 = v129.AdjustColor(ou = -0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.4, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v129i = v129
v129 = expr(v129.extractY, v129.extractU, v129.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v129 = v129.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v129a = v129i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v129 = v129.adjustSize
v129 = v129.assumeFPS(18)
v129 = v129.add_blank_audio
return v129.prefetch
#adjustframerate

v130 = LSMASHVideoSource(dst_dir + "v130f.mp4").ConvertToYV24()
b_ex = undefined
v130o = v130
v130 = v130.AdjustColor(ou = -0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.4, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v130i = v130
v130 = expr(v130.extractY, v130.extractU, v130.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v130 = v130.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v130a = v130i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v130i.interleave(v130).hist_levels.prefetch
v130 = v130.adjustSize
v130 = v130.assumeFPS(18)
v130 = v130.add_blank_audio
return v130.prefetch
#adjustframerate

v131 = LSMASHVideoSource(dst_dir + "v131f.mp4").ConvertToYV24()
b_ex = undefined
v131o = v131
v131 = v131.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v131i = v131
v131 = expr(v131.extractY, v131.extractU, v131.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v131 = v131.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v131a = v131i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v131 = v131.adjustSize
v131 = v131.assumeFPS(18)
v131 = v131.add_blank_audio
return v131.prefetch
#adjustframerate

v132 = LSMASHVideoSource(dst_dir + "v132f.mp4").ConvertToYV24()
b_ex = undefined
v132o = v132
v132 = v132.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v132i = v132
v132 = expr(v132.extractY, v132.extractU, v132.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v132 = v132.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v132a = v132i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v132 = v132.adjustSize
v132 = v132.assumeFPS(18)
v132 = v132.add_blank_audio
return v132.prefetch
#adjustframerate

v133 = LSMASHVideoSource(dst_dir + "v133f.mp4").ConvertToYV24()
b_ex = undefined
v133o = v133
v133 = v133.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v133i = v133
v133 = expr(v133.extractY, v133.extractU, v133.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v133 = v133.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v133a = v133i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v133 = v133.adjustSize
v133 = v133.assumeFPS(18)
v133 = v133.add_blank_audio
return v133.prefetch
#adjustframerate

v134 = LSMASHVideoSource(dst_dir + "v134f.mp4").ConvertToYV24()
b_ex = undefined
v134o = v134
v134 = v134.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v134i = v134
v134 = expr(v134.extractY, v134.extractU, v134.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v134 = v134.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v134a = v134i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v134 = v134.adjustSize
v134 = v134.assumeFPS(18)
v134 = v134.add_blank_audio
return v134.prefetch
#adjustframerate

v135 = LSMASHVideoSource(dst_dir + "v135f.mp4").ConvertToYV24()
b_ex = undefined
v135o = v135
v135 = v135.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v135i = v135
v135 = expr(v135.extractY, v135.extractU, v135.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v135 = v135.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v135a = v135i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v135 = v135.adjustSize
v135 = v135.assumeFPS(18)
v135 = v135.add_blank_audio
return v135.prefetch
#adjustframerate

v136 = LSMASHVideoSource(dst_dir + "v136f.mp4").ConvertToYV24()
b_ex = undefined
v136o = v136
v136 = v136.AdjustColor(ou = -4, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v136i = v136
v136 = expr(v136.extractY, v136.extractU, v136.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v136 = v136.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v136a = v136i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v136 = v136.adjustSize
v136 = v136.assumeFPS(18)
v136 = v136.add_blank_audio
return v136.prefetch
#adjustframerate

v137 = LSMASHVideoSource(dst_dir + "v137f.mp4").ConvertToYV24()
v137 = v137.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v137o = v137
v137 = v137.AdjustColor(ou = -0, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v137i = v137
v137 = expr(v137.extractY, v137.extractU, v137.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v137 = v137.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v137a = v137i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v137 = v137.colorYUV(off_u = -2, off_v = -2)
v137 = v137.adjustSize
v137 = v137.assumeFPS(18)
v137 = v137.add_blank_audio
return v137.prefetch
#adjustframerate

v138 = LSMASHVideoSource(dst_dir + "v138f.mp4").ConvertToYV24()
b_ex = undefined
v138o = v138
v138 = v138.AdjustColor(ou = -0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v138i = v138
v138 = expr(v138.extractY, v138.extractU, v138.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v138 = v138.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v138a = v138i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v138 = v138.colorYUV(off_u = -2, off_v = -2)
v138 = v138.adjustSize
v138 = v138.assumeFPS(18)
v138 = v138.add_blank_audio
return v138.prefetch
#adjustframerate

v139 = LSMASHVideoSource(dst_dir + "v139f.mp4").ConvertToYV24()
v139 = v139.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v139o = v139
v139 = v139.AdjustColor(ou = -0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v139i = v139
v139 = expr(v139.extractY, v139.extractU, v139.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v139 = v139.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v139a = v139i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v139 = v139.colorYUV(off_u = -1, off_v = -1)
v139 = v139.adjustSize
v139 = v139.assumeFPS(18)
v139 = v139.add_blank_audio
return v139.prefetch
#adjustframerate

v140 = LSMASHVideoSource(dst_dir + "v140f.mp4").ConvertToYV24()
v140 = v140.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 247, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v140o = v140
v140 = v140.AdjustColor(ou = -0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v140i = v140
v140 = expr(v140.extractY, v140.extractU, v140.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v140 = v140.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v140a = v140i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v140 = v140.colorYUV(off_u = -1, off_v = -1)
v140 = v140.adjustSize
v140 = v140.assumeFPS(18)
v140 = v140.add_blank_audio
return v140.prefetch
#adjustframerate

v141 = LSMASHVideoSource(dst_dir + "v141f.mp4").ConvertToYV24()
b_ex = undefined
v141o = v141
v141 = v141.AdjustColor(ou = -0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v141i = v141
v141 = expr(v141.extractY, v141.extractU, v141.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v141 = v141.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v141a = v141i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v141 = v141.colorYUV(off_u = -1, off_v = -1)
v141 = v141.adjustSize
v141 = v141.assumeFPS(18)
v141 = v141.add_blank_audio
return v141.prefetch
#adjustframerate

v142 = LSMASHVideoSource(dst_dir + "v142f.mp4").ConvertToYV24()
b_ex = undefined
v142o = v142
v142 = v142.AdjustColor(ou = -0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v142i = v142
v142 = expr(v142.extractY, v142.extractU, v142.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v142 = v142.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v142a = v142i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v142 = v142.colorYUV(off_u = -1, off_v = -1)
v142 = v142.adjustSize
v142 = v142.assumeFPS(18)
v142 = v142.add_blank_audio
return v142.prefetch
#adjustframerate

v143 = LSMASHVideoSource(dst_dir + "v143f.mp4").ConvertToYV24()
b_ex = undefined
v143o = v143
v143 = v143.AdjustColor(ou = -0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v143i = v143
v143 = expr(v143.extractY, v143.extractU, v143.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v143 = v143.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v143a = v143i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v143 = v143.colorYUV(off_u = -1, off_v = -1)
v143 = v143.adjustSize
v143 = v143.assumeFPS(18)
v143 = v143.add_blank_audio
return v143.prefetch
#adjustframerate

v144 = LSMASHVideoSource(dst_dir + "v144f.mp4").ConvertToYV24()
v144 = v144.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v144o = v144
v144 = v144.AdjustColor(ou = -0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v144i = v144
v144 = expr(v144.extractY, v144.extractU, v144.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v144 = v144.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v144a = v144i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v144 = v144.adjustSize
v144 = v144.assumeFPS(18)
v144 = v144.add_blank_audio
return v144.prefetch
#adjustframerate

v145 = LSMASHVideoSource(dst_dir + "v145f.mp4").ConvertToYV24()
v145 = v145.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v145o = v145
v145 = v145.AdjustColor(ou = -0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v145i = v145
v145 = expr(v145.extractY, v145.extractU, v145.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v145 = v145.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v145a = v145i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v145 = v145.adjustSize
v145 = v145.assumeFPS(18)
v145 = v145.add_blank_audio
return v145.prefetch
#adjustframerate

v146 = LSMASHVideoSource(dst_dir + "v146f.mp4").ConvertToYV24()
v146 = v146.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v146o = v146
v146 = v146.AdjustColor(ou = +6, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v146i = v146
v146 = expr(v146.extractY, v146.extractU, v146.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v146 = v146.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v146a = v146i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v146 = v146.adjustSize
v146 = v146.assumeFPS(18)
v146 = v146.add_blank_audio
return v146.prefetch
#adjustframerate

v147 = LSMASHVideoSource(dst_dir + "v147f.mp4").ConvertToYV24()
v147 = v147.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v147o = v147
v147 = v147.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v147i = v147
v147 = expr(v147.extractY, v147.extractU, v147.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v147 = v147.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v147a = v147i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v147 = v147.adjustSize
v147 = v147.assumeFPS(18)
v147 = v147.add_blank_audio
return v147.prefetch
#adjustframerate

v148 = LSMASHVideoSource(dst_dir + "v148f.mp4").ConvertToYV24()
b_ex = undefined
v148o = v148
v148 = v148.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v148i = v148
v148 = expr(v148.extractY, v148.extractU, v148.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v148 = v148.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v148a = v148i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v148 = v148.colorYUV(off_u = -4, off_v = -0)
v148 = v148.adjustSize
v148 = v148.assumeFPS(18)
v148 = v148.add_blank_audio
return v148.prefetch
#adjustframerate

v149 = LSMASHVideoSource(dst_dir + "v149f.mp4").ConvertToYV24()
b_ex = undefined
v149o = v149
v149 = v149.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v149i = v149
v149 = expr(v149.extractY, v149.extractU, v149.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v149 = v149.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v149a = v149i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v149 = v149.colorYUV(off_u = -2, off_v = -2)
v149 = v149.adjustSize
v149 = v149.assumeFPS(18)
v149 = v149.add_blank_audio
return v149.prefetch
#adjustframerate

v150 = LSMASHVideoSource(dst_dir + "v150f.mp4").ConvertToYV24()
b_ex = undefined
v150o = v150
v150 = v150.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v150i = v150
v150 = expr(v150.extractY, v150.extractU, v150.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v150 = v150.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v150a = v150i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v150 = v150.colorYUV(off_u = -2, off_v = -2)
v150 = v150.adjustSize
v150 = v150.assumeFPS(18)
v150 = v150.add_blank_audio
return v150.prefetch
#adjustframerate

v151 = LSMASHVideoSource(dst_dir + "v151f.mp4").ConvertToYV24()
b_ex = undefined
v151o = v151
v151 = v151.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v151i = v151
v151 = expr(v151.extractY, v151.extractU, v151.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v151 = v151.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v151a = v151i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v151 = v151.adjustSize
v151 = v151.assumeFPS(18)
v151 = v151.add_blank_audio
return v151.prefetch
#adjustframerate

v152 = LSMASHVideoSource(dst_dir + "v152f.mp4").ConvertToYV24()
b_ex = undefined
v152o = v152
v152 = v152.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v152i = v152
v152 = expr(v152.extractY, v152.extractU, v152.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v152 = v152.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v152a = v152i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v152 = v152.colorYUV(off_u = -2, off_v = -2)
v152 = v152.adjustSize
v152 = v152.assumeFPS(18)
v152 = v152.add_blank_audio
return v152.prefetch
#adjustframerate

v153 = LSMASHVideoSource(dst_dir + "v153f.mp4").ConvertToYV24()
b_ex = undefined
v153o = v153
v153 = v153.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v153i = v153
v153 = expr(v153.extractY, v153.extractU, v153.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v153 = v153.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v153a = v153i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v153 = v153.colorYUV(off_u = -2, off_v = -2)
v153 = v153.adjustSize
v153 = v153.assumeFPS(18)
v153 = v153.add_blank_audio
return v153.prefetch
#adjustframerate

v154 = LSMASHVideoSource(dst_dir + "v154f.mp4").ConvertToYV24()
b_ex = undefined
v154o = v154
v154 = v154.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v154i = v154
v154 = expr(v154.extractY, v154.extractU, v154.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v154 = v154.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v154a = v154i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v154 = v154.colorYUV(off_u = -2, off_v = -2)
v154 = v154.adjustSize
v154 = v154.assumeFPS(18)
v154 = v154.add_blank_audio
return v154.prefetch
#adjustframerate

v155 = LSMASHVideoSource(dst_dir + "v155f.mp4").ConvertToYV24()
b_ex = undefined
v155o = v155
v155 = v155.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v155i = v155
v155 = expr(v155.extractY, v155.extractU, v155.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v155 = v155.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v155a = v155i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v155 = v155.colorYUV(off_u = -2, off_v = -2)
v155 = v155.adjustSize
v155 = v155.assumeFPS(18)
v155 = v155.add_blank_audio
return v155.prefetch
#adjustframerate

v156 = LSMASHVideoSource(dst_dir + "v156f.mp4").ConvertToYV24()
b_ex = undefined
v156o = v156
v156 = v156.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v156i = v156
v156 = expr(v156.extractY, v156.extractU, v156.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v156 = v156.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v156a = v156i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v156 = v156.colorYUV(off_u = -2, off_v = -2)
v156 = v156.adjustSize
v156 = v156.assumeFPS(18)
v156 = v156.add_blank_audio
return v156.prefetch
#adjustframerate

v157 = LSMASHVideoSource(dst_dir + "v157f.mp4").ConvertToYV24()
b_ex = undefined
v157o = v157
v157 = v157.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v157i = v157
v157 = expr(v157.extractY, v157.extractU, v157.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v157 = v157.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v157a = v157i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v157 = v157.colorYUV(off_u = -2, off_v = -2)
v157 = v157.adjustSize
v157 = v157.assumeFPS(18)
v157 = v157.add_blank_audio
return v157.prefetch
#adjustframerate

v158 = LSMASHVideoSource(dst_dir + "v158f.mp4").ConvertToYV24()
b_ex = undefined
v158o = v158
v158 = v158.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v158i = v158
v158 = expr(v158.extractY, v158.extractU, v158.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v158 = v158.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v158a = v158i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v158 = v158.colorYUV(off_u = -2, off_v = -2)
v158 = v158.adjustSize
v158 = v158.assumeFPS(18)
v158 = v158.add_blank_audio
return v158.prefetch
#adjustframerate

v159 = LSMASHVideoSource(dst_dir + "v159f.mp4").ConvertToYV24()
b_ex = undefined
v159o = v159
v159 = v159.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v159i = v159
v159 = expr(v159.extractY, v159.extractU, v159.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v159 = v159.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v159a = v159i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v159 = v159.colorYUV(off_u = -2, off_v = -2)
v159 = v159.adjustSize
v159 = v159.assumeFPS(18)
v159 = v159.add_blank_audio
return v159.prefetch
#adjustframerate

v160 = LSMASHVideoSource(dst_dir + "v160f.mp4").ConvertToYV24()
#v160 = v160.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v160 = v160.trim(105, -1).loop(v160.frameCount).crop(0, 0, -(v160.width - add_width), 0).stackHorizontal(v160)
#return v160.histogram.prefetch
v160o = v160
v160 = v160.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v160.hist_levels.prefetch
#v160 = v160.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v160 = expr(v160.extractY, v160.extractU, v160.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v160i = v160
v160 = expr(v160.extractY, v160.extractU, v160.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v160 = v160.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v160a = v160i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v160 = v160.crop(add_width, 0, 0, 0)
#v160i = v160i.crop(add_width, 0, 0, 0)
#v160a = v160a.crop(add_width, 0, 0, 0)
#v160 = v160.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v160 = v160.colorYUV(off_u = -2, off_v = -2)
#v160 = v160i
#return v160i.interleave(v160).hist_levels.prefetch
v160 = v160.adjustSize
v160 = v160.assumeFPS(18)
v160 = v160.add_blank_audio
return v160.prefetch
#adjustframerate

#******
*/