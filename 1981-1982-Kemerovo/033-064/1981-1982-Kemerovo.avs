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
# 7345, 7621, 7673, 8001, 8208, 8296, 8438, 8606, 8861, 8936, 9148, 9307, 9578, 9717, 9814, 9906, 10010, 10168, 10262, 10335,   # 80
#skip (8208, 8295)
# 10411, 10526, 10680, 10735, 10804, 10910, 10977, 11029, 11232, 11416, 11521, 11674, 11723, 11757, 11999, 12140, 12292, 12382, # 98
# 12547, 

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

v33 = full.trim(3822, 4073)
v33 = v33.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v33 = v33.crop(left + 50, top + 0, right - 14, bot - 48)
v33 = v33.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v33.trim(3, 0)
#return v33.adjustBorders.hist_levels.prefetch
/*
v34 = full.trim(4074, 4247)
v34 = v34.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v34 = v34.crop(left + 50, top + 0, right - 14, bot - 48)
v34 = v34.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 3) +\
      v34.trim(4, 0)
#return v34.adjustBorders.hist_levels.prefetch

v35 = full.trim(4248, 4394)
v35 = v35.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 235, autolevel = false)
v35 = v35.crop(left + 50, top + 0, right - 14, bot - 48)
v35 = v35.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v35.trim(3, 0)
#return v35.adjustBorders.hist_levels.prefetch

v36 = full.trim(4395, 4496)
v36 = v36.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 250, autolevel = false)
v36 = v36.crop(left + 50, top + 0, right - 14, bot - 48)
v36 = v36.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v36.trim(3, 0)
#return v36.adjustBorders.hist_levels.prefetch

v37 = full.trim(4497, 4558)
v37 = v37.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false)
v37 = v37.crop(left + 50, top + 0, right - 14, bot - 48)
v37fc = v37.frameCount
v37 = v37.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v37.trim(3, v37fc - 2) +\
      v37.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(v37fc - 1, -1)
#return v37.adjustBorders.hist_levels.prefetch

v38 = full.trim(4559, 4628)
v38 = v38.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
v38 = v38.crop(left + 50, top + 0, right - 14, bot - 48)
#return v38.adjustBorders.hist_levels.prefetch

v39 = full.trim(4629, 4758)
#v39 = v39.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 255, autolevel = false)
v39 = v39.crop(left + 64, top + 0, right - 0, bot - 48).trim(0, 125) +\
      v39.crop(left + 94, top + 0, right + 30, bot - 48).trim(126, 128) +\
      v39.crop(left + 104, top + 0, right + 40, bot - 48).trim(129, 0)
v39 = v39.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v39.trim(3, 0)
#return v39.adjustBorders.hist_levels.prefetch

v40 = full.trim(4835, 5157)
v40 = v40.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v40 = v40.crop(left + 64, top + 0, right - 0, bot - 48)
#return v40.adjustBorders.hist_levels.prefetch

v41 = full.trim(5158, 5368)
v41 = v41.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v41 = v41.crop(left + 64, top + 0, right - 0, bot - 48)
v41 = v41.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v41.trim(3, 0)
#return v41.adjustBorders.hist_levels.prefetch

v42 = full.trim(5369, 5567)
v42 = v42.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false)
v42 = v42.crop(left + 64, top + 0, right - 0, bot - 48)
v42 = v42.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v42.trim(3, 0)
#return v42.adjustBorders.hist_levels.prefetch

v43 = full.trim(5568, 5674)
v43 = v43.crop(left + 64, top + 0, right - 0, bot - 48)
v43 = v43.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v43.trim(3, 0)
#return v43.adjustBorders.hist_levels.prefetch

v44 = full.trim(5683, 5941)
v44 = v44.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false)
v44 = v44.crop(left + 64, top + 0, right - 0, bot - 48)
#return v44.adjustBorders.hist_levels.prefetch

v45 = full.trim(5942, 6022)
#v45 = v45.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false)
v45 = v45.crop(left + 64, top + 0, right - 0, bot - 48)
v45 = v45.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v45.trim(3, 0)
v45 = v45.deflickOverlapped(step = 200, radius = 5, toward_darkest = true, right2left = false)
v45 = v45.correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100)
#return v45.adjustBorders.hist_levels.prefetch

v46 = full.trim(6023, 6100)
v46 = v46.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v46 = v46.crop(left + 64, top + 0, right - 0, bot - 48)
v46 = v46.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v46.trim(3, 0)
#return v46.adjustBorders.hist_levels.prefetch

v47 = full.trim(6101, 6104)
#v47 = v47.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v47 = v47.crop(left + 64, top + 0, right - 0, bot - 48)
v47 = v47.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v47.trim(3, 0)
#return v47.adjustBorders.hist_levels.prefetch

v48 = full.trim(6105, 6109)
v48 = v48.crop(left + 64, top + 0, right - 0, bot - 48)
v48 = v48.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v48.trim(3, 0)
#return v48.adjustBorders.hist_levels.prefetch

v49 = full.trim(6110, 6135)
v49 = v49.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v49 = v49.crop(left + 64, top + 0, right - 0, bot - 48)
v49 = v49.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v49.trim(3, 0)
#return v49.adjustBorders.hist_levels.prefetch

v50 = full.trim(6136, 6263)
v50 = v50.crop(left + 64, top + 0, right - 0, bot - 48)
v50 = v50.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v50 = v50.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v50.trim(3, 0)
#return v50.adjustBorders.hist_levels.prefetch

v51 = full.trim(6264, 6297)
v51 = v51.crop(left + 64, top + 0, right - 0, bot - 48)
v51 = v51.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v51 = v51.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v51.trim(3, 0)
#return v51.adjustBorders.hist_levels.prefetch

v52 = full.trim(6298, 6510)
v52 = v52.crop(left + 64, top + 0, right - 0, bot - 48)
v52 = v52.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false)
v52 = v52.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v52.trim(3, 0)
#return v52.adjustBorders.hist_levels.prefetch

v53 = full.trim(6511, 6515)
v53 = v53.crop(left + 64, top + 0, right - 0, bot - 48)
v53 = v53.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v53 = v53.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v53.trim(3, 0)
#return v53.adjustBorders.hist_levels.prefetch

v54 = full.trim(6516, 6749)
v54 = v54.crop(left + 64, top + 0, right - 0, bot - 48)
v54 = v54.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v54 = v54.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v54.trim(3, 0)
#return v54.adjustBorders.hist_levels.prefetch

v55 = full.trim(6750, 6995)
v55 = v55.crop(left + 64, top + 0, right - 0, bot - 48)
v55 = v55.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false)
v55 = v55.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v55.trim(3, 0)
#v55 = v55.deflickOverlapped(step = 200, radius = 5, toward_darkest = true, right2left = false)
#v55 = v55.correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100)
#return v55.adjustBorders.hist_levels.prefetch

v56 = full.trim(6996, 7102)
v56 = v56.crop(left + 64, top + 0, right - 0, bot - 48)
v56 = v56.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v56 = v56.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v56.trim(3, 0)
#return v56.adjustBorders.hist_levels.prefetch

v57 = full.trim(7103, 7191)
v57 = v57.crop(left + 64, top + 0, right - 0, bot - 48)
v57 = v57.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
#return v57.adjustBorders.hist_levels.prefetch

v58 = full.trim(7192, 7344)
v58 = v58.crop(left + 64, top + 0, right - 0, bot - 48)
v58 = v58.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v58 = v58.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v58.trim(3, 0)
#return v58.adjustBorders.hist_levels.prefetch

v59 = full.trim(7345, 7620)
v59 = v59.crop(left + 64, top + 0, right - 0, bot - 48)
v59 = v59.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v59 = v59.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v59.trim(3, 0)
#return v59.adjustBorders.hist_levels.prefetch

v60 = full.trim(7621, 7672)
v60 = v60.trim(7, 0)
v60 = v60.crop(left + 64, top + 0, right - 0, bot - 48)
v60fc = v60.frameCount
v60 = v60.trim(0, v60fc - 2) +\
      v60.deflickOverlapped(step = 400, radius = 1, toward_darkest = true, right2left = false).trim(v60fc - 1, -1)
v60 = v60.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
#return v60.adjustBorders.hist_levels.prefetch

v61 = full.trim(7673, 8000)
v61 = v61.crop(left + 64, top + 0, right - 0, bot - 48)
v61 = v61.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false)
#return v61.adjustBorders.hist_levels.prefetch

v62 = full.trim(8001, 8207)
v62 = v62.crop(left + 64, top + 0, right - 0, bot - 48)
v62 = v62.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v62 = v62.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v62.trim(3, 0)
v62 = v62.trim(0, 146) +\
      v62.trim(147, 0).deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = false).\
          correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100)
#return v62.adjustBorders.hist_levels.prefetch

v63_0 = full.trim(8208, 8295)
v63_0 = v63_0.crop(left + 64, top + 108, right - 0, bot + 60)
v63 = full.trim(8296, 8437)
v63 = v63.crop(left + 64, top + 0, right - 0, bot - 48)
v63 = v63_0.trim(0, 4) + v63
#v63 = v63.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
#v63 = v63.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v63.trim(3, 0)
v63 = v63.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = false).\
          correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100)
#return v63.adjustBorders.hist_levels.prefetch

# 7345, 7621, 8001, 8208, 8296, 8438, 8606, 8861, 8936, 9148, 9307, 9578, 9717, 9814, 9906, 10010, 10168, 10262, 10335, 10411,  # 80
v64 = full.trim(8438, 8605)
v64 = v64.crop(left + 64, top + 0, right - 0, bot - 48)
#v64 = v64.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false)
v64 = v64.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v64.trim(3, 0)
v64 = v64.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = false).\
          correct_left_side(width = 200).correct_left_side(width = 100)
#return v64.adjustBorders.hist_levels.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*
#******

# 33

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
v33 = v33.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 250, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v33.histogram.prefetch
v33o = v33
v33 = v33.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v33i = v33
v33 = expr(v33.extractY, v33.extractU, v33.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v33 = v33.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v33a = v33i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate

v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
v34 = v34.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v34.histogram.prefetch
v34o = v34
v34 = v34.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
#return v34.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v34i = v34
v34 = expr(v34.extractY, v34.extractU, v34.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v34 = v34.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v34a = v34i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v34o.interleave(v34).hist_levels
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate

v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
b_ex = undefined
#return v35.histogram.prefetch
v35o = v35
v35 = v35.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
#return v35.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v35i = v35
v35 = expr(v35.extractY, v35.extractU, v35.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v35 = v35.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v35a = v35i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v35o.interleave(v35).hist_levels
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate

v36 = LSMASHVideoSource(dst_dir + "v36f.mp4").ConvertToYV24()
v36 = v36.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 250, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v36.histogram.prefetch
v36o = v36
v36 = v36.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
#return v36.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v36i = v36
v36 = expr(v36.extractY, v36.extractU, v36.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v36 = v36.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v36a = v36i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v36o.interleave(v36).hist_levels
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
v36 = v36.add_blank_audio
return v36.prefetch
#adjustframerate

v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
b_ex = undefined
#return v37.histogram.prefetch
v37o = v37
v37 = v37.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.03 P0^ 0.95 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v37i = v37
v37 = expr(v37.extractY, v37.extractU, v37.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v37 = v37.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v37a = v37i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v37 = v37.colorYUV(off_u = +2, off_v = -2)
#return v37o.interleave(v37).hist_levels
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate

v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
b_ex = undefined
#return v38.histogram.prefetch
v38o = v38
v38 = v38.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v38.hist_levels.prefetch
ex_pfx = "0.05 P0^ 0.95 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v38i = v38
v38 = expr(v38.extractY, v38.extractU, v38.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v38 = v38.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v38a = v38i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v38 = v38.colorYUV(off_u = -2, off_v = -2)
#return v38o.interleave(v38).hist_levels
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate

v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
v39 = v39.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v39.histogram.prefetch
v39o = v39
v39 = v39.AdjustColor(ou = +0, ov = -0, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v39.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.94 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v39i = v39
v39 = expr(v39.extractY, v39.extractU, v39.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v39 = v39.autolevels(filterRadius=0, minRng=0, border_l = 400, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v39a = v39i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v39 = v39.colorYUV(off_u = -2, off_v = -2)
#return v39o.interleave(v39).hist_levels
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate

v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
b_ex = undefined
#return v40.histogram.prefetch
v40o = v40
v40 = v40.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v40i = v40
v40 = expr(v40.extractY, v40.extractU, v40.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v40 = v40.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v40a = v40i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v40 = v40.colorYUV(off_u = -2, off_v = -2)
#return v40o.interleave(v40).hist_levels
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate

v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
b_ex = undefined
#return v41.histogram.prefetch
v41o = v41
v41 = v41.AdjustColor(ou = +6, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v41.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v41i = v41
v41 = expr(v41.extractY, v41.extractU, v41.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v41 = v41.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v41a = v41i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v41 = v41.colorYUV(off_u = -4, off_v = +2)
#return v41o.interleave(v41).hist_levels
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate

v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
b_ex = undefined
#return v42.histogram.prefetch
v42o = v42
#return v42.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v42i = v42
v42 = expr(v42.extractY, v42.extractU, v42.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v42 = v42.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v42a = v42i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v42 = v42.colorYUV(off_u = +18, off_v = -4)
#return v42o.interleave(v42).hist_levels
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate

v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
b_ex = undefined
#return v43.histogram.prefetch
v43o = v43
v43 = v43.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v43.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v43i = v43
v43 = expr(v43.extractY, v43.extractU, v43.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v43 = v43.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v43a = v43i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v43 = v43.colorYUV(off_u = -10, off_v = +2)
#return v43o.interleave(v43).hist_levels
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate

function levels_x(clip c, int il, int ol, int ih, int oh)
{
    return c.autolevels(input_low = il, output_low = ol, input_high = ih, output_high = oh, autolevel = false, filterRadius = 0, minRng = 0)
}
v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
v44 = v44.animate(0, 12, "levels_x", 0, 0, 255, 140, 0, 0, 255, 255)
b_ex = undefined
#return v44.histogram.prefetch
v44o = v44
v44 = v44.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v44.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v44i = v44
v44 = expr(v44.extractY, v44.extractU, v44.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v44 = v44.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v44a = v44i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v44 = v44.colorYUV(off_u = -10, off_v = +2)
#return v44o.interleave(v44).hist_levels
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate

v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
v45 = v45.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v45.histogram.prefetch
v45o = v45
v45 = v45.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v45.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v45i = v45
v45 = expr(v45.extractY, v45.extractU, v45.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v45 = v45.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v45a = v45i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v45 = v45.colorYUV(off_u = -10, off_v = +2)
#return v45o.interleave(v45).hist_levels
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate

v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
b_ex = undefined
#return v46.histogram.prefetch
v46o = v46
v46 = v46.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v46.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v46i = v46
v46 = expr(v46.extractY, v46.extractU, v46.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v46 = v46.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v46a = v46i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v46 = v46.colorYUV(off_u = -10, off_v = +2)
#return v46o.interleave(v46).hist_levels
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate

v47 = LSMASHVideoSource(dst_dir + "v47f.mp4").ConvertToYV24()
v47 = v47.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v47.histogram.prefetch
v47o = v47
v47 = v47.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v47.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v47i = v47
v47 = expr(v47.extractY, v47.extractU, v47.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v47 = v47.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v47a = v47i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v47 = v47.colorYUV(off_u = -10, off_v = +2)
#return v47o.interleave(v47).hist_levels
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
v47 = v47.add_blank_audio
return v47.prefetch
#adjustframerate

v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
v48 = v48.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v48.histogram.prefetch
v48o = v48
v48 = v48.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v48.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v48i = v48
v48 = expr(v48.extractY, v48.extractU, v48.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v48 = v48.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v48a = v48i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v48 = v48.colorYUV(off_u = -10, off_v = +2)
#return v48o.interleave(v48).hist_levels
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate

v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
b_ex = undefined
#return v49.histogram.prefetch
v49o = v49
v49 = v49.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v49.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v49i = v49
v49 = expr(v49.extractY, v49.extractU, v49.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v49 = v49.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v49a = v49i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v49 = v49.colorYUV(off_u = -10, off_v = +2)
#return v49o.interleave(v49).hist_levels
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate

v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
b_ex = undefined
#return v50.histogram.prefetch
v50o = v50
v50 = v50.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v50.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v50i = v50
v50 = expr(v50.extractY, v50.extractU, v50.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v50 = v50.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v50a = v50i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v50 = v50.colorYUV(off_u = -10, off_v = +2)
#return v50o.interleave(v50).hist_levels
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate

v51 = LSMASHVideoSource(dst_dir + "v51f.mp4").ConvertToYV24()
b_ex = undefined
#return v51.histogram.prefetch
v51o = v51
v51 = v51.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v51.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v51i = v51
v51 = expr(v51.extractY, v51.extractU, v51.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v51 = v51.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v51a = v51i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v51 = v51.colorYUV(off_u = -10, off_v = +2)
#return v51o.interleave(v51).hist_levels
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
v51 = v51.add_blank_audio
return v51.prefetch
#adjustframerate

v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
b_ex = undefined
#return v52.histogram.prefetch
v52o = v52
v52 = v52.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v52.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v52i = v52
v52 = expr(v52.extractY, v52.extractU, v52.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v52 = v52.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v52a = v52i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v52 = v52.colorYUV(off_u = -10, off_v = +2)
#return v52o.interleave(v52).hist_levels
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate

v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
b_ex = undefined
#return v53.histogram.prefetch
v53o = v53
v53 = v53.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v53.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v53i = v53
v53 = expr(v53.extractY, v53.extractU, v53.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v53 = v53.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v53a = v53i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v53 = v53.colorYUV(off_u = -10, off_v = +2)
#return v53o.interleave(v53).hist_levels
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate

v54 = LSMASHVideoSource(dst_dir + "v54f.mp4").ConvertToYV24()
b_ex = undefined
#return v54.histogram.prefetch
v54o = v54
v54 = v54.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v54.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v54i = v54
v54 = expr(v54.extractY, v54.extractU, v54.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v54 = v54.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v54a = v54i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v54 = v54.colorYUV(off_u = -10, off_v = +2)
#return v54o.interleave(v54).hist_levels
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
v54 = v54.add_blank_audio
return v54.prefetch
#adjustframerate

v55 = LSMASHVideoSource(dst_dir + "v55f.mp4").ConvertToYV24()
b_ex = undefined
#return v55.histogram.prefetch
v55o = v55
v55 = v55.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v55.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v55i = v55
v55 = expr(v55.extractY, v55.extractU, v55.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v55 = v55.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v55a = v55i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v55 = v55.colorYUV(off_u = -10, off_v = +2)
#return v55o.interleave(v55).hist_levels
v55 = v55.adjustSize
v55 = v55.assumeFPS(18)
v55 = v55.add_blank_audio
return v55.prefetch
#adjustframerate

v56 = LSMASHVideoSource(dst_dir + "v56f.mp4").ConvertToYV24()
b_ex = undefined
#return v56.histogram.prefetch
v56o = v56
v56 = v56.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v56.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v56i = v56
v56 = expr(v56.extractY, v56.extractU, v56.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v56 = v56.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v56a = v56i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v56 = v56.colorYUV(off_u = -10, off_v = +2)
#return v56o.interleave(v56).hist_levels
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
v56 = v56.add_blank_audio
return v56.prefetch
#adjustframerate

v57 = LSMASHVideoSource(dst_dir + "v57f.mp4").ConvertToYV24()
b_ex = undefined
#return v57.histogram.prefetch
v57o = v57
v57 = v57.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v57.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v57i = v57
v57 = expr(v57.extractY, v57.extractU, v57.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v57 = v57.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v57a = v57i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v57o.interleave(v57).hist_levels
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
v57 = v57.add_blank_audio
return v57.prefetch
#adjustframerate

v58 = LSMASHVideoSource(dst_dir + "v58f.mp4").ConvertToYV24()
b_ex = undefined
#return v58.histogram.prefetch
v58o = v58
v58 = v58.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v58.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v58i = v58
v58 = expr(v58.extractY, v58.extractU, v58.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v58 = v58.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v58a = v58i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v58 = v58.colorYUV(off_u = -4, off_v = +0)
#return v58o.interleave(v58).hist_levels
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
v58 = v58.add_blank_audio
return v58.prefetch
#adjustframerate

v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
b_ex = undefined
#return v59.histogram.prefetch
v59o = v59
v59 = v59.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v59.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v59i = v59
v59 = expr(v59.extractY, v59.extractU, v59.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v59 = v59.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v59a = v59i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v59 = v59.colorYUV(off_u = -4, off_v = +0)
#return v59o.interleave(v59).hist_levels
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
v59 = v59.add_blank_audio
return v59.prefetch
#adjustframerate

v60 = LSMASHVideoSource(dst_dir + "v60f.mp4").ConvertToYV24()
b_ex = undefined
#return v60.histogram.prefetch
v60o = v60
v60 = v60.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v60.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v60i = v60
v60 = expr(v60.extractY, v60.extractU, v60.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v60 = v60.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v60a = v60i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v60 = v60.colorYUV(off_u = -4, off_v = +0)
#return v60o.interleave(v60).hist_levels
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
v60 = v60.add_blank_audio
return v60.prefetch
#adjustframerate

v61 = LSMASHVideoSource(dst_dir + "v61f.mp4").ConvertToYV24()
b_ex = undefined
#return v61.histogram.prefetch
v61o = v61
v61 = v61.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v61.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v61i = v61
v61 = expr(v61.extractY, v61.extractU, v61.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v61 = v61.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v61a = v61i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v61 = v61.colorYUV(off_u = -6, off_v = +0)
#return v61o.interleave(v61).hist_levels
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
v61 = v61.add_blank_audio
return v61.prefetch
#adjustframerate

v62 = LSMASHVideoSource(dst_dir + "v62f.mp4").ConvertToYV24()
b_ex = undefined
#return v62.histogram.prefetch
v62o = v62
v62 = v62.AdjustColor(ou = +10, ov = -2, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v62.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v62i = v62
v62 = expr(v62.extractY, v62.extractU, v62.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v62 = v62.autolevels(filterRadius=0, minRng=0, border_l = 400, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v62a = v62i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v62 = v62.colorYUV(off_u = -10, off_v = +0)
#return v62o.interleave(v62).hist_levels
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
v62 = v62.add_blank_audio
return v62.prefetch
#adjustframerate

v63 = LSMASHVideoSource(dst_dir + "v63f.mp4").ConvertToYV24()
b_ex = undefined
#return v63.histogram.prefetch
v63o = v63
v63 = v63.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v63.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v63i = v63
v63 = expr(v63.extractY, v63.extractU, v63.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v63 = v63.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v63a = v63i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v63o.interleave(v63).hist_levels
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
v63 = v63.add_blank_audio
return v63.prefetch
#adjustframerate

v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
v64 = v64.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 400
#v64 = v64.trim(188, -1).loop(v64.frameCount).crop(0, v64.height - add_height, 0, 0).stackVertical(v64)
#return v64.histogram.prefetch
v64o = v64
v64 = v64.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v64.hist_levels.prefetch
#v64 = v64.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v64 = expr(v64.extractY, v64.extractU, v64.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v64i = v64
v64 = expr(v64.extractY, v64.extractU, v64.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v64 = v64.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v64a = v64i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v64 = v64.crop(0, add_height, 0, 0)
#v64a = v64a.crop(0, add_height, 0, 0)
#v64 = v64.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v64 = v64.colorYUV(off_u = -10, off_v = +0)
#return v64o.interleave(v64).hist_levels
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate

#******
*/