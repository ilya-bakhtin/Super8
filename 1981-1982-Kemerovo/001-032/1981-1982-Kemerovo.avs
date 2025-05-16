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

# 183, 336, 421, 471, 590, 671, 763, 978, 1115, 1159, 1273, 1314, 1451, 1622, 1827, 2067, 2090, 2168, 2409, 2441, 2448,   # 20
#skip (2409, 2440) (2441, 2447)
# 2550, 2718, 2726, 2902, 2935, 2997, 3103, 3131, 3239, 3459, 3493, 3584, 3687, 3822, 4074, 4248, 4395, 4497, 4558, 4629, # 40

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
v1 = full.trim(183, 335)
v1 = v1.crop(left + 20, top - 20, right + 20, bot - 20)
v1 = v1.trim(0, -1).autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 160, autolevel = false) + v1.trim(1, 0)
v1 = v1.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v1.trim(3, 0)
v1 = v1.trim(0, 23) +\
     v1.trim(23, 25).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(1, 1) +\
     v1.trim(25, 0)
#return v1.adjustBorders#.autolevels(gamma = 3.0, minRng = 0, ignore_low = 0.03).colorYUV(autoWhite = true).tweak(sat = 2, coring = false).hist_levels.prefetch

v2 = full.trim(336, 420)
v2 = v2.crop(left + 58, top + 24, right + 2, bot - 18)
v2 = v2.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v2 = v2.correct_left_side(width = 200).correct_left_side(width = 100)
#return v2.adjustBorders.hist_levels.prefetch

v3 = full.trim(421, 470)
v3 = v3.crop(left + 64, top + 30, right + 0, bot - 18)
v3 = v3.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v3.trim(3, 0)
v3 = v3.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v3 = v3.correct_left_side(width = 200).correct_left_side(width = 100)
#return v3.adjustBorders.hist_levels.prefetch

v4 = full.trim(471, 589)
v4 = v4.crop(left + 58, top + 24, right + 2, bot - 18)
v4 = v4.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v4.trim(3, 0)
v4 = v4.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v4 = v4.correct_left_side(width = 200).correct_left_side(width = 100)
#return v4.adjustBorders.hist_levels.prefetch

v5 = full.trim(591, 670)
v5 = v5.crop(left + 58, top + 24, right + 2, bot - 18)
v5 = v5.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v5 = v5.correct_left_side(width = 200).correct_left_side(width = 100)
#return v5.adjustBorders.hist_levels.prefetch

v6 = full.trim(671, 762)
v6 = v6.crop(left + 64, top + 30, right + 0, bot - 18)
v6 = v6.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v6.trim(3, 0)
v6 = v6.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v6 = v6.correct_left_side(width = 200).correct_left_side(width = 100)
#return v6.adjustBorders.hist_levels.prefetch

v7 = full.trim(763, 977)
v7 = v7.crop(left + 64, top + 30, right + 0, bot - 18)
v7 = v7.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v7.trim(3, 0)
v7 = v7.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v7 = v7.correct_left_side(width = 100)
#return v7.adjustBorders.hist_levels.prefetch

v8 = full.trim(978, 1114)
v8 = v8.crop(left + 58, top + 24, right + 2, bot - 18)
v8 = v8.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v8.trim(3, 0)
v8 = v8.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v8 = v8.correct_left_side(width = 100)
#return v8.adjustBorders.hist_levels.prefetch

v9 = full.trim(1115, 1158)
v9 = v9.crop(left + 64, top + 30, right + 0, bot - 18)
v9 = v9.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
     v9.trim(3, 0)
v9 = v9.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v9 = v9.correct_left_side(width = 200).correct_left_side(width = 100)
#return v9.adjustBorders.hist_levels.prefetch

v10 = full.trim(1159, 1272)
v10 = v10.crop(left + 64, top + 30, right + 0, bot - 18)
v10 = v10.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v10.trim(3, 0)
v10 = v10.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v10 = v10.correct_left_side(width = 200).correct_left_side(width = 100)
#return v10.adjustBorders.hist_levels.prefetch

v11 = full.trim(1273, 1313)
v11 = v11.crop(left + 64, top + 30, right + 0, bot - 18)
v11 = v11.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v11.trim(3, 0)
v11 = v11.correct_left_side(width = 200).correct_left_side(width = 100)
#return v11.adjustBorders.hist_levels.prefetch

v12 = full.trim(1314, 1450)
v12 = v12.crop(left + 64, top + 30, right + 0, bot - 18)
v12 = v12.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v12.trim(3, 0)
v12 = v12.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v12 = v12.correct_left_side(width = 200).correct_left_side(width = 100)
#return v12.adjustBorders.hist_levels.prefetch

v13 = full.trim(1451, 1621)
v13 = v13.crop(left + 64, top + 30, right + 0, bot - 18)
v13 = v13.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v13.trim(3, 0)
v13 = v13.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v13 = v13.correct_left_side(width = 200).correct_left_side(width = 100)
#return v13.adjustBorders.hist_levels.prefetch

v14 = full.trim(1622, 1826)
v14 = v14.crop(left + 64, top + 30, right + 0, bot - 18)
v14 = v14.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v14.trim(3, 0)
v14 = v14.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v14 = v14.correct_left_side(width = 200).correct_left_side(width = 100)
#return v14.adjustBorders.hist_levels.prefetch

v15 = full.trim(1827, 2066)
v15 = v15.crop(left + 64, top + 30, right + 0, bot - 18)
v15 = v15.trim(0, 1) +\
      v15.trim(2, 5).autolevels(input_low = 0, output_low = 16, input_high = 235, output_high = 255, autolevel = false) +\
      v15.trim(6, 9).autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false) +\
      v15.trim(10, 12).autolevels(input_low = 0, output_low = 8, input_high = 235, output_high = 255, autolevel = false) +\
      v15.trim(13, 0).autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v15 = v15.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v15.trim(3, 0)
v15 = v15.deflickOverlapped(step = 100, radius = 2, toward_darkest = true, right2left = false).trim(0, 3) +\
      v15.trim(4, 0)
#v15 = v15.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v15 = v15.correct_left_side(width = 200).correct_left_side(width = 100)
#return v15.adjustBorders.hist_levels.prefetch

v16 = full.trim(2067, 2089)
v16 = v16.crop(left + 64, top + 30, right + 0, bot - 18)
v16 = v16.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v16.trim(3, 0)
v16 = v16.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v16 = v16.correct_left_side(width = 200).correct_left_side(width = 100)
#return v16.adjustBorders.hist_levels.prefetch

v17 = full.trim(2090, 2167)
v17 = v17.crop(left + 64, top + 30, right + 0, bot - 18)
v17fc = v17.frameCount
v17 = v17.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v17.trim(3, v17fc - 2) +\
      v17.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v17fc - 1, -1)
v17 = v17.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
#return v17.adjustBorders.hist_levels.prefetch

v18 = full.trim(2168, 2408)
v18 = v18.crop(left + 64, top + 30, right + 0, bot - 18).trim(0, 234) +\
      v18.animate(235, 240, "crop", left + 64, top + 30, right + 0, bot - 18, left + 114, top + 30, right + 50, bot - 18).trim(235, 0)
v18 = v18.trim(0, 194) +\
      v18.trim(194, 196).deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(1, 1) +\
      v18.trim(196, 0)
v18 = v18.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 255, autolevel = false).trim(0, 233) +\
      v18.autolevels(input_low = 0, output_low = 16, input_high = 255, output_high = 235, autolevel = false).trim(234, 0)
#return v18.adjustBorders.hist_levels.prefetch

v19 = full.trim(2448, 2549)
v19 = v19.crop(left + 64, top + 0, right + 0, bot - 48)
v19 = v19.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
v19 = v19.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v19.trim(3, 0)
#return v19.adjustBorders.hist_levels.prefetch

v20 = full.trim(2551, 2717)
v20 = v20.crop(left + 64, top + 0, right + 0, bot - 48)
v20 = v20.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
#return v20.adjustBorders.hist_levels.prefetch

v21 = full.trim(2718, 2725)
v21 = v21.crop(left + 64, top + 0, right + 0, bot - 48)
v21 = v21.trim(0, 6) +\
      v21.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(7, 0)
#return v21.adjustBorders.hist_levels.prefetch

v22 = full.trim(2726, 2901)
v22 = v22.crop(left + 64, top + 0, right + 0, bot - 48)
v22 = v22.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
#return v22.adjustBorders.hist_levels.prefetch

v23 = full.trim(2902, 2934)
v23 = v23.crop(left + 64, top + 0, right + 0, bot - 48)
v23 = v23.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
#return v23.adjustBorders.hist_levels.prefetch

v24 = full.trim(2936, 2996)
v24 = v24.crop(left + 64, top + 0, right + 0, bot - 48)
v24 = v24.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
#return v24.adjustBorders.hist_levels.prefetch

v25 = full.trim(2997, 3102)
v25 = v25.crop(left + 64, top + 0, right + 0, bot - 48)
v25 = v25.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v25.trim(3, 0)
#return v25.adjustBorders.hist_levels.prefetch

v26 = full.trim(3103, 3130)
v26 = v26.crop(left + 64, top + 0, right + 0, bot - 48)
v26 = v26.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
v26 = v26.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v26.trim(3, 0)
#return v26.adjustBorders.hist_levels.prefetch

v27 = full.trim(3132, 3238)
v27 = v27.crop(left + 64, top + 0, right + 0, bot - 48)
v27 = v27.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
#return v27.adjustBorders.hist_levels.prefetch

v28 = full.trim(3240, 3458)
v28 = v28.crop(left + 64, top + 0, right + 0, bot - 48)
v28 = v28.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 245, autolevel = false)
#return v28.adjustBorders.hist_levels.prefetch

v29 = full.trim(3459, 3492)
v29 = v29.crop(left + 64, top + 0, right + 0, bot - 48)
v29 = v29.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
v29 = v29.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v29.trim(3, 0)
#return v29.adjustBorders.hist_levels.prefetch

v30 = full.trim(3493, 3584)
v30 = v30.crop(left + 64, top + 0, right + 0, bot - 48)
v30 = v30.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
v30fc = v30.frameCount
v30 = v30.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v30.trim(3, v30fc - 2) +\
      v30.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v30fc - 1, 0)
#return v30.adjustBorders.hist_levels.prefetch

v31 = full.trim(3585, 3686)
v31 = v31.crop(left + 64, top + 0, right + 0, bot - 48)
v31 = v31.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 240, autolevel = false)
#return v31.adjustBorders.hist_levels.prefetch

v32 = full.trim(3688, 3821)
v32 = v32.trim(0, 119)
v32 = v32.crop(left + 64, top + 0, right + 0, bot - 48)
v32fc = v32.frameCount
v32 = v32.trim(0, v32fc - 2) +\
      v32.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v32fc - 1, 0)
#return v32.adjustBorders.hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*
#******

# 1

v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
v1 = v1.autolevels(input_low = 0, output_low = 4, input_high = 251, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
v1 = v1.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
b_ex = undefined
v1 = v1.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
v1 = v1.autolevels(minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate

v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
b_ex = undefined
v2 = v2.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v2i = v2
v2 = expr(v2.extractY, v2.extractU, v2.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v2 = v2.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=2.)
v2a = v2i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate

v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
b_ex = undefined
v3 = v3.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v3i = v3
v3 = expr(v3.extractY, v3.extractU, v3.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=2.)
v3a = v3i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate

v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
b_ex = undefined
v4 = v4.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v4i = v4
v4 = expr(v4.extractY, v4.extractU, v4.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v4 = v4.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v4a = v4i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate

v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").ConvertToYV24()
b_ex = undefined
v5 = v5.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v5i = v5
v5 = expr(v5.extractY, v5.extractU, v5.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v5 = v5.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v5a = v5i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
v5 = v5.add_blank_audio
return v5.prefetch
#adjustframerate

v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
b_ex = undefined
v6 = v6.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v6 = expr(v6.extractY, v6.extractU, v6.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v6i = v6
v6 = expr(v6.extractY, v6.extractU, v6.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v6 = v6.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v6a = v6i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate

v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").ConvertToYV24()
b_ex = undefined
v7 = v7.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v7i = v7
v7 = expr(v7.extractY, v7.extractU, v7.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v7 = v7.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v7a = v7i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v7 = v7.colorYUV(off_u = +4, off_v = -4)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
v7 = v7.add_blank_audio
return v7.prefetch
#adjustframerate

v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").ConvertToYV24()
b_ex = undefined
v8 = v8.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v8i = v8
v8 = expr(v8.extractY, v8.extractU, v8.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v8 = v8.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v8a = v8i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v8 = v8.colorYUV(off_u = +4, off_v = -4)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
v8 = v8.add_blank_audio
return v8.prefetch
#adjustframerate

v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
b_ex = undefined
v9 = v9.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v9i = v9
v9 = expr(v9.extractY, v9.extractU, v9.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v9a = v9i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v9 = v9.colorYUV(off_u = +4, off_v = -4)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate

v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
b_ex = undefined
v10 = v10.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v10i = v10
v10 = expr(v10.extractY, v10.extractU, v10.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v10 = v10.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v10a = v10i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v10 = v10.colorYUV(off_u = +4, off_v = -4)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate

v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
v11 = v11.autolevels(input_low = 0, output_low = 4, input_high = 255, output_high = 235, autolevel = false)
b_ex = undefined
#return v11.histogram
add_height = 600
v11 = v11.trim(24, -1).loop(v11.frameCount).crop(0, v11.height - add_height, 0, 0).stackVertical(v11)
v11 = v11.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v11i = v11
v11 = expr(v11.extractY, v11.extractU, v11.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v11 = v11.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.0003, gamma=1.5)
v11a = v11i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v11 = v11.crop(0, add_height, 0, 0)
v11 = v11.colorYUV(off_u = +4, off_v = -4)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate

v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").ConvertToYV24()
b_ex = undefined
#return v12.histogram
v12 = v12.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v12i = v12
v12 = expr(v12.extractY, v12.extractU, v12.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v12 = v12.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v12a = v12i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v12 = v12.colorYUV(off_u = +4, off_v = -4)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
v12 = v12.add_blank_audio
return v12.prefetch
#adjustframerate

v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
v13o = v13
b_ex = undefined
#return v13.histogram.prefetch
v13 = v13.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v13i = v13
v13 = expr(v13.extractY, v13.extractU, v13.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v13 = v13.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v13a = v13i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v13 = v13.colorYUV(off_u = +2, off_v = -2)
#return v13o.interleave(v13).hist_levels
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate

v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").ConvertToYV24()
v14o = v14
b_ex = undefined
#return v14.histogram.prefetch
v14 = v14.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v14i = v14
v14 = expr(v14.extractY, v14.extractU, v14.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v14 = v14.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v14a = v14i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v14 = v14.colorYUV(off_u = +2, off_v = -2)
#return v14o.interleave(v14).hist_levels
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
v14 = v14.add_blank_audio
return v14.prefetch
#adjustframerate

v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
v15o = v15
b_ex = undefined
v15 = v15.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
#return v15.histogram.prefetch
v15 = v15.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v15i = v15
v15 = expr(v15.extractY, v15.extractU, v15.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v15 = v15.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v15a = v15i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v15 = v15.colorYUV(off_u = +2, off_v = -2)
#return v15o.interleave(v15).hist_levels
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate

v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
v16o = v16
b_ex = undefined
#return v16.histogram.prefetch
v16 = v16.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v16i = v16
v16 = expr(v16.extractY, v16.extractU, v16.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v16 = v16.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v16a = v16i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v16o.interleave(v16).hist_levels
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate

v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
v17o = v17
b_ex = undefined
v17 = v17.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
#return v17.histogram.prefetch
v17 = v17.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v17 = expr(v17.extractY, v17.extractU, v17.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v17i = v17
v17 = expr(v17.extractY, v17.extractU, v17.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v17 = v17.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v17a = v17i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v17 = v17.colorYUV(off_u = +2, off_v = -2)
#return v17o.interleave(v17).hist_levels
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate

v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").ConvertToYV24()
v18o = v18
b_ex = undefined
v18 = v18.autolevels(input_low = 12, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
#return v18.histogram.prefetch
add_height = 400
v18 = v18.trim(188, -1).loop(v18.frameCount).crop(0, v18.height - add_height, 0, 0).stackVertical(v18)
v18 = v18.AdjustColor(ou = +2, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v18i = v18
v18 = expr(v18.extractY, v18.extractU, v18.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v18 = v18.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0009, gamma=1.3)
v18a = v18i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v18 = v18.crop(0, add_height, 0, 0)
v18a = v18a.crop(0, add_height, 0, 0)
v18 = v18.colorYUV(off_u = -2, off_v = +2)
#return v18o.interleave(v18).hist_levels
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
v18 = v18.add_blank_audio
return v18.prefetch
#adjustframerate

v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
v19o = v19
b_ex = undefined
#return v19.histogram.prefetch
v19 = v19.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v19i = v19
v19 = expr(v19.extractY, v19.extractU, v19.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v19 = v19.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v19a = v19i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v19 = v19.colorYUV(off_u = -2, off_v = +2)
#return v19o.interleave(v19).hist_levels
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate

v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
v20o = v20
b_ex = undefined
#return v20.histogram.prefetch
v20 = v20.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v20i = v20
v20 = expr(v20.extractY, v20.extractU, v20.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v20 = v20.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v20a = v20i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v20o.interleave(v20).hist_levels
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate

v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").ConvertToYV24()
b_ex = undefined
#return v21.histogram.prefetch
v21 = v21.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v21i = v21
v21 = expr(v21.extractY, v21.extractU, v21.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v21 = v21.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.003, gamma=1.5)
v21a = v21i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
v21 = v21.add_blank_audio
return v21.prefetch
#adjustframerate

v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
v22o = v22
b_ex = undefined
#return v22.histogram.prefetch
v22 = v22.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=0.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v22i = v22
v22 = expr(v22.extractY, v22.extractU, v22.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v22 = v22.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v22a = v22i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v22 = v22.colorYUV(off_u = +2, off_v = -2)
#return v22o.interleave(v22).hist_levels
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate

v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
v23o = v23
b_ex = undefined
#return v23.histogram.prefetch
v23 = v23.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=0.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v23i = v23
v23 = expr(v23.extractY, v23.extractU, v23.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v23 = v23.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v23a = v23i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v23 = v23.colorYUV(off_u = +2, off_v = +2)
#return v23o.interleave(v23).hist_levels
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate

v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").ConvertToYV24()
v24o = v24
v24 = v24.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v24.histogram.prefetch
v24 = v24.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v24i = v24
v24 = expr(v24.extractY, v24.extractU, v24.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v24 = v24.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v24a = v24i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v24 = v24.colorYUV(off_u = +2, off_v = +2)
#return v24o.interleave(v24).hist_levels
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
v24 = v24.add_blank_audio
return v24.prefetch
#adjustframerate

v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
v25o = v25
v25 = v25.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v25.histogram.prefetch
v25 = v25.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v25 = expr(v25.extractY, v25.extractU, v25.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v25i = v25
v25 = expr(v25.extractY, v25.extractU, v25.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v25 = v25.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v25a = v25i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v25 = v25.colorYUV(off_u = +6, off_v = -0)
#return v25o.interleave(v25).hist_levels
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate

v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
b_ex = undefined
#return v26.histogram.prefetch
v26 = v26.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v26i = v26
v26 = expr(v26.extractY, v26.extractU, v26.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v26 = v26.autolevels(filterRadius=0, minRng=0, ignore_low=0.012, ignore_high=0.003, gamma=1.3)
v26a = v26i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate

v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
v27o = v27
b_ex = undefined
#return v27.histogram.prefetch
v27 = v27.AdjustColor(ou = +0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v27 = expr(v27.extractY, v27.extractU, v27.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v27i = v27
v27 = expr(v27.extractY, v27.extractU, v27.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v27 = v27.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v27a = v27i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v27o.interleave(v27).hist_levels
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate

v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
v28o = v28
v28 = v28.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v28.histogram.prefetch
v28 = v28.AdjustColor(ou = +0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=false, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v28i = v28
v28 = expr(v28.extractY, v28.extractU, v28.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v28 = v28.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v28a = v28i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#v28 = v28.colorYUV(off_u = -8, off_v = +0)
#return v28o.interleave(v28).hist_levels
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate

v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
b_ex = undefined
#return v29.histogram.prefetch
v29 = v29.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v29i = v29
v29 = expr(v29.extractY, v29.extractU, v29.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v29 = v29.autolevels(filterRadius=0, minRng=0, ignore_low=0.012, ignore_high=0.003, gamma=1.1)
v29a = v29i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate

v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").ConvertToYV24()
b_ex = undefined
#return v30.histogram.prefetch
v30 = v30.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v30i = v30
v30 = expr(v30.extractY, v30.extractU, v30.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v30 = v30.autolevels(filterRadius=0, minRng=0, ignore_low=0.012, ignore_high=0.003, gamma=1.1)
v30a = v30i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
v30 = v30.add_blank_audio
return v30.prefetch
#adjustframerate

v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
v31o = v31
v31 = v31.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v31.histogram.prefetch
v31 = v31.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v31i = v31
v31 = expr(v31.extractY, v31.extractU, v31.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v31 = v31.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v31a = v31i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v31o.interleave(v31).hist_levels
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate

v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
v32 = v32.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 230, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 400
#v32 = v32.trim(188, -1).loop(v32.frameCount).crop(0, v32.height - add_height, 0, 0).stackVertical(v32)
#return v32.histogram.prefetch
v32o = v32
v32 = v32.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v32.hist_levels.prefetch
#v32 = v32.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v32 = expr(v32.extractY, v32.extractU, v32.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v32i = v32
v32 = expr(v32.extractY, v32.extractU, v32.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v32 = v32.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=1.2)
v32a = v32i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#v32 = v32.crop(0, add_height, 0, 0)
#v32a = v32a.crop(0, add_height, 0, 0)
#v32 = v32.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v32 = v32.colorYUV(off_u = -6, off_v = +4)
#return v32o.interleave(v32).hist_levels
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate

#******
*/