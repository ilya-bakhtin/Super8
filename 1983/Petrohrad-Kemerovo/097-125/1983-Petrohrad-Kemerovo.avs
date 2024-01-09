SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

LSMASHVideoSource("F:\Media\video\Super8\Sources\1983\S8.Res2K43.Aspect43In43.Speed18Fps.mov")
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 353, 542, 615, 755, 1066, 1134, 1188, 1445, 1634, 1732, 1807, 1894, 1984, 2010, 2078, 2255, 2338, 2436, 2554, 2653,        # 20
# 2796, 2937, 3162, 3193, 3646, 3707, 3944, 4043, 4210, 4352, 4466, 4546, 4624, 4727, 4791, 4865, 4940, 5013, 5168, 5273,       # 40
# skip (3162, 3192)
# 5479, 5621, 5862, 5970, 6158, 6178, 6462, 6501, 6671, 6918, 7015, 7140, 7225, 7397, 7585, 7655, 7856, 8003, 8076, 8168,       # 60
# skip (6158, 6178)
# 8348, 8392, 8540, 8658, 8794, 8947, 9114, 9118, 9424, 9517, 9617, 9793, 9898, 10025, 10169, 10310, 10439, 10484, 10675, 10924,# 80
# skip (9114, 9118)
# 11089, 11424, 11532, 11626, 11830, 11882, 11891, 12040, 12411, 12625, 12652, 12678, 12881, 12968, 13131, 13168, 13352, 13518, # 98
# skip (11882, 11891)
# 13624, 13644, 13792, 13850, 13920, 13951, 14200, 14393, 14430, 14494, 14672, 14760, 14864, 15019, 15156, 15344, 15441, 15559, # 116
# 15667, 15732, 15811, 15935, 16112, 16129, 16232, 16425, 16487, 16640, 17184, 17561, 17833                                     # 129

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
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
left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
*/
/*
left = lo
top = to
right = ro
bot = bo

v97 = full.trim(13644, 13791)
v97 = v97.crop(left - 20, top + 10, right - 20, bot + 10)
v97 = v97.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v97.trim(3, 0)
v97 = v97.deflickOverlapped(width = 400, step = 200, radius = 8, toward_darkest = true, right2left = true)
v97 = v97.correct_left_side(width = 200).correct_left_side(width = 100)
#return v97.adjustBorders.prefetch

v98 = full.trim(13792, 13849)
v98 = v98.crop(left - 20, top + 10, right - 20, bot + 10)
v98 = v98.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v98.trim(3, 0)
#return v98.adjustBorders.prefetch

v99 = full.trim(13850, 13919)
v99 = v99.crop(left - 20, top + 10, right - 20, bot + 10)
v99 = v99.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v99.trim(3, 0)
#return v99.adjustBorders.prefetch

v100 = full.trim(13920, 13950)
v100 = v100.crop(left - 20, top + 10, right - 20, bot + 10)
v100 = v100.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v100.trim(3, 0)
#return v100.adjustBorders.prefetch

v101 = full.trim(13951, 14199)
v101 = v101.crop(left - 20, top + 10, right - 20, bot + 10)
v101 = v101.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v101.trim(3, 0)
#return v101.adjustBorders.prefetch

v102 = full.trim(14200, 14392)
v102 = v102.crop(left - 20, top + 10, right - 20, bot + 10)
v102 = v102.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v102.trim(3, 0)
#return v102.adjustBorders.prefetch

v103 = full.trim(14393, 14429)
v103 = v103.crop(left - 20, top + 10, right - 20, bot + 10)
v103 = v103.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v103.trim(3, 0)
#return v103.adjustBorders.prefetch

v104 = full.trim(14430, 14493)
v104 = v104.crop(left - 10, top + 10, right - 10, bot + 10)
v104 = v104.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v104.trim(3, 0)
#return v104.adjustBorders.prefetch

v105 = full.trim(14494, 14671)
v105 = v105.animate(28, 33, "crop", left - 0, top + 10, right - 20, bot - 4, left - 20, top + 10, right - 40, bot - 4).trim(0, 33) +\
       v105.animate(33, 37, "crop", left - 20, top + 10, right - 40, bot - 4, left - 0, top + 10, right - 20, bot - 4).trim(34, 51) +\
       v105.animate(52, 55, "crop", left - 0, top + 10, right - 20, bot - 4, left - 20, top + 10, right - 40, bot - 4).trim(52, 55) +\
       v105.animate(55, 59, "crop", left - 20, top + 10, right - 40, bot - 4, left - 0, top + 10, right - 20, bot - 4).trim(56, 0)
v105 = v105.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v105.trim(3, 0)
#return v105.adjustBorders.prefetch

v106 = full.trim(14672, 14759)
v106 = v106.crop(left - 10, top + 10, right - 10, bot + 10)
v106 = v106.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v106.trim(3, 0)
#return v106.adjustBorders.prefetch

v107 = full.trim(14760, 14863)
v107 = v107.animate(69, 74, "crop", left - 0, top + 10, right - 0, bot + 10, left + 20, top + 10, right + 20, bot + 10).trim(0, 74) +\
       v107.animate(74, 90, "crop", left + 20, top + 10, right + 20, bot + 10, left - 20, top + 10, right - 20, bot + 10).trim(75, 0)
v107 = v107.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v107.trim(3, 0)
#return v107.adjustBorders.prefetch

v108 = full.trim(14864, 15018)
v108 = v108.crop(left - 0, top + 10, right - 0, bot + 10)
v108 = v108.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v108.trim(3, 0)
v108 = v108.deflickOverlapped(width = 400, step = 200, radius = 12, toward_darkest = true, right2left = true)
v108 = v108.correct_left_side(width = 200).correct_left_side(width = 100)
#return v108.adjustBorders.prefetch

v109 = full.trim(15019, 15155)
v109 = v109.crop(left - 0, top + 10, right - 0, bot + 10)
v109 = v109.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v109.trim(3, 0)
v109df = v109.deflickOverlapped(width = 400, step = 200, radius = 12, toward_darkest = true, right2left = true)
v109df = v109df.correct_left_side(width = 200).correct_left_side(width = 100)
v109 = v109df.trim(0, 61) + v109.trim(62, 0)
#return v109.adjustBorders.prefetch

v110 = full.trim(15156, 15343)
v110 = v110.crop(left - 0, top + 10, right - 0, bot + 10)
v110 = v110.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v110.trim(3, 0)
v110 = v110.deflickOverlapped(width = 400, step = 200, radius = 12, toward_darkest = true, right2left = true)
v110 = v110.correct_left_side(width = 200).correct_left_side(width = 100)
#return v110.adjustBorders.prefetch

v111 = full.trim(15344, 15440)
v111 = v111.crop(left - 0, top + 10, right - 0, bot + 10)
v111 = v111.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v111.trim(3, 0)
v111 = v111.deflickOverlapped(width = 400, step = 200, radius = 13, toward_darkest = true, right2left = true)
v111 = v111.correct_left_side(width = 200).correct_left_side(width = 100)
#return v111.adjustBorders.prefetch

v112 = full.trim(15441, 15558)
v112 = v112.crop(left + 10, top + 10, right + 10, bot + 10)
v112 = v112.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v112.trim(3, 0)
v112df = v112.deflickOverlapped(width = 600, step = 200, radius = 13, toward_darkest = true, right2left = true)
v112df = v112df.correct_left_side(width = 200).correct_left_side(width = 100)
v112 = v112df.trim(0, 79) + v112.trim(80, 0)# + v112df.trim(99, 111) + v112.trim(112, 0)
#return v112.adjustBorders.prefetch

v113 = full.trim(15559, 15665)
v113 = v113.animate(80, 87, "crop", left - 10, top + 10, right - 10, bot + 10, left + 40, top + 10, right + 40, bot + 10)
v113 = v113.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v113.trim(3, 0)
v113 = v113.deflickOverlapped(width = 11600, step = 200, radius = 13, toward_darkest = true, right2left = true)
v113 = v113.correct_left_side(width = 200).correct_left_side(width = 100)
#return v113.adjustBorders.prefetch

v114 = full.trim(15667, 15731)
v114 = v114.animate(0, 8, "crop", left + 80, top + 10, right + 80, bot + 10, left + 20, top + 10, right + 20, bot + 10)
v114 = v114.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v114.trim(3, 0)
v114 = v114.correct_left_side(width = 800).correct_left_side(width = 100)
#return v114.adjustBorders.prefetch

v115 = full.trim(15732, 15810)
v115 = v115.animate(0, 22, "crop", left + 30, top + 10, right + 0, bot - 12, left + 0, top + 10, right - 30, bot - 12).trim (0, 22) +\
       v115.animate(23, 29, "crop", left + 0, top + 10, right - 30, bot - 12, left + 40, top + 10, right + 10, bot - 12).trim (23, 0)
v115 = v115.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v115.trim(3, 0)
v115 = v115.correct_left_side(width = 800).correct_left_side(width = 100)
#return v115.adjustBorders.prefetch

v116 = full.trim(15811, 15934)
v116 = v116.animate(27, 31, "crop", left + 40, top + 10, right + 10, bot - 12, left + 10, top + 10, right - 20, bot - 12).trim(0, 31) +\
       v116.animate(32, 48, "crop", left + 10, top + 10, right - 20, bot - 12, left + 40, top + 10, right + 10, bot - 12).trim(32, 86) +\
       v116.animate(87, 89, "crop", left + 40, top + 10, right + 10, bot - 12, left + 10, top + 10, right - 20, bot - 12).trim(87, 0)
v116 = v116.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v116.trim(3, 0)
v116 = v116.correct_left_side(width = 800).correct_left_side(width = 100)
#return v116.adjustBorders.prefetch

v117 = full.trim(15935, 16111)
v117 = v117.crop(left + 0, top + 0, right - 30, bot - 22)
v117 = v117.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v117.trim(3, 0)
v117df = v117.correct_left_side(width = 400).correct_left_side(width = 100)
v117 = v117df.trim(0, 72) + v117.trim(73, 79) + v117df.trim(80, 0)
#return v117.adjustBorders.prefetch

v118 = full.trim(16112, 16128)
v118 = v118.crop(left - 10, top + 10, right - 10, bot + 10)
v118 = v118.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v118.trim(3, 0)
#return v118.adjustBorders.prefetch

v119 = full.trim(16129, 16231)
v119 = v119.crop(left - 10, top + 10, right - 10, bot + 10)
v119 = v119.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v119.trim(3, 0)
v119 = v119.correct_left_side(width = 400).correct_left_side(width = 100)
#return v119.adjustBorders.prefetch

v120 = full.trim(16232, 16424)
v120 = v120.crop(left - 10, top + 10, right - 10, bot + 10)
v120 = v120.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v120.trim(3, 0)
v120 = v120.correct_left_side(width = 400).correct_left_side(width = 100)
#return v120.adjustBorders.prefetch

v121 = full.trim(16425, 16486)
v121 = v121.crop(left - 10, top + 10, right - 10, bot + 10)
v121 = v121.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v121.trim(3, 0)
#return v121.adjustBorders.prefetch

v122 = full.trim(16487, 16631)
v122 = v122.animate(29, 38, "crop", left - 10, top + 10, right - 10, bot + 10, left + 40, top + 10, right + 40, bot + 10).trim(0, 38) +\
       v122.animate(48, 65, "crop", left + 40, top + 10, right + 40, bot + 10, left - 0, top + 10, right - 0, bot + 10).trim(39, 0)
v122 = v122.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v122.trim(3, 0)
v122 = v122.deflickOverlapped(width = 600, step = 200, radius = 3, toward_darkest = true, right2left = true)
v122 = v122.correct_left_side(width = 400).correct_left_side(width = 100)
#return v122.adjustBorders.prefetch

v123 = full.trim(16640, 17183)
v123 = v123.animate(261, 269, "crop", left - 0, top + 0, right - 0, bot + 0, left + 50, top + 0, right + 50, bot + 0).trim(0, 269) +\
       v123.animate(330, 371, "crop", left + 50, top + 0, right + 50, bot + 0, left - 0, top + 0, right - 0, bot + 0).trim(270, 0)
v123 = v123.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v123.trim(3, 0)
#return v123.adjustBorders.prefetch

v124 = full.trim(17185, 17560)
v124 = v124.crop(left - 0, top + 0, right - 0, bot + 0)
v124 = v124.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v124.trim(3, 0)
#return v124.adjustBorders.prefetch

v125 = full.trim(17561, 17833)
#v125 = v125.crop(left + 30, top + 0, right + 30, bot + 0)
v125 = v125.animate(30, 51, "crop", left + 30, top + 0, right + 30, bot + 0, left - 30, top + 0, right - 30, bot + 0).trim(0, 51) +\
       v125.animate(52, 90, "crop", left - 30, top + 0, right - 30, bot + 0, left + 20, top + 0, right + 20, bot + 0).trim(52, 0)
#30, 51, 90
v125 = v125.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v125.trim(3, 0)
#v125 = v125.deflickOverlapped(width = 600, step = 200, radius = 3, toward_darkest = true, right2left = true)
v125 = v125.correct_left_side(width = 400).correct_left_side(width = 100)
#v125_angle = 2.
#v125 = v125.rotate(-v96_angle)
#return v125.adjustBorders.prefetch
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 97

v97 = LSMASHVideoSource(dst_dir + "v97f.mp4").ConvertToYV24()
b_ex = undefined
v97 = v97.AdjustColor(ou = +8, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v97 = v97.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.9)
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
v97 = v97.add_blank_audio
return v97.prefetch
#adjustframerate

v98 = LSMASHVideoSource(dst_dir + "v98f.mp4").ConvertToYV24()
b_ex = undefined
v98 = v98.AdjustColor(ou = +8, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
v98 = v98.add_blank_audio
return v98.prefetch
#adjustframerate

v99 = LSMASHVideoSource(dst_dir + "v99f.mp4").ConvertToYV24()
b_ex = undefined
v99 = v99.AdjustColor(ou = +8, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
v99 = v99.add_blank_audio
return v99.prefetch
#adjustframerate

v100 = LSMASHVideoSource(dst_dir + "v100f.mp4").ConvertToYV24()
v100 = v100.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v100 = v100.AdjustColor(ou = +8, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
v100 = v100.add_blank_audio
return v100.prefetch
#adjustframerate

v101 = LSMASHVideoSource(dst_dir + "v101f.mp4").ConvertToYV24()
b_ex = undefined
v101 = v101.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
v101 = v101.add_blank_audio
return v101.prefetch
#adjustframerate

v102 = LSMASHVideoSource(dst_dir + "v102f.mp4").ConvertToYV24()
b_ex = undefined
v102 = v102.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v102 = v102.adjustSize
v102 = v102.assumeFPS(18)
v102 = v102.add_blank_audio
return v102.prefetch
#adjustframerate

v103 = LSMASHVideoSource(dst_dir + "v103f.mp4").ConvertToYV24()
b_ex = undefined
v103 = v103.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v103 = v103.adjustSize
v103 = v103.assumeFPS(18)
v103 = v103.add_blank_audio
return v103.prefetch
#adjustframerate

v104 = LSMASHVideoSource(dst_dir + "v104f.mp4").ConvertToYV24()
b_ex = undefined
v104 = v104.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v104 = v104.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.7)
v104 = v104.adjustSize
v104 = v104.assumeFPS(18)
v104 = v104.add_blank_audio
return v104.prefetch
#adjustframerate

v105 = LSMASHVideoSource(dst_dir + "v105f.mp4").ConvertToYV24()
b_ex = undefined
v105 = v105.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v105 = v105.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.7)
v105 = v105.adjustSize
v105 = v105.assumeFPS(18)
v105 = v105.add_blank_audio
return v105.prefetch
#adjustframerate

v106 = LSMASHVideoSource(dst_dir + "v106f.mp4").ConvertToYV24()
v106 = v106.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v106 = v106.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v106 = v106.adjustSize
v106 = v106.assumeFPS(18)
v106 = v106.add_blank_audio
return v106.prefetch
#adjustframerate

v107 = LSMASHVideoSource(dst_dir + "v107f.mp4").ConvertToYV24()
b_ex = undefined
v107 = v107.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v107 = v107.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
v107 = v107.add_blank_audio
return v107.prefetch
#adjustframerate

v108 = LSMASHVideoSource(dst_dir + "v108f.mp4").ConvertToYV24()
v108 = v108.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v108 = v108.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v108 = v108.adjustSize
v108 = v108.assumeFPS(18)
v108 = v108.add_blank_audio
return v108.prefetch
#adjustframerate

v109 = LSMASHVideoSource(dst_dir + "v109f.mp4").ConvertToYV24()
b_ex = undefined
v109 = v109.AdjustColor(ou = +4, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v109 = v109.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
v109 = v109.add_blank_audio
return v109.prefetch
#adjustframerate

v110 = LSMASHVideoSource(dst_dir + "v110f.mp4").ConvertToYV24()
b_ex = undefined
v110 = v110.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v110 = v110.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)
v110 = v110.adjustSize
v110 = v110.assumeFPS(18)
v110 = v110.add_blank_audio
return v110.prefetch
#adjustframerate

v111 = LSMASHVideoSource(dst_dir + "v111f.mp4").ConvertToYV24()
b_ex = undefined
v111 = v111.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v111 = v111.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
v111 = v111.add_blank_audio
return v111.prefetch
#adjustframerate

v112 = LSMASHVideoSource(dst_dir + "v112f.mp4").ConvertToYV24()
b_ex = undefined
v112 = v112.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v112 = v112.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)
v112 = v112.adjustSize
v112 = v112.assumeFPS(18)
v112 = v112.add_blank_audio
return v112.prefetch
#adjustframerate

v113 = LSMASHVideoSource(dst_dir + "v113f.mp4").ConvertToYV24()
b_ex = undefined
v113 = v113.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v113 = v113.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)
v113 = v113.adjustSize
v113 = v113.assumeFPS(18)
v113 = v113.add_blank_audio
return v113.prefetch
#adjustframerate

v114 = LSMASHVideoSource(dst_dir + "v114f.mp4").ConvertToYV24()
b_ex = undefined
v114 = v114.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v114 = v114.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v114 = v114.adjustSize
v114 = v114.assumeFPS(18)
v114 = v114.add_blank_audio
return v114.prefetch
#adjustframerate

v115 = LSMASHVideoSource(dst_dir + "v115f.mp4").ConvertToYV24()
b_ex = undefined
v115 = v115.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v115 = v115.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v115 = v115.adjustSize
v115 = v115.assumeFPS(18)
v115 = v115.add_blank_audio
return v115.prefetch
#adjustframerate

v116 = LSMASHVideoSource(dst_dir + "v116f.mp4").ConvertToYV24()
b_ex = undefined
v116 = v116.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v116 = v116.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v116 = v116.adjustSize
v116 = v116.assumeFPS(18)
v116 = v116.add_blank_audio
return v116.prefetch
#adjustframerate

v117 = LSMASHVideoSource(dst_dir + "v117f.mp4").ConvertToYV24()
b_ex = undefined
v117 = v117.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v117 = v117.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v117 = v117.adjustSize
v117 = v117.assumeFPS(18)
v117 = v117.add_blank_audio
return v117.prefetch
#adjustframerate

v118 = LSMASHVideoSource(dst_dir + "v118f.mp4").ConvertToYV24()
b_ex = undefined
v118 = v118.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v118 = v118.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v118 = v118.adjustSize
v118 = v118.assumeFPS(18)
v118 = v118.add_blank_audio
return v118.prefetch
#adjustframerate

v119 = LSMASHVideoSource(dst_dir + "v119f.mp4").ConvertToYV24()
b_ex = undefined
v119 = v119.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v119 = v119.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v119 = v119.adjustSize
v119 = v119.assumeFPS(18)
v119 = v119.add_blank_audio
return v119.prefetch
#adjustframerate

v120 = LSMASHVideoSource(dst_dir + "v120f.mp4").ConvertToYV24()
b_ex = undefined
v120 = v120.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v120 = v120.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v120 = v120.adjustSize
v120 = v120.assumeFPS(18)
v120 = v120.add_blank_audio
return v120.prefetch
#adjustframerate

v121 = LSMASHVideoSource(dst_dir + "v121f.mp4").ConvertToYV24()
b_ex = undefined
v121 = v121.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v121 = v121.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v121 = v121.adjustSize
v121 = v121.assumeFPS(18)
v121 = v121.add_blank_audio
return v121.prefetch
#adjustframerate

v122 = LSMASHVideoSource(dst_dir + "v122f.mp4").ConvertToYV24()
b_ex = undefined
v122 = v122.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v122 = v122.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v122 = v122.adjustSize
v122 = v122.assumeFPS(18)
v122 = v122.add_blank_audio
return v122.prefetch
#adjustframerate

v123 = LSMASHVideoSource(dst_dir + "v123f.mp4").ConvertToYV24()
b_ex = undefined
v123 = v123.AdjustColor(ou = +12, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v123 = v123.colorYUV(off_u = -4, off_v = +4)
v123 = v123.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v123 = v123.adjustSize
v123 = v123.assumeFPS(18)
v123 = v123.add_blank_audio
return v123.prefetch
#adjustframerate

v124 = LSMASHVideoSource(dst_dir + "v124f.mp4").ConvertToYV24()
b_ex = undefined
v124 = v124.AdjustColor(ou = +12, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v124 = v124.colorYUV(off_u = -4, off_v = +4)
v124 = v124.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v124 = v124.adjustSize
v124 = v124.assumeFPS(18)
v124 = v124.add_blank_audio
return v124.prefetch
#adjustframerate

v125 = LSMASHVideoSource(dst_dir + "v125f.mp4").ConvertToYV24()
#v125 = v125.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v125 = v125.AdjustColor(ou = +12, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                        bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v125 = v125.colorYUV(off_u = -4, off_v = +4)
v125 = v125.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
#return v125.hist_levels.prefetch
v125 = v125.adjustSize
v125 = v125.assumeFPS(18)
v125 = v125.add_blank_audio
return v125.prefetch
#adjustframerate

#******

*/