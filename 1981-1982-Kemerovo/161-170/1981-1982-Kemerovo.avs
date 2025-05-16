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
#skip (16599, 16615) (20893, 20914)
# 18743, 18816, 18911, 19018, 19103, 19309, 19406, 19414, 19605, 20080, 20340, 20515, 20705, 20819, 20893, 20915, 21071, 21166, # 170
# 21293, 21633, 21812, 21839, 22156, 22549, 22769, 22904                                                                        # 178

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
v161 = full.trim(20915, 21070)
v161 = v161.crop(left + 84, top - 90, right + 20, bot - 138)
v161 = v161.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 247, autolevel = false)
v161 = v161.trim(0, 14).deflickOverlappedBck(width = 4000, step = 200, toward_darkest = true, right2left = false) +\
       v161.trim(15, 153) +\
       v161.trim(154, 0).deflickOverlappedFwd(width = 4000, step = 200, toward_darkest = true, right2left = false)
#return v161.adjustBorders.hist_levels.prefetch

v162 = full.trim(21072, 21165)
v162 = v162.crop(left + 84, top - 90, right + 20, bot - 138)
v162 = v162.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 235, autolevel = false)
v162 = v162.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v162.trim(3, 0)
#return v162.adjustBorders.hist_levels.prefetch

v163 = full.trim(21166, 21292)
v163 = v163.crop(left + 84, top - 90, right + 20, bot - 138)
v163 = v163.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 240, autolevel = false)
v163 = v163.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v163.trim(3, 123) +\
       v163.trim(124, 0).deflickOverlappedFwd(width = 4000, step = 200, toward_darkest = true, right2left = false)
#return v163.adjustBorders.hist_levels.prefetch

v164 = full.trim(21293, 21632)
v164 = v164.crop(left + 84, top - 90, right + 20, bot - 138)
v164 = v164.autolevels(input_low = 0, output_low = 4, input_high = 251, output_high = 255, autolevel = false)
v164 = v164.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v164.trim(3, 0)
#return v164.adjustBorders.hist_levels.prefetch

v165 = full.trim(21633, 21811)
v165 = v165.crop(left + 84, top - 90, right + 20, bot - 138)
v165 = v165.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 235, autolevel = false)
v165 = v165.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v165.trim(3, 176) +\
       v165.trim(177, 0).deflickOverlappedFwd(width = 4000, step = 200, toward_darkest = true, right2left = false)
#return v165.adjustBorders.hist_levels.prefetch

v166 = full.trim(21812, 21838)
v166 = v166.crop(left + 84, top - 90, right + 20, bot - 138)
v166 = v166.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v166.trim(3, 23) +\
       v166.trim(24, 0).deflickOverlappedFwd(width = 4000, step = 200, toward_darkest = true, right2left = false)
#return v166.adjustBorders.hist_levels.prefetch

v167 = full.trim(21839, 22155)
v167 = v167.crop(left + 84, top - 90, right + 20, bot - 138)
v167 = v167.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 235, autolevel = false)
v167 = v167.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v167.trim(3, 0)
#return v167.adjustBorders.hist_levels.prefetch

v168 = full.trim(22156, 22548)
v168 = v168.crop(left + 84, top - 90, right + 20, bot - 138)
v168 = v168.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 235, autolevel = false)
v168 = v168.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v168.trim(3, 390) +\
       v168.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(391, 0)
#return v168.adjustBorders.hist_levels.prefetch

v169 = full.trim(22549, 22768)
v169 = v169.crop(left + 104, top - 90, right + 40, bot - 138)
v169 = v169.autolevels(input_low = 0, output_low = 16, input_high = 250, output_high = 255, autolevel = false)
v169 = v169.deflickOverlapped(step = 100, radius = 2, toward_darkest = true, right2left = false).trim(0, 2) +\
       v169.trim(3, 0)
v169 = v169.deflickOverlapped(width = 400, step = 200, radius = 10, toward_darkest = true, right2left = true)
v169 = v169.correct_left_side(width = 400).correct_left_side(width = 100)
#return v169.adjustBorders.hist_levels.prefetch

# 21293, 21633, 21812, 21839, 22156, 22549, 22769, 22904
v170 = full.trim(22769, 22864)
v170 = v170.crop(left + 104, top - 90, right + 40, bot - 138)
#v170 = v170.autolevels(input_low = 0, output_low = 16, input_high = 250, output_high = 255, autolevel = false)
v170 = v170.deflickOverlapped(step = 100, radius = 2, toward_darkest = true, right2left = false).trim(0, 2) +\
       v170.trim(3, 0)
v170 = v170.correct_left_side(width = 400).correct_left_side(width = 100)
#return v170.adjustBorders.hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*
#******

# 161

v161 = LSMASHVideoSource(dst_dir + "v161f.mp4").ConvertToYV24()
b_ex = undefined
v161o = v161
v161 = v161.AdjustColor(ou = -6, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v161i = v161
v161 = expr(v161.extractY, v161.extractU, v161.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v161 = v161.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v161a = v161i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v161i.interleave(v161).hist_levels.prefetch
v161 = v161.adjustSize
v161 = v161.assumeFPS(18)
v161 = v161.add_blank_audio
return v161.prefetch
#adjustframerate

v162 = LSMASHVideoSource(dst_dir + "v162f.mp4").ConvertToYV24()
b_ex = undefined
v162o = v162
v162 = v162.AdjustColor(ou = -6, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v162i = v162
v162 = expr(v162.extractY, v162.extractU, v162.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v162 = v162.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v162a = v162i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v162i.interleave(v162).hist_levels.prefetch
v162 = v162.adjustSize
v162 = v162.assumeFPS(18)
v162 = v162.add_blank_audio
return v162.prefetch
#adjustframerate

v163 = LSMASHVideoSource(dst_dir + "v163f.mp4").ConvertToYV24()
b_ex = undefined
v163o = v163
v163 = v163.AdjustColor(ou = -6, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v163i = v163
v163 = expr(v163.extractY, v163.extractU, v163.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v163 = v163.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v163a = v163i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v163i.interleave(v163).hist_levels.prefetch
v163 = v163.adjustSize
v163 = v163.assumeFPS(18)
v163 = v163.add_blank_audio
return v163.prefetch
#adjustframerate

v164 = LSMASHVideoSource(dst_dir + "v164f.mp4").ConvertToYV24()
b_ex = undefined
v164o = v164
v164 = v164.AdjustColor(ou = -6, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v164i = v164
v164 = expr(v164.extractY, v164.extractU, v164.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v164 = v164.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v164a = v164i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v164i.interleave(v164).hist_levels.prefetch
v164 = v164.adjustSize
v164 = v164.assumeFPS(18)
v164 = v164.add_blank_audio
return v164.prefetch
#adjustframerate

v165 = LSMASHVideoSource(dst_dir + "v165f.mp4").ConvertToYV24()
b_ex = undefined
v165o = v165
v165 = v165.AdjustColor(ou = -6, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v165i = v165
v165 = expr(v165.extractY, v165.extractU, v165.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v165 = v165.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v165a = v165i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v165i.interleave(v165).hist_levels.prefetch
v165 = v165.adjustSize
v165 = v165.assumeFPS(18)
v165 = v165.add_blank_audio
return v165.prefetch
#adjustframerate

v166 = LSMASHVideoSource(dst_dir + "v166f.mp4").ConvertToYV24()
v166 = v166.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v166o = v166
v166 = v166.AdjustColor(ou = -6, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v166i = v166
v166 = expr(v166.extractY, v166.extractU, v166.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v166 = v166.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v166a = v166i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v166i.interleave(v166).hist_levels.prefetch
v166 = v166.adjustSize
v166 = v166.assumeFPS(18)
v166 = v166.add_blank_audio
return v166.prefetch
#adjustframerate

v167 = LSMASHVideoSource(dst_dir + "v167f.mp4").ConvertToYV24()
b_ex = undefined
v167o = v167
v167 = v167.AdjustColor(ou = -2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v167i = v167
v167 = expr(v167.extractY, v167.extractU, v167.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v167 = v167.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v167a = v167i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v167i.interleave(v167).hist_levels.prefetch
v167 = v167.adjustSize
v167 = v167.assumeFPS(18)
v167 = v167.add_blank_audio
return v167.prefetch
#adjustframerate

v168 = LSMASHVideoSource(dst_dir + "v168f.mp4").ConvertToYV24()
b_ex = undefined
v168o = v168
v168 = v168.AdjustColor(ou = -4, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v168i = v168
v168 = expr(v168.extractY, v168.extractU, v168.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v168 = v168.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v168a = v168i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v168 = v168.colorYUV(off_u = +2, off_v = -0)
#return v168i.interleave(v168).hist_levels.prefetch
v168 = v168.adjustSize
v168 = v168.assumeFPS(18)
v168 = v168.add_blank_audio
return v168.prefetch
#adjustframerate

v169 = LSMASHVideoSource(dst_dir + "v169f.mp4").ConvertToYV24()
b_ex = undefined
v169o = v169
v169 = v169.AdjustColor(ou = -4, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v169i = v169
v169 = expr(v169.extractY, v169.extractU, v169.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v169 = v169.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v169a = v169i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v169 = v169.colorYUV(off_u = +2, off_v = -0)
#return v169i.interleave(v169).hist_levels.prefetch
v169 = v169.adjustSize
v169 = v169.assumeFPS(18)
v169 = v169.add_blank_audio
return v169.prefetch
#adjustframerate

v170 = LSMASHVideoSource(dst_dir + "v170f.mp4").ConvertToYV24()
v170 = v170.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v170 = v170.trim(105, -1).loop(v170.frameCount).crop(0, 0, -(v170.width - add_width), 0).stackHorizontal(v170)
#return v170.histogram.prefetch
v170o = v170
v170 = v170.AdjustColor(ou = -4, ov = -0, x=500, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v170.hist_levels.prefetch
#v170 = v170.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v170 = expr(v170.extractY, v170.extractU, v170.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v170i = v170
v170 = expr(v170.extractY, v170.extractU, v170.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v170 = v170.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v170a = v170i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v170 = v170.crop(add_width, 0, 0, 0)
#v170i = v170i.crop(add_width, 0, 0, 0)
#v170a = v170a.crop(add_width, 0, 0, 0)
#v170 = v170.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v170 = v170.colorYUV(off_u = +2, off_v = -0)
#v170 = v170i
#return v170i.interleave(v170).hist_levels.prefetch
v170 = v170.adjustSize
v170 = v170.assumeFPS(18)
v170 = v170.add_blank_audio
return v170.prefetch
#adjustframerate

#******
*/