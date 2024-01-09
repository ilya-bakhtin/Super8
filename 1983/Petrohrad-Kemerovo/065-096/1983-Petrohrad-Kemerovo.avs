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
# 15667,

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
*/
/*
v65 = full.trim(8947, 9113)
v65 = v65.crop(left + 10, top + 10, right + 10, bot + 10)
v65 = v65.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v65.trim(3, 0)
v65 = v65.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true)
v65 = v65.correct_left_side(width = 200).correct_left_side(width = 100)
#return v65.adjustBorders.prefetch

v66 = full.trim(9118, 9423)
v66 = v66.crop(left + 10, top + 10, right + 10, bot + 10)
v66 = v66.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v66.trim(3, 0)
v66 = v66.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true)
v66 = v66.correct_left_side(width = 200).correct_left_side(width = 100)
v66_angle = 1.
v66 = v66.rotate(-v66_angle)
#return v66.adjustBorders.prefetch

v67 = full.trim(9424, 9516)
v67 = v67.crop(left + 10, top + 10, right + 10, bot + 10)
v67 = v67.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v67.trim(3, 0)
v67 = v67.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true)
v67 = v67.correct_left_side(width = 200).correct_left_side(width = 100)
#return v67.adjustBorders.prefetch

v68 = full.trim(9517, 9616)
v68 = v68.crop(left + 10, top + 10, right + 10, bot + 10)
v68 = v68.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v68.trim(3, 0)
v68 = v68.deflickOverlapped(width = 800, step = 200, radius = 7, toward_darkest = true, right2left = true)
v68 = v68.correct_left_side(width = 200).correct_left_side(width = 100)
#return v68.adjustBorders.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v69 = full.trim(9617, 9792)
v69 = v69.crop(left + 0, top + 0, right + 0, bot + 0)
v69 = v69.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v69.trim(3, 0)
v69 = v69.deflickOverlapped(width = 800, step = 200, radius = 7, toward_darkest = true, right2left = true)
v69 = v69.correct_left_side(width = 200).correct_left_side(width = 100)
v69_angle = 2.
v69 = v69.rotate(-v69_angle)
#return v69.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v70 = full.trim(9793, 9897)
v70 = v70.crop(left + 10, top + 10, right + 10, bot + 10)
v70_width = 800
v70 = v70.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v70.trim(3, 0)
v70 = v70.trim(0, 42).deflickOverlapped(width = v70_width, step = 200, radius = 7, toward_darkest = true, right2left = true) +\
      v70.trim(43, 45) +\
      v70.trim(46, 78).deflickOverlapped(width = v70_width, step = 200, radius = 7, toward_darkest = true, right2left = true) +\
      v70.trim(79, 81) +\
      v70.trim(82, 0).deflickOverlapped(width = v70_width, step = 200, radius = 7, toward_darkest = true, right2left = true)
v70 = v70.correct_left_side(width = 200).correct_left_side(width = 100)
v70_angle = 1.
v70 = v70.rotate(-v70_angle)
#return v70.adjustBorders.prefetch

v71 = full.trim(9898, 10024)
v71 = v71.crop(left + 10, top + 10, right + 10, bot + 10)
v71 = v71.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v71.trim(3, 0)
v71 = v71.deflickOverlapped(width = 400, step = 200, radius = 7, toward_darkest = true, right2left = true)
v71 = v71.correct_left_side(width = 200).correct_left_side(width = 100)
#return v71.adjustBorders.prefetch

v72 = full.trim(10025, 10168)
v72 = v72.crop(left + 10, top + 10, right + 10, bot + 10)
v72 = v72.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v72.trim(3, 0)
v72 = v72.deflickOverlapped(width = 400, step = 200, radius = 8, toward_darkest = true, right2left = true)
v72 = v72.correct_left_side(width = 200).correct_left_side(width = 100)
v72_angle = 3.
v72 = v72.rotate(-v72_angle)
#return v72.adjustBorders.prefetch

v73 = full.trim(10169, 10309)
v73 = v73.crop(left + 10, top + 10, right + 10, bot + 10)
v73 = v73.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v73.trim(3, 0)
v73 = v73.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = true)
v73 = v73.correct_left_side(width = 200).correct_left_side(width = 100)
#return v73.adjustBorders.prefetch

v74 = full.trim(10310, 10438)
v74 = v74.crop(left + 10, top + 10, right + 10, bot + 10)
v74 = v74.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v74.trim(3, 0)
v74 = v74.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = true)
v74 = v74.correct_left_side(width = 200).correct_left_side(width = 100)
#return v74.adjustBorders.prefetch

v75 = full.trim(10439, 10483)
v75 = v75.crop(left + 10, top + 10, right + 10, bot + 10)
v75 = v75.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v75.trim(3, 0)
v75 = v75.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = true)
v75 = v75.correct_left_side(width = 200).correct_left_side(width = 100)
#return v75.adjustBorders.prefetch

v76 = full.trim(10484, 10672)
v76 = v76.crop(left - 20, top + 10, right - 20, bot + 10)
v76 = v76.correct_left_side(width = 200).correct_left_side(width = 100)
v76_angle = 4.
v76 = v76.rotate(-v76_angle)
#return v76.adjustBorders.prefetch

v77 = full.trim(10675, 10923)
v77 = v77.crop(left + 0, top + 10, right + 0, bot + 10)
v77 = v77.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v77.trim(3, 0)
v77_angle = 5.
v77 = v77.rotate(-v77_angle)
#return v77.adjustBorders.prefetch

v78 = full.trim(10924, 11088)
v78 = v78.crop(left + 0, top + 10, right + 0, bot + 10)
v78 = v78.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v78.trim(3, 0)
v78_angle = 5.
v78 = v78.rotate(-v78_angle)
#return v78.adjustBorders.prefetch

v79 = full.trim(11089, 11423)
v79 = v79.crop(left + 0, top + 10, right + 0, bot + 10)
v79 = v79.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v79.trim(3, 0)
v79_angle = 4.
v79 = v79.rotate(-v79_angle)
#return v79.adjustBorders.prefetch

v80 = full.trim(11424, 11531)
v80 = v80.crop(left + 0, top + 10, right + 0, bot + 10)
v80 = v80.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v80.trim(3, 0)
v80_angle = 5.
v80 = v80.rotate(-v80_angle)
#return v80.adjustBorders.prefetch

v81 = full.trim(11532, 11625)
v81 = v81.crop(left + 0, top + 10, right + 0, bot + 10)
v81 = v81.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v81.trim(3, 0)
v81_angle = 4.
v81 = v81.rotate(-v81_angle)
#return v81.adjustBorders.prefetch

v82 = full.trim(11626, 11829)
v82 = v82.crop(left - 10, top + 10, right - 10, bot + 10)
v82 = v82.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v82.trim(3, 0)
v82_angle = 5.
v82 = v82.rotate(-v82_angle)
#return v82.adjustBorders.prefetch

v83 = full.trim(11830, 11881)
v83 = v83.crop(left - 10, top + 10, right - 10, bot + 10)
v83 = v83.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v83.trim(3, 0)
v83_angle = 5.
v83 = v83.rotate(-v83_angle)
#return v83.adjustBorders.prefetch

v84 = full.trim(11891, 12039)
v84 = v84.crop(left + 0, top + 10, right + 0, bot + 10)
v84 = v84.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v84.trim(3, 0)
#return v84.adjustBorders.prefetch

v85 = full.trim(12040, 12410)
v85 = v85.crop(left - 10, top + 10, right - 10, bot + 10)
v85 = v85.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v85.trim(3, 0)
#return v85.adjustBorders.prefetch

v86 = full.trim(12411, 12624) # 214
v86 = v86.crop(left - 10, top + 10, right - 10, bot + 10)
v86 = v86.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v86.trim(3, 0)
v86 = v86.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = true)
v86 = v86.correct_left_side(width = 200).correct_left_side(width = 100)
#return v86.adjustBorders.prefetch

v87 = full.trim(12625, 12651) # 27
v87 = v87.crop(left + 10, top + 10, right + 10, bot + 10)
#return v87.adjustBorders.prefetch

v88 = full.trim(12652, 12677) # 26
v88 = v88.crop(left + 10, top + 10, right + 10, bot + 10)
v88 = v88.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v88.trim(3, 0)
#return v88.adjustBorders.prefetch

v89 = full.trim(12678, 12880) # 203
v89_1 = v89.animate(29, 33, "crop", left + 20, top + 10, right + 20, bot + 10, left + 40, top + 10, right + 40, bot + 10).trim(0, 33)
v89_2 = v89.animate(34, 39, "crop", left + 40, top + 10, right + 40, bot + 10, left + 20, top + 10, right + 20, bot + 10).trim(34, 0)
v89 = v89_1 + v89_2
v89 = v89.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v89.trim(3, 0)
#return v89.adjustBorders.prefetch

v90 = full.trim(12881, 12967)
v90 = v90.crop(left + 20, top + 10, right + 20, bot + 10)
v90 = v90.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v90.trim(3, 0)
#return v90.adjustBorders.prefetch

v91 = full.trim(12968, 13130)
v91 = v91.crop(left + 20, top + 10, right + 20, bot + 10)
v91 = v91.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v91.trim(3, 0)
#return v91.adjustBorders.prefetch

v92 = full.trim(13131, 13167)
v92 = v92.crop(left + 20, top + 10, right + 20, bot + 10)
v92 = v92.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v92.trim(3, 0)
#return v92.adjustBorders.prefetch

v93 = full.trim(13168, 13351)
v93 = v93.crop(left + 20, top + 10, right + 20, bot + 10)
v93 = v93.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v93.trim(3, 0)
v93_angle = 2.
v93 = v93.rotate(-v93_angle)
#return v93.adjustBorders.prefetch

v94 = full.trim(13352, 13517)
v94 = v94.crop(left + 20, top + 10, right + 20, bot + 10)
v94 = v94.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v94.trim(3, 0)
#return v94.adjustBorders.prefetch

v95 = full.trim(13518, 13623)
v95 = v95.animate(100, 105, "crop", left + 20, top + 10, right + 20, bot + 10, left + 104, top + 10, right + 104, bot + 10)
v95 = v95.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v95.trim(3, 0)
v95 = v95.correct_left_side(width = 200).correct_left_side(width = 100)
#return v95.adjustBorders.prefetch
*/
v96 = full.trim(13624, 13643)
#v96 = v96.crop(left + 20, top + 10, right + 20, bot + 10)
v96 = v96.animate(0, 5, "crop", left + 104, top + 10, right + 104, bot + 10, left + 20, top + 10, right + 20, bot + 10).trim(0, 5) +\
      v96.animate(6, 9, "crop", left + 20, top + 10, right + 20, bot + 10, left - 20, top + 10, right - 20, bot + 10).trim(6, 9) +\
      v96.animate(10, 14, "crop", left - 20, top + 10, right - 20, bot + 10, left - 40, top + 10, right - 40, bot + 10).trim(10, 14) +\
      v96.animate(14, 19, "crop", left - 40, top + 10, right - 40, bot + 10, left - 10, top + 10, right - 10, bot + 10).trim(15, 0)
#v96 = v96.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#      v96.trim(3, 0)
v96 = v96.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = true)
v96 = v96.correct_left_side(width = 200).correct_left_side(width = 100)
#v96_angle = 2.
#v96 = v96.rotate(-v96_angle)
#return v96.adjustBorders.prefetch


#global filter16 = true

import("..\common.avs")

/*

#******

# 65

v65 = LSMASHVideoSource(dst_dir + "v65f.mp4").ConvertToYV24()
b_ex = undefined
v65 = v65.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v65 = v65.colorYUV(off_u = +4, off_v = -4)
v65 = v65.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.006, gamma=1.5)
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
v65 = v65.add_blank_audio
return v65.prefetch
#adjustframerate

v66 = LSMASHVideoSource(dst_dir + "v66f.mp4").ConvertToYV24()
v66 = v66.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v66 = v66.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v66 = v66.colorYUV(off_u = +4, off_v = -4)
v66 = v66.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.006, gamma=1.5)
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
v66 = v66.add_blank_audio
return v66.prefetch
#adjustframerate

v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
b_ex = undefined
v67 = v67.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v67 = v67.colorYUV(off_u = +6, off_v = -0)
v67 = v67.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.006, gamma=1.5)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate

v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
b_ex = undefined
v68 = v68.AdjustColor(ou = +10, ov = -10, x=100, y=100, w=-100, h=-100, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v68 = v68.colorYUV(off_u = +4, off_v = +2)
v68 = v68.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.009, gamma=1.7, border_l=100, border_t=100, border_r=100, border_b=100)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate

v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
b_ex = undefined
v69 = v69.AdjustColor(ou = +10, ov = -10, x=100, y=100, w=-100, h=-100, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v69 = v69.colorYUV(off_u = +2, off_v = +2)
v69 = v69.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.009, gamma=1.9, border_l=100, border_t=100, border_r=100, border_b=100)
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate

v70 = LSMASHVideoSource(dst_dir + "v70f.mp4").ConvertToYV24()
b_ex = undefined
v70 = v70.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v70 = v70.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.006, gamma=1.3)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
v70 = v70.add_blank_audio
return v70.prefetch
#adjustframerate

v71 = LSMASHVideoSource(dst_dir + "v71f.mp4").ConvertToYV24()
b_ex = undefined
v71 = v71.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v71 = v71.colorYUV(off_u = +4, off_v = -2)
v71 = v71.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.006, gamma=1.5)
v71 = v71.adjustSize
v71 = v71.assumeFPS(18)
v71 = v71.add_blank_audio
return v71.prefetch
#adjustframerate

v72 = LSMASHVideoSource(dst_dir + "v72f.mp4").ConvertToYV24()
b_ex = undefined
v72 = v72.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v72 = v72.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.006, gamma=1.7)
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
v72 = v72.add_blank_audio
return v72.prefetch
#adjustframerate

v73 = LSMASHVideoSource(dst_dir + "v73f.mp4").ConvertToYV24()
b_ex = undefined
v73 = v73.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v73 = v73.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v73 = v73.adjustSize
v73 = v73.assumeFPS(18)
v73 = v73.add_blank_audio
return v73.prefetch
#adjustframerate

v74 = LSMASHVideoSource(dst_dir + "v74f.mp4").ConvertToYV24()
b_ex = undefined
v74 = v74.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v74 = v74.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.006, gamma=1.3)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
v74 = v74.add_blank_audio
return v74.prefetch
#adjustframerate

v75 = LSMASHVideoSource(dst_dir + "v75f.mp4").ConvertToYV24()
b_ex = undefined
v75 = v75.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v75 = v75.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.006, gamma=1.3)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
v75 = v75.add_blank_audio
return v75.prefetch
#adjustframerate

v76 = LSMASHVideoSource(dst_dir + "v76f.mp4").ConvertToYV24()
v76 = v76.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v76 = v76.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v76 = v76.colorYUV(off_u = +4, off_v = -4)
v76 = v76.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v76 = v76.adjustSize
v76 = v76.assumeFPS(18)
v76 = v76.add_blank_audio
return v76.prefetch
#adjustframerate

v77 = LSMASHVideoSource(dst_dir + "v77f.mp4").ConvertToYV24()
v77 = v77.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v77 = v77.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v77 = v77.colorYUV(off_u = +4, off_v = -4)
v77 = v77.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.006, gamma=1.7)
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
v77 = v77.add_blank_audio
return v77.prefetch
#adjustframerate

v78 = LSMASHVideoSource(dst_dir + "v78f.mp4").ConvertToYV24()
v78 = v78.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v78 = v78.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v78 = v78.colorYUV(off_u = +4, off_v = -4)
v78 = v78.autolevels(filterRadius=0, minRng=0, ignore_low=0.06, ignore_high=0.006, gamma=1.7)
v78 = v78.adjustSize
v78 = v78.assumeFPS(18)
v78 = v78.add_blank_audio
return v78.prefetch
#adjustframerate

v79 = LSMASHVideoSource(dst_dir + "v79f.mp4").ConvertToYV24()
v79 = v79.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v79 = v79.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v79 = v79.colorYUV(off_u = +4, off_v = -4)
v79 = v79.autolevels(filterRadius=0, minRng=0, ignore_low=0.06, ignore_high=0.006, gamma=1.7)
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
v79 = v79.add_blank_audio
return v79.prefetch
#adjustframerate

v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
b_ex = undefined
v80 = v80.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v80 = v80.colorYUV(off_u = +4, off_v = -4)
v80 = v80.autolevels(filterRadius=0, minRng=0, ignore_low=0.06, ignore_high=0.006, gamma=1.7)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate

v81 = LSMASHVideoSource(dst_dir + "v81f.mp4").ConvertToYV24()
v81 = v81.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v81 = v81.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v81 = v81.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.1)
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
v81 = v81.add_blank_audio
return v81.prefetch
#adjustframerate

v82 = LSMASHVideoSource(dst_dir + "v82f.mp4").ConvertToYV24()
b_ex = undefined
v82 = v82.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v82 = v82.colorYUV(off_u = +4, off_v = -4)
v82 = v82.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
v82 = v82.add_blank_audio
return v82.prefetch
#adjustframerate

v83 = LSMASHVideoSource(dst_dir + "v83f.mp4").ConvertToYV24()
b_ex = undefined
v83 = v83.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v83 = v83.colorYUV(off_u = +6, off_v = -4)
v83 = v83.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
v83 = v83.add_blank_audio
return v83.prefetch
#adjustframerate

v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
b_ex = undefined
v84 = v84.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.1, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v84 = v84.colorYUV(off_u = +6, off_v = -4)
v84 = v84.autolevels(filterRadius=0, minRng=0, ignore_low=0.1, ignore_high=0.01, gamma=2.3)
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate

v85 = LSMASHVideoSource(dst_dir + "v85f.mp4").ConvertToYV24()
b_ex = undefined
v85 = v85.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.1, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v85 = v85.colorYUV(off_u = +6, off_v = -4)
v85 = v85.autolevels(filterRadius=0, minRng=0, ignore_low=0.1, ignore_high=0.01, gamma=2.3)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
v85 = v85.add_blank_audio
return v85.prefetch
#adjustframerate

v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
b_ex = undefined
v86 = v86.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.1, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v86 = v86.colorYUV(off_u = +6, off_v = -4)
v86 = v86.autolevels(filterRadius=0, minRng=0, ignore_low=0.1, ignore_high=0.01, gamma=2.3)
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate

v87 = LSMASHVideoSource(dst_dir + "v87f.mp4").ConvertToYV24()
v87 = v87.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v87 = v87.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v87 = v87.colorYUV(off_u = +10, off_v = -16)
v87 = v87.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v87 = v87.adjustSize
v87 = v87.assumeFPS(18)
v87 = v87.add_blank_audio
return v87.prefetch
#adjustframerate

v88 = LSMASHVideoSource(dst_dir + "v88f.mp4").ConvertToYV24()
v88 = v88.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v88 = v88.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v88 = v88.colorYUV(off_u = +8, off_v = -8)
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
v88 = v88.add_blank_audio
return v88.prefetch
#adjustframerate

v89 = LSMASHVideoSource(dst_dir + "v89f.mp4").ConvertToYV24()
v89 = v89.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v89 = v89.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v89 = v89.colorYUV(off_u = +8, off_v = -8)
v89 = v89.adjustSize
v89 = v89.assumeFPS(18)
v89 = v89.add_blank_audio
return v89.prefetch
#adjustframerate

v90 = LSMASHVideoSource(dst_dir + "v90f.mp4").ConvertToYV24()
v90 = v90.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v90 = v90.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v90 = v90.colorYUV(off_u = +8, off_v = -8)
v90 = v90.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.1)
v90 = v90.adjustSize
v90 = v90.assumeFPS(18)
v90 = v90.add_blank_audio
return v90.prefetch
#adjustframerate

v91 = LSMASHVideoSource(dst_dir + "v91f.mp4").ConvertToYV24()
b_ex = undefined
v91 = v91.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v91 = v91.colorYUV(off_u = +4, off_v = -4)
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
v91 = v91.add_blank_audio
return v91.prefetch
#adjustframerate

v92 = LSMASHVideoSource(dst_dir + "v92f.mp4").ConvertToYV24()
b_ex = undefined
v92 = v92.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v92 = v92.colorYUV(off_u = +4, off_v = -4)
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
v92 = v92.add_blank_audio
return v92.prefetch
#adjustframerate

v93 = LSMASHVideoSource(dst_dir + "v93f.mp4").ConvertToYV24()
b_ex = undefined
v93 = v93.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v93 = v93.colorYUV(off_u = +4, off_v = -4)
v93 = v93.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.1)
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
v93 = v93.add_blank_audio
return v93.prefetch
#adjustframerate

v94 = LSMASHVideoSource(dst_dir + "v94f.mp4").ConvertToYV24()
v94 = v94.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v94 = v94.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v94 = v94.colorYUV(off_u = +4, off_v = -4)
v94 = v94.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.1)
v94 = v94.adjustSize
v94 = v94.assumeFPS(18)
v94 = v94.add_blank_audio
return v94.prefetch
#adjustframerate

v95 = LSMASHVideoSource(dst_dir + "v95f.mp4").ConvertToYV24()
b_ex = undefined
v95 = v95.AdjustColor(ou = +6, ov = -6, x=300, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v95 = v95.colorYUV(off_u = +4, off_v = -4)
v95 = v95.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.1)
v95 = v95.adjustSize
v95 = v95.assumeFPS(18)
v95 = v95.add_blank_audio
return v95.prefetch
#adjustframerate

v96 = LSMASHVideoSource(dst_dir + "v96f.mp4").ConvertToYV24()
#v96 = v96.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v96 = v96.AdjustColor(ou = +6, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v96 = v96.colorYUV(off_u = +4, off_v = -4)
v96 = v96.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.1)
#return v96.hist_levels.prefetch
v96 = v96.adjustSize
v96 = v96.assumeFPS(18)
v96 = v96.add_blank_audio
return v96.prefetch
#adjustframerate

#******

*/