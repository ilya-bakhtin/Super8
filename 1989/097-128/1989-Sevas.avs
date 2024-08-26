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
# skip (19425, 19439) (23432, 23436)
# 22004, 22317, 22518, 22761, 23304, 23432, 23436, 23606, 23709, 24024, 24206, 24498, 24564, 24569,
#                                           24570, 24771, 24888, 25224, 25421, 25732, 25889, 25947, 26222, 26356, 26662, 26924, # 112
# 27185, 27323, 27561, 27839, 28385, 28800                                                                                      # 118

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
top = top + 10
right = right - 46
bot = bot - 28

v97 = full.trim(23304, 23431)
v97 = v97.crop(left + 30, top - 0, right + 30, bot - 0)
v97 = v97.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v97.trim(3, 0)
v97 = v97.correct_left_side(width = 400).correct_left_side(width = 200)
v97_angle = 0.
#v97 = v97.rotate(-v97_angle)
#return v97.adjustBorders.hist_levels.prefetch
va = BlankClip(v97, audio_rate = 48000, channels = 2).killVideo
v97 = v97#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v98 = full.trim(24570, 24770)
v98 = v98.crop(left + 30, top + 20, right + 30, bot + 20)
v98 = v98.trim(0, 25).deflickOverlapped(step = 100, radius = 25, toward_darkest = true, right2left = false) +\
      v98.trim(26, 0)
v98 = v98.correct_left_side(width = 200).correct_left_side(width = 100).trim(0, 60) +\
      v98.trim(61, 0)
v98_angle = 0.
#v98 = v98.rotate(-v98_angle)
#return v98.adjustBorders.hist_levels.prefetch
va = BlankClip(v98, audio_rate = 48000, channels = 2).killVideo
v98 = v98#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v99 = full.trim(24771, 24887)
v99 = v99.crop(left + 30, top + 20, right + 30, bot + 20)
v99 = v99.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v99.trim(3, 0)
v99_angle = 0.
va = BlankClip(v99, audio_rate = 48000, channels = 2).killVideo
v99 = v99#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v100 = full.trim(24888, 25223)
v100 = v100.crop(left + 30, top + 20, right + 30, bot + 20)
v100 = v100.autolevels(filterRadius = 0, input_low = 32, input_high = 255, output_low = 0, output_high = 255, autolevel = false).trim(0, -1) +\
       v100.trim(1, 0)
v100 = v100.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v100.trim(3, 0)
v100_angle = 0.
va = BlankClip(v100, audio_rate = 48000, channels = 2).killVideo
v100 = v100#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

v101 = full.trim(25224, 25420)
v101 = v101.crop(left + 30, top + 20, right + 30, bot + 20)
v101 = v101.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v101.trim(3, 0)
v101_angle = 0.
va = BlankClip(v101, audio_rate = 48000, channels = 2).killVideo
v101 = v101#.audioDub(va)

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v102 = full.trim(25421, 25731)
v102 = v102.crop(left + 30, top + 30, right + 30, bot + 30)
v102 = v102.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v102.trim(3, 0)
#v102 = v102.correct_left_side(width = 200).correct_left_side(width = 100).trim(0, 60) +\
#       v102.trim(61, 0)
#v102_angle = 0.
#v102 = v102.rotate(-v102_angle)
#return v102.adjustBorders.hist_levels.prefetch
va = BlankClip(v102, audio_rate = 48000, channels = 2).killVideo
v102 = v102#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v103 = full.trim(25732, 25888)
v103 = v103.crop(left + 30, top + 20, right + 30, bot + 20)
v103 = v103.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v103.trim(3, 0)
va = BlankClip(v103, audio_rate = 48000, channels = 2).killVideo
v103 = v103#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

v104 = full.trim(25889, 25946)
v104 = v104.crop(left + 30, top + 10, right + 30, bot + 10)
v104 = v104.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v104.trim(3, 0)
v104_angle = -1.
v104 = v104.rotate(-v104_angle)
v104 = v104.crop(6, 16, -46, -22)
va = BlankClip(v104, audio_rate = 48000, channels = 2).killVideo
v104 = v104#.audioDub(va)

v105 = full.trim(25947, 26221)
v105 = v105.crop(left + 30, top + 10, right + 30, bot + 10)
v105 = v105.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v105.trim(3, 0)
v105_angle = -1.
v105 = v105.rotate(-v105_angle)
va = BlankClip(v105, audio_rate = 48000, channels = 2).killVideo
v105 = v105#.audioDub(va)

v106 = full.trim(26222, 26355)
v106 = v106.crop(left + 30, top + 10, right + 30, bot + 10)
v106 = v106.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v106.trim(3, 0)
v106_angle = -1.
v106 = v106.rotate(-v106_angle)
v106 = v106.crop(6, 16, -46, -22)
va = BlankClip(v106, audio_rate = 48000, channels = 2).killVideo
v106 = v106#.audioDub(va)

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v107 = full.trim(26356, 26661)
v107 = v107.crop(left + 30, top + 40, right + 30, bot + 40)
v107 = v107.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v107.trim(3, 0)
v107 = v107.trim(0, 285) +\
       v107.trim(286, 295).deFlickOverlappedInc(step = 100, toward_darkest = true, right2left = false) +\
       v107.trim(296, 0)
v107 = v107.trim(0, 218) +\
       v107.correct_left_side(width = 400).correct_left_side(width = 200).trim(219, 0)
va = BlankClip(v107, audio_rate = 48000, channels = 2).killVideo
v107 = v107#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

v108 = full.trim(26662, 26923)
v108 = v108.crop(left + 30, top + 10, right + 30, bot + 10)
v108_angle = -1.
v108 = v108.rotate(-v108_angle)
v108 = v108.crop(6, 16, -46, -22)
va = BlankClip(v108, audio_rate = 48000, channels = 2).killVideo
v108 = v108#.audioDub(va)

v109 = full.trim(26924, 27184)
v109 = v109.crop(left + 30, top + 10, right + 30, bot + 10)
v109 = v109.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v109.trim(3, 0)
v109_angle = -1.
v109 = v109.rotate(-v109_angle)
v109 = v109.crop(6, 16, -46, -22)
va = BlankClip(v109, audio_rate = 48000, channels = 2).killVideo
v109 = v109#.audioDub(va)

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v110 = full.trim(27185, 27322)
v110 = v110.crop(left + 30, top + 20, right + 30, bot + 20)
v110 = v110.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v110.trim(3, 0)
va = BlankClip(v110, audio_rate = 48000, channels = 2).killVideo
v110 = v110#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v111 = full.trim(27323, 27560)
v111 = v111.crop(left + 30, top + 20, right + 30, bot + 20)
v111 = v111.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v111.trim(3, 0)
va = BlankClip(v111, audio_rate = 48000, channels = 2).killVideo
v111 = v111#.audioDub(va)

left = lo
top = to
right = ro
bot = bo

v112 = full.trim(27561, 27838)
v112 = v112.crop(left + 30, top + 0, right + 30, bot + 0)
v112 = v112.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v112.trim(3, 0)
v112_angle = -1.
v112 = v112.rotate(-v112_angle)
v112 = v112.crop(6, 22, -46, -16)
#return v112.adjustBorders.hist_levels.prefetch
va = BlankClip(v112, audio_rate = 48000, channels = 2).killVideo
v112 = v112#.audioDub(va)

left = left + 6
top = top + 10
right = right - 46
bot = bot - 28

v113 = full.trim(27839, 28384)
v113 = v113.crop(left + 30, top + 10, right + 30, bot + 10)
v113 = v113.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v113.trim(3, 0)
va = BlankClip(v113, audio_rate = 48000, channels = 2).killVideo
v113 = v113#.audioDub(va)

left = lo
top = to
right = ro
bot = bo
*/
v114 = full.trim(28386, 28799)
v114_293 = v114.trim(293, -1).crop(0, 450, 0, 0).\
    stackVertical(v114.trim(293, -1).crop(20, 120, 0, 570 - v114.height).addBorders(0, 0, 20, 0).colorYUV(off_Y = -14))
v114 = v114.trim(0, 292) + v114_293 + v114.trim(294, 0)
v114 = v114.crop(left + 30, top + 10, right + 30, bot + 10).trim(0, 277) +\
       v114.animate(278, 288, "crop", left + 30, top + 10, right + 30, bot + 10, left + 70, top + 20, right + 70, bot + 20).trim(278, 288) +\
       v114.animate(288, 291, "crop", left + 70, top + 20, right + 70, bot + 20, left + 30, top + 40, right + 30, bot + 40).trim(289, 292) +\
       v114.crop(left - 10, top + 40, right - 10, bot + 40).trim(293, -1) +\
       v114.crop(left - 10, top + 30, right - 10, bot + 30).trim(294, -1) +\
       v114.crop(left - 10, top - 50, right - 10, bot - 50).trim(295, -1) +\
       v114.crop(left - 10, top + 90, right - 10, bot + 90).trim(296, -1) +\
       v114.animate(296, 307, "crop", left - 10, top - 30, right - 10, bot - 30, left + 60, top + 20, right + 60, bot + 20).trim(297, 0)
v114 = v114.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v114.trim(3, 0)
#v114 = v114.trim(0, 218) +\
#       v114.correct_left_side(width = 400).correct_left_side(width = 200).trim(219, 0)
v114_angle = -1.
v114 = v114.rotate(-v114_angle)
v114 = v114.crop(6, 22, -46, -16)
#return v114.adjustBorders.hist_levels.prefetch
va = BlankClip(v114, audio_rate = 48000, channels = 2).killVideo
v114 = v114#.audioDub(va)

#global filter16 = true

import("..\common.avs")

/*

#******

# 97

v97 = LSMASHVideoSource(dst_dir + "v97f.mp4").ConvertToYV24()
v97_i = v97
b_ex = undefined
v97 = v97.AdjustColor(ou = +10, ov = -7, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v97 = v97.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
v97 = v97.add_blank_audio
return v97.prefetch
#adjustframerate

v98 = LSMASHVideoSource(dst_dir + "v98f.mp4").ConvertToYV24()
b_ex = undefined
v98 = v98.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v98 = v98.colorYUV(off_u = +2, off_v = -2)
v98 = v98.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
v98 = v98.add_blank_audio
return v98.prefetch
#adjustframerate

v99 = LSMASHVideoSource(dst_dir + "v99f.mp4").ConvertToYV24()
b_ex = undefined
v99 = v99.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-600, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v99 = v99.colorYUV(off_u = +2, off_v = -2)
v99 = v99.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
v99 = v99.add_blank_audio
return v99.prefetch
#adjustframerate

v100 = LSMASHVideoSource(dst_dir + "v100f.mp4").ConvertToYV24()
v100_i = v100
#v100 = v100.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
add_height = 300
v100 = v100.trim(1, -1).loop(v100.frameCount).crop(0, 0, 0, add_height - v100.height).stackVertical(v100)
#return v100.histogram.prefetch
v100 = v100.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v100 = v100.colorYUV(off_u = +2, off_v = -2)
v100 = v100.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3)
#v100 = v100.animate(200, 220, "gamma_a", 0.3, 0.6)
v100 = v100.crop(0, add_height, 0, 0)
#return v100.hist_levels.prefetch
#v100 = v100.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
###
v100_0 = v100
v100 = v100_i
add_height = 100
v100 = v100.stackVertical(v100.trim(332, -1).loop(v100.frameCount).crop(0, v100.height - add_height, 0, 0))
v100 = v100.AdjustColor(ou = +12, ov = -6, x=v100.width*1/2, y=v100.height*1/2, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v100 = v100.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3, border_l=v100.width*1/2, border_t=v100.height*1/2)
v100 = v100.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v100.frameCount, width = v100.width, height = v100.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v100 = v100_0.mt_merge(v100, mask, luma = true)
#return v100_0.interleave(v100).prefetch
###
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
v100 = v100.add_blank_audio
return v100.prefetch
#adjustframerate

v101 = LSMASHVideoSource(dst_dir + "v101f.mp4").ConvertToYV24()
b_ex = undefined
v101 = v101.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v101 = v101.colorYUV(off_u = -2, off_v = +2)
v101 = v101.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.9)
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
v101 = v101.add_blank_audio
return v101.prefetch
#adjustframerate

v102 = LSMASHVideoSource(dst_dir + "v102f.mp4").ConvertToYV24()
b_ex = undefined
v102 = v102.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v102 = v102.colorYUV(off_u = -2, off_v = +2)
v102 = v102.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.9)
v102 = v102.adjustSize
v102 = v102.assumeFPS(18)
v102 = v102.add_blank_audio
return v102.prefetch
#adjustframerate

v103 = LSMASHVideoSource(dst_dir + "v103f.mp4").ConvertToYV24()
b_ex = undefined
v103 = v103.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v103 = v103.colorYUV(off_u = -2, off_v = +2)
v103 = v103.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v103 = v103.adjustSize
v103 = v103.assumeFPS(18)
v103 = v103.add_blank_audio
return v103.prefetch
#adjustframerate

v104 = LSMASHVideoSource(dst_dir + "v104f.mp4").ConvertToYV24()
b_ex = undefined
v104 = v104.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v104 = v104.adjustSize
v104 = v104.assumeFPS(18)
v104 = v104.add_blank_audio
return v104.prefetch
#adjustframerate

v105 = LSMASHVideoSource(dst_dir + "v105f.mp4").ConvertToYV24()
b_ex = undefined
v105 = v105.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v105 = v105.adjustSize
v105 = v105.assumeFPS(18)
v105 = v105.add_blank_audio
return v105.prefetch
#adjustframerate

v106 = LSMASHVideoSource(dst_dir + "v106f.mp4").ConvertToYV24()
b_ex = undefined
v106 = v106.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.0, gam_mac=true, b_expr=b_ex)
v106 = v106.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v106 = v106.adjustSize
v106 = v106.assumeFPS(18)
v106 = v106.add_blank_audio
return v106.prefetch
#adjustframerate

v107 = LSMASHVideoSource(dst_dir + "v107f.mp4").ConvertToYV24()
v107 = v107.trim(0, v107.frameCount - 2)
b_ex = undefined
v107 = v107.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex
v107 = v107.colorYUV(off_u = +2, off_v = -2)
v107 = v107.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
v107 = v107.add_blank_audio
return v107.prefetch
#adjustframerate

v108 = LSMASHVideoSource(dst_dir + "v108f.mp4").ConvertToYV24()
b_ex = undefined
v108 = v108.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v108 = v108.colorYUV(off_u = +2, off_v = -2)
v108 = v108.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
v108 = v108.adjustSize
v108 = v108.assumeFPS(18)
v108 = v108.add_blank_audio
return v108.prefetch
#adjustframerate

v109 = LSMASHVideoSource(dst_dir + "v109f.mp4").ConvertToYV24()
b_ex = undefined
v109 = v109.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
v109 = v109.add_blank_audio
return v109.prefetch
#adjustframerate

v110 = LSMASHVideoSource(dst_dir + "v110f.mp4").ConvertToYV24()
b_ex = undefined
v110 = v110.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v110 = v110.adjustSize
v110 = v110.assumeFPS(18)
v110 = v110.add_blank_audio
return v110.prefetch
#adjustframerate

v111 = LSMASHVideoSource(dst_dir + "v111f.mp4").ConvertToYV24()
b_ex = undefined
v111 = v111.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v111 = v111.colorYUV(off_u = -2, off_v = +2)
v111 = v111.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.7)
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
v111 = v111.add_blank_audio
return v111.prefetch
#adjustframerate

v112 = LSMASHVideoSource(dst_dir + "v112f.mp4").ConvertToYV24()
b_ex = undefined
v112 = v112.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v112 = v112.colorYUV(off_u = -2, off_v = +2)
v112 = v112.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.8)
v112 = v112.adjustSize
v112 = v112.assumeFPS(18)
v112 = v112.add_blank_audio
return v112.prefetch
#adjustframerate

v113 = LSMASHVideoSource(dst_dir + "v113f.mp4").ConvertToYV24()
b_ex = undefined
v113 = v113.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v113 = v113.colorYUV(off_u = -2, off_v = +2)
v113 = v113.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.8)
v113 = v113.adjustSize
v113 = v113.assumeFPS(18)
v113 = v113.add_blank_audio
return v113.prefetch
#adjustframerate

v114 = LSMASHVideoSource(dst_dir + "v114f.mp4").ConvertToYV24()
v114_i = v114
#v114 = v114.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 300
#v114 = v114.trim(1, -1).loop(v114.frameCount).crop(0, 0, 0, add_height - v114.height).stackVertical(v114)
#return v114.histogram.prefetch
v114 = v114.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v114 = v114.colorYUV(off_u = -2, off_v = +2)
v114 = v114.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.8)
#v114 = v114.animate(200, 220, "gamma_a", 0.3, 0.6)
#v114 = v114.crop(0, add_height, 0, 0)
#return v114.hist_levels.prefetch
#v114 = v114.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
v114 = v114.adjustSize
v114 = v114.assumeFPS(18)
v114 = v114.add_blank_audio
return v114.prefetch
#adjustframerate

#******
*/