SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

v0 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\11214 Bakhtin 02 S8.720p.mov")
v0 = v0.assumefps(18)
#return v0

v1 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\1 cast.Res2K43.Aspect43In43.Speed18Fps.mov")
v1 = v1.assumefps(18)
v2 = LSMASHVideoSource("E:\media\video\Super8\Sources\1977-1979\2 cast.Res2K43.Aspect43In43.Speed18Fps.mov")
v2 = v2.assumefps(18)
v1 = v1.trim(0, v1.frameCount - 2) + v2.trim(108, 0)

last = v1
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 69,   139,   174,  213,  237,  300,  320,  366,  387,  425,  455,  476,  616,  669,  969,  984, 1227, 1335, 1377, 1464, #20 
#skip (2478, 2482)
# 1678, 1790, 1936, 2011, 2090, 2133, 2157, 2223, 2276, 2295, 2312, 2368, 2430, 2478, 2483, 2540, 2607, 2635, 2703, 2748, #40
#skip (3387, 3398)
# 2777, 2846, 2861, 2938, 2952, 2964, 3025, 3109, 3163, 3200, 3240, 3272, 3296, 3313, 3322, 3349, 3387, 3399, 3543, 3561, #60
# 3570, 3853, 3870, 3878, 3889, 4215, 4227, 4240, 4245, 4364, 4379, 4401, 4525, 4604, 4714, 4774, 4807, 4838, 4873, 4889, #80

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
v33 = full.trim(2368, 2429)
v33 = v33.crop(left + 30, top + 0, right + 30, bot + 0)
v33 = v33.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v33.trim(3, 0)
#return v33.hist_levels

v34 = full.trim(2430, 2477)
v34 = v34.crop(left + 30, top + 0, right + 30, bot + 0)
v34 = v34.trim(0, 1).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false) +\
      v34.trim(2, 0)
#return v34.hist_levels

v35 = full.trim(2483, 2539)
v35 = v35.crop(left + 30, top + 0, right + 30, bot + 0)
v35 = v35.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v35.trim(3, 0)
#return v35.hist_levels

v36 = full.trim(2540, 2606)
v36 = v36.crop(left + 30, top + 0, right + 30, bot + 0)
v36 = v36.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v36.trim(3, 0)
#return v36.hist_levels

v37 = full.trim(2607, 2634)
v37 = v37.crop(left + 30, top + 0, right + 30, bot + 0)
v37 = v37.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v37.trim(3, 0)
#return v37.hist_levels

v38 = full.trim(2635, 2702)
v38 = v38.crop(left + 30, top + 0, right + 30, bot + 0)
v38 = v38.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v38.trim(3, 0)
#return v38.hist_levels

v39 = full.trim(2703, 2747)
v39 = v39.crop(left + 30, top + 0, right + 30, bot + 0)
v39 = v39.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v39.trim(3, 0)
#return v39.hist_levels

v40 = full.trim(2748, 2776)
v40 = v40.crop(left + 30, top + 0, right + 30, bot + 0)
v40 = v40.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v40.trim(3, 0)
#return v40.hist_levels

v41 = full.trim(2777, 2845)
v41 = v41.crop(left + 30, top + 0, right + 30, bot + 0)
v41 = v41.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v41.trim(3, 0)
#return v41.hist_levels

v42 = full.trim(2846, 2860)
v42 = v42.crop(left + 30, top + 0, right + 30, bot + 0)
v42 = v42.trim(0, 1) +\
      v42.trim(2, -1).colorYUV(off_y = 8) +\
      v42.trim(3, -1).colorYUV(off_y = 10) +\
      v42.trim(4, -1).colorYUV(off_y = 12) +\
      v42.trim(5, -1).colorYUV(off_y = 20) +\
      v42.trim(6, 13).colorYUV(off_y = 16) +\
      v42.trim(14, 0)
v42 = v42.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v42.trim(3, 0)
#return v42.hist_levels

v43 = full.trim(2861, 2937)
v43 = v43.crop(left + 30, top + 0, right + 30, bot + 0)
v43 = v43.trim(0, 3) +\
      v43.trim(4, -1).colorYUV(off_y = 16) +\
      v43.trim(5, -1).colorYUV(off_y = 10, gain_y = 100) +\
      v43.trim(6, -1).colorYUV(off_y = 16) +\
      v43.trim(7, 12) +\
      v43.trim(13, -1).colorYUV(off_y = 8) +\
      v43.trim(14, 0)
v43 = v43.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v43.trim(3, 0)
#return v43.hist_levels

v44 = full.trim(2938, 2951)
v44 = v44.crop(left + 30, top + 0, right + 30, bot + 0)
v44 = v44.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v44.trim(3, 0)
#return v44.hist_levels

v45 = full.trim(2952, 2963)
v45 = v45.crop(left + 30, top + 0, right + 30, bot + 0)
v45 = v45.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v45.trim(3, 0).colorYUV(off_y = 8)
#return v45.hist_levels

v46 = full.trim(2964, 3024)
v46 = v46.crop(left + 30, top + 0, right + 30, bot + 0)
v46 = v46.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v46.trim(3, 0)
#return v46.hist_levels

v47 = full.trim(3025, 3108)
v47 = v47.crop(left + 30, top + 0, right + 30, bot + 0)
v47 = v47.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v47.trim(3, 0)
#return v47.hist_levels

v48 = full.trim(3109, 3162)
v48 = v48.crop(left + 30, top + 0, right + 30, bot + 0)
v48 = v48.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v48.trim(3, 0)
#return v48.hist_levels

v49 = full.trim(3163, 3199)
#v49 = v49.crop(left + 30, top + 0, right + 30, bot + 0)
v49 = v49.animate(0, 24, "crop", left + 50, top + 0, right + 50, bot + 0, left + 30, top + 0, right + 30, bot + 0)
#v49 = v49.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v49.trim(3, 0)
v49 = v49.deScratchBlock(x = 1110, w = 70)
#return v49.hist_levels

v50 = full.trim(3200, 3239)
v50 = v50.crop(left + 30, top + 0, right + 30, bot + 0)
v50 = v50.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v50.trim(4, 0)
v50 = v50.deScratchBlock
#return v50.hist_levels

v51 = full.trim(3240, 3271)
v51 = v51.crop(left + 30, top + 0, right + 30, bot + 0)
v51 = v51.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v51.trim(4, 0)
v51 = v51.deScratchBlock
#return v51.hist_levels

v52 = full.trim(3272, 3295)
v52 = v52.crop(left + 30, top + 0, right + 30, bot + 0)
v52 = v52.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v52.trim(3, 0)
v52 = v52.deScratchBlock
#return v52.hist_levels

v53 = full.trim(3296, 3312)
v53 = v53.crop(left + 30, top + 0, right + 30, bot + 0)
v53 = v53.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v53.trim(4, 0)
v53 = v53.deScratchBlock
#return v53.hist_levels

v54 = full.trim(3313, 3321)
v54 = v54.crop(left + 30, top + 0, right + 30, bot + 0)
v54 = v54.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v54.trim(4, 0)
v54 = v54.deScratchBlock
#return v54.hist_levels

v55 = full.trim(3322, 3348)
v55 = v55.crop(left + 30, top + 0, right + 30, bot + 0)
v55 = v55.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v55.trim(4, -1) +\
      v55.trim(5, 9).deflickOverlappedInc(step = 100, toward_darkest = true, right2left = false) +\
      v55.trim(10, 17) +\
      v55.trim(18, 20).deflickOverlappedInc(step = 100, toward_darkest = true, right2left = false) +\
      v55.trim(21, 0)
v55 = v55.deScratchBlock
#return v55.hist_levels

v56 = full.trim(3349, 3386)
v56 = v56.crop(left + 30, top + 0, right + 30, bot + 0)
v56 = v56.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v56.trim(4, 0)
v56 = v56.deScratchBlock#.interleave(v56.deScratchBlock(blurlen = 6))
#return v56.hist_levels

v57 = full.trim(3400, 3542)
v57 = v57.crop(left + 30, top + 0, right + 30, bot + 0)
v57 = v57.trim(1, 12).deFlickOverlappedBck(step = 200, toward_darkest = true, right2left = false) +\
      v57.trim(13, 135) +\
      v57.trim(136, 140).deflickOverlappedInc(step = 100, toward_darkest = true, right2left = false) +\
      v57.trim(141, 0)
v57 = v57.deScratchBlock#.interleave(v57.deScratchBlock(blurlen = 6))
#return v57.hist_levels

v58 = full.trim(3543, 3560)
v58 = v58.crop(left + 30, top + 0, right + 30, bot + 0)
v58 = v58.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v58.trim(4, 0)
v58 = v58.deScratchBlock
#return v58.hist_levels

v59 = full.trim(3562, 3569)
v59 = v59.crop(left + 30, top + 0, right + 30, bot + 0)
v59 = v59.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v59.trim(4, 0)
v59 = v59.deScratchBlock
#return v59.hist_levels

v60 = full.trim(3570, 3851)
v60 = v60.crop(left + 30, top + 0, right + 30, bot + 0)
v60 = v60.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v60.trim(4, 51) +\
      v60.trim(52, 57).deflickOverlappedInc(step = 100, toward_darkest = true, right2left = false) +\
      v60.trim(58, 152) +\
      v60.trim(153, -1).colorYUV(off_y = -44) +\
      v60.trim(154, -1).colorYUV(off_y = -16) +\
      v60.trim(155, 158) +\
      v60.trim(159, 164).deflickOverlappedInc(step = 50, width = 200, toward_darkest = true, right2left = false) +\
      v60.trim(165, 0)
v60 = v60.deScratchBlock
#return v60.hist_levels

v61 = full.trim(3853, 3869)
v61 = v61.crop(left + 30, top + 0, right + 30, bot + 0)
v61 = v61.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v61.trim(4, 0)
v61 = v61.deScratchBlock
#return v61.hist_levels

v62 = full.trim(3870, 3877)
v62 = v62.crop(left + 30, top + 0, right + 30, bot + 0)
v62 = v62.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
      v62.trim(4, v62.frameCount - 3) +\
      v62.trim(v62.frameCount - 2, -1).colorYUV(off_y = -16) +\
      v62.trim(v62.frameCount - 1, 0).colorYUV(off_y = -30)
v62 = v62.deScratchBlock
#return v62.hist_levels

v63 = full.trim(3878, 3888)
v63 = v63.crop(left + 30, top + 0, right + 30, bot + 0)
v63 = v63.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
     v63.trim(4, 0)
v63 = v63.deScratchBlock
#return v63.hist_levels

# 3570, 3853, 3870, 3878, 3889, 4215, 4227, 4240, 4245, 4364, 4379, 4401, 4525, 4604, 4714, 4774, 4807, 4838, 4873, 4889, #80
v64 = full.trim(3889, 4214)
v64 = v64.crop(left + 60, top + 0, right + 60, bot + 0)
v64 = v64.deflickOverlapped(step = 100, radius = 3, toward_darkest = true, right2left = false).trim(0, 3) +\
     v64.trim(4, 0)
v64 = v64.deScratchBlock(x = 1080)
#return v64.hist_levels
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 33

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
b_ex = undefined
v33o = v33
v33 = v33.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v33i = v33
v33 = expr(v33.extractY, v33.extractU, v33.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v33 = v33.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v33a = v33i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v33i.interleave(v33).hist_levels.prefetch
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate

v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
b_ex = undefined
v34o = v34
v34 = v34.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v34i = v34
v34 = expr(v34.extractY, v34.extractU, v34.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v34 = v34.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v34a = v34i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v34i.interleave(v34).hist_levels.prefetch
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate

v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
b_ex = undefined
v35o = v35
v35 = v35.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v35i = v35
v35 = expr(v35.extractY, v35.extractU, v35.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v35 = v35.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v35a = v35i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v35i.interleave(v35).hist_levels.prefetch
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate

v36 = LSMASHVideoSource(dst_dir + "v36f.mp4").ConvertToYV24()
b_ex = undefined
v36o = v36
v36 = v36.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v36i = v36
v36 = expr(v36.extractY, v36.extractU, v36.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v36 = v36.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v36a = v36i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v36i.interleave(v36).hist_levels.prefetch
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
v36 = v36.add_blank_audio
return v36.prefetch
#adjustframerate

v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
b_ex = undefined
v37o = v37
v37 = v37.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v37i = v37
v37 = expr(v37.extractY, v37.extractU, v37.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v37 = v37.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v37a = v37i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v37i.interleave(v37).hist_levels.prefetch
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate

v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
b_ex = undefined
v38o = v38
v38 = v38.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v38i = v38
v38 = expr(v38.extractY, v38.extractU, v38.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v38 = v38.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v38a = v38i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v38i.interleave(v38).hist_levels.prefetch
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate

v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
b_ex = undefined
v39o = v39
v39 = v39.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v39i = v39
v39 = expr(v39.extractY, v39.extractU, v39.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v39 = v39.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v39a = v39i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v39i.interleave(v39).hist_levels.prefetch
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate

v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
b_ex = undefined
v40o = v40
v40 = v40.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v40i = v40
v40 = expr(v40.extractY, v40.extractU, v40.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v40 = v40.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v40a = v40i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v40i.interleave(v40).hist_levels.prefetch
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate

v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
b_ex = undefined
v41o = v41
v41 = v41.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v41i = v41
v41 = expr(v41.extractY, v41.extractU, v41.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v41 = v41.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v41a = v41i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v41i.interleave(v41).hist_levels.prefetch
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate

v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
b_ex = undefined
v42o = v42
v42 = v42.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v42i = v42
v42 = expr(v42.extractY, v42.extractU, v42.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v42 = v42.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v42a = v42i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v42i.interleave(v42).hist_levels.prefetch
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate

v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
b_ex = undefined
v43o = v43
v43 = v43.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v43i = v43
v43 = expr(v43.extractY, v43.extractU, v43.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v43 = v43.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v43a = v43i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v43i.interleave(v43).hist_levels.prefetch
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate

v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
b_ex = undefined
v44o = v44
v44 = v44.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v44i = v44
v44 = expr(v44.extractY, v44.extractU, v44.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v44 = v44.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v44a = v44i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v44i.interleave(v44).hist_levels.prefetch
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate

v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
b_ex = undefined
v45o = v45
v45 = v45.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v45i = v45
v45 = expr(v45.extractY, v45.extractU, v45.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v45 = v45.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v45a = v45i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v45i.interleave(v45).hist_levels.prefetch
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate

v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
b_ex = undefined
v46o = v46
v46 = v46.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v46i = v46
v46 = expr(v46.extractY, v46.extractU, v46.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v46 = v46.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v46a = v46i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v46i.interleave(v46).hist_levels.prefetch
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate

v47 = LSMASHVideoSource(dst_dir + "v47f.mp4").ConvertToYV24()
b_ex = undefined
v47o = v47
v47 = v47.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v47i = v47
v47 = expr(v47.extractY, v47.extractU, v47.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v47 = v47.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v47a = v47i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v47i.interleave(v47).hist_levels.prefetch
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
v47 = v47.add_blank_audio
return v47.prefetch
#adjustframerate

v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
b_ex = undefined
v48o = v48
v48 = v48.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v48i = v48
v48 = expr(v48.extractY, v48.extractU, v48.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v48 = v48.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v48a = v48i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v48i.interleave(v48).hist_levels.prefetch
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate

v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
b_ex = undefined
v49o = v49
v49 = v49.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v49i = v49
v49 = expr(v49.extractY, v49.extractU, v49.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v49 = v49.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v49a = v49i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v49i.interleave(v49).hist_levels.prefetch
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate

v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
b_ex = undefined
v50o = v50
v50 = v50.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v50i = v50
v50 = expr(v50.extractY, v50.extractU, v50.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v50 = v50.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v50a = v50i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v50i.interleave(v50).hist_levels.prefetch
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate

v51 = LSMASHVideoSource(dst_dir + "v51f.mp4").ConvertToYV24()
b_ex = undefined
v51o = v51
v51 = v51.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v51i = v51
v51 = expr(v51.extractY, v51.extractU, v51.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v51 = v51.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v51a = v51i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v51i.interleave(v51).hist_levels.prefetch
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
v51 = v51.add_blank_audio
return v51.prefetch
#adjustframerate

v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
b_ex = undefined
v52o = v52
v52 = v52.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v52i = v52
v52 = expr(v52.extractY, v52.extractU, v52.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v52 = v52.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v52a = v52i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v52i.interleave(v52).hist_levels.prefetch
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate

v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
b_ex = undefined
v53o = v53
v53 = v53.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v53i = v53
v53 = expr(v53.extractY, v53.extractU, v53.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v53 = v53.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v53a = v53i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v53i.interleave(v53).hist_levels.prefetch
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate

v54 = LSMASHVideoSource(dst_dir + "v54f.mp4").ConvertToYV24()
b_ex = undefined
v54o = v54
v54 = v54.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v54i = v54
v54 = expr(v54.extractY, v54.extractU, v54.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v54 = v54.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v54a = v54i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v54i.interleave(v54).hist_levels.prefetch
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
v54 = v54.add_blank_audio
return v54.prefetch
#adjustframerate

v55 = LSMASHVideoSource(dst_dir + "v55f.mp4").ConvertToYV24()
b_ex = undefined
v55o = v55
v55 = v55.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v55i = v55
v55 = expr(v55.extractY, v55.extractU, v55.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v55 = v55.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v55a = v55i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v55i.interleave(v55).hist_levels.prefetch
v55 = v55.adjustSize
v55 = v55.assumeFPS(18)
v55 = v55.add_blank_audio
return v55.prefetch
#adjustframerate

v56 = LSMASHVideoSource(dst_dir + "v56f.mp4").ConvertToYV24()
b_ex = undefined
v56o = v56
v56 = v56.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v56i = v56
v56 = expr(v56.extractY, v56.extractU, v56.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v56 = v56.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v56a = v56i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v56i.interleave(v56).hist_levels.prefetch
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
v56 = v56.add_blank_audio
return v56.prefetch
#adjustframerate

v57 = LSMASHVideoSource(dst_dir + "v57f.mp4").ConvertToYV24()
b_ex = undefined
v57o = v57
v57 = v57.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v57i = v57
v57 = expr(v57.extractY, v57.extractU, v57.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v57 = v57.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v57a = v57i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v57i.interleave(v57).hist_levels.prefetch
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
v57 = v57.add_blank_audio
return v57.prefetch
#adjustframerate

v58 = LSMASHVideoSource(dst_dir + "v58f.mp4").ConvertToYV24()
b_ex = undefined
v58o = v58
v58 = v58.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v58i = v58
v58 = expr(v58.extractY, v58.extractU, v58.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v58 = v58.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v58a = v58i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v58i.interleave(v58).hist_levels.prefetch
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
v58 = v58.add_blank_audio
return v58.prefetch
#adjustframerate

v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
b_ex = undefined
v59o = v59
v59 = v59.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v59i = v59
v59 = expr(v59.extractY, v59.extractU, v59.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v59 = v59.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v59a = v59i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v59i.interleave(v59).hist_levels.prefetch
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
v59 = v59.add_blank_audio
return v59.prefetch
#adjustframerate

v60 = LSMASHVideoSource(dst_dir + "v60f.mp4").ConvertToYV24()
b_ex = undefined
v60o = v60
v60 = v60.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v60i = v60
v60 = expr(v60.extractY, v60.extractU, v60.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v60 = v60.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v60a = v60i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v60i.interleave(v60).hist_levels.prefetch
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
v60 = v60.add_blank_audio
return v60.prefetch
#adjustframerate

v61 = LSMASHVideoSource(dst_dir + "v61f.mp4").ConvertToYV24()
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v61o = v61
v61 = v61.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v61i = v61
v61 = expr(v61.extractY, v61.extractU, v61.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v61 = v61.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v61a = v61i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v61i.interleave(v61).hist_levels.prefetch
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
v61 = v61.add_blank_audio
return v61.prefetch
#adjustframerate

v62 = LSMASHVideoSource(dst_dir + "v62f.mp4").ConvertToYV24()
b_ex = undefined
v62o = v62
v62 = v62.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v62i = v62
v62 = expr(v62.extractY, v62.extractU, v62.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v62 = v62.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v62a = v62i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v62i.interleave(v62).hist_levels.prefetch
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
v62 = v62.add_blank_audio
return v62.prefetch
#adjustframerate

v63 = LSMASHVideoSource(dst_dir + "v63f.mp4").ConvertToYV24()
b_ex = undefined
v63o = v63
v63 = v63.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v63i = v63
v63 = expr(v63.extractY, v63.extractU, v63.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v63 = v63.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v63a = v63i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v63i.interleave(v63).hist_levels.prefetch
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
v63 = v63.add_blank_audio
return v63.prefetch
#adjustframerate

v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
#v64 = v64.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_width = 200
#v64 = v64.trim(105, -1).loop(v64.frameCount).crop(0, 0, -(v64.width - add_width), 0).stackHorizontal(v64)
#return v64.histogram.prefetch
v64o = v64
v64 = v64.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
#v64 = v64.AdjustColor(ou = -4, ov = -0, x=500, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#return v64.hist_levels.prefetch
#v64 = v64.expr("x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "x", "x")
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v64 = expr(v64.extractY, v64.extractU, v64.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v64i = v64
v64 = expr(v64.extractY, v64.extractU, v64.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v64 = v64.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v64a = v64i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v64 = v64.crop(add_width, 0, 0, 0)
#v64i = v64i.crop(add_width, 0, 0, 0)
#v64a = v64a.crop(add_width, 0, 0, 0)
#v64 = v64.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#v64 = v64.colorYUV(off_u = +2, off_v = -0)
#v64 = v64i
#return v64i.interleave(v64).hist_levels.prefetch
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate

#******
*/