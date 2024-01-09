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
v33 = full.trim(4624, 4726)
v33 = v33.crop(left - 10, top + 20, right - 20, bot + 12)
v33 = v33.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v33.trim(3, 0)
v33 = v33.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true)
v33 = v33.correct_left_side(width = 200).correct_left_side(width = 100)
v33_angle = 5.
v33 = v33.rotate(-v33_angle)
#return v33.adjustBorders.prefetch

v34 = full.trim(4727, 4790)
v34 = v34.crop(left - 20, top + 10, right - 20, bot + 10)
v34 = v34.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v34.trim(3, 0)
v34 = v34.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true)
v34 = v34.correct_left_side(width = 200).correct_left_side(width = 100)
v34_angle = 2.
v34 = v34.rotate(-v34_angle)
#return v34.adjustBorders.prefetch

v35 = full.trim(4791, 4864)
v35 = v35.crop(left - 10, top + 20, right - 10, bot + 20)
v35 = v35.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v35.trim(3, 0)
v35 = v35.deflickOverlapped(width = 400, step = 200, radius = 6, toward_darkest = true, right2left = true)
v35 = v35.correct_left_side(width = 200).correct_left_side(width = 100)
v35_angle = 5.
v35 = v35.rotate(-v35_angle)
#return v35.adjustBorders.prefetch

v36 = full.trim(4865, 4939)
v36 = v36.crop(left - 20, top + 10, right - 20, bot + 10)
v36 = v36.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v36.trim(3, 0)
v36 = v36.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true)
v36 = v36.correct_left_side(width = 200).correct_left_side(width = 100)
v36_angle = 4.
v36 = v36.rotate(-v36_angle)
#return v36.adjustBorders.prefetch

v37 = full.trim(4940, 5012)
v37 = v37.crop(left - 20, top + 10, right - 20, bot + 10)
v37 = v37.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v37.trim(3, 0)
v37 = v37.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true)
v37 = v37.correct_left_side(width = 200).correct_left_side(width = 100)
v37_angle = 5.
v37 = v37.rotate(-v37_angle)
#return v37.adjustBorders.prefetch

v38 = full.trim(5013, 5167)
v38 = v38.crop(left - 20, top + 20, right - 20, bot + 20)
v38 = v38.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v38.trim(3, 0)
v38 = v38.deflickOverlapped(width = 10000, step = 200, radius = 7, toward_darkest = true, right2left = true)
v38 = v38.correct_left_side(width = 200).correct_left_side(width = 100)
v38_angle = 2.
v38 = v38.rotate(-v38_angle)
#return v38.adjustBorders.prefetch

v39 = full.trim(5168, 5272)
v39 = v39.crop(left - 20, top + 20, right - 20, bot + 20)
v39 = v39.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v39.trim(3, 0)
v39 = v39.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true)
v39 = v39.correct_left_side(width = 200).correct_left_side(width = 100)
v39_angle = 5.
v39 = v39.rotate(-v39_angle)
#return v39.adjustBorders.prefetch

v40 = full.trim(5274, 5478)
v40 = v40.crop(left - 10, top + 10, right - 10, bot + 10)
v40 = v40.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v40.trim(3, 0)
v40 = v40.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true)
v40 = v40.correct_left_side(width = 200).correct_left_side(width = 100)
v40_angle = 2.
v40 = v40.rotate(-v40_angle)
#return v40.adjustBorders.prefetch

v41 = full.trim(5479, 5620)
v41 = v41.crop(left - 10, top + 10, right - 20, bot + 2)
v41 = v41.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v41.trim(3, 0)
v41_1 = v41.convertToYV12
v41_1 = v41_1.deSpot(pwidth=500, pheight=1500, mthres=190, sign=1, p1=40, p2=10, color=true, show=0)
v41_1 = v41_1.convertToYV24
v41_2 = v41.trim(14, 26) + v41_1.trim(27, -1) + v41.trim(28, 0) 
v41 = v41_1.trim(0, 13) +\
      v41_2.deflickOverlapped(width = 1000, step = 200, radius = 7, toward_darkest = true, right2left = true)
v41 = v41.correct_left_side(width = 200).correct_left_side(width = 100)
v41_angle = 5.
v41 = v41.rotate(-v41_angle)
#return v41.adjustBorders.prefetch

v42 = full.trim(5621, 5861)
v42 = v42.crop(left - 10, top + 10, right - 10, bot + 10)
v42 = v42.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v42.trim(3, 0)
v42 = v42.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = true)
v42 = v42.correct_left_side(width = 200).correct_left_side(width = 100)
v42_angle = 4.
v42 = v42.rotate(-v42_angle)
#return v42.adjustBorders.prefetch

v43 = full.trim(5862, 5969)
v43 = v43.crop(left - 10, top + 10, right - 10, bot + 10)
v43 = v43.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v43.trim(3, 0)
v43 = v43.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = true)
v43 = v43.correct_left_side(width = 200).correct_left_side(width = 100)
v43_angle = 2.
v43 = v43.rotate(-v43_angle)
#return v43.adjustBorders.prefetch

v44 = full.trim(5970, 6157)
v44 = v44.crop(left - 10, top + 20, right - 10, bot + 20)
v44 = v44.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v44.trim(3, 0)
v44 = v44.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = true)
v44 = v44.correct_left_side(width = 200).correct_left_side(width = 100)
v44_angle = 5.
v44 = v44.rotate(-v44_angle)
#return v44.adjustBorders.prefetch

v45 = full.trim(6178, 6461)
v45 = v45.crop(left - 0, top + 10, right - 0, bot + 10)
v45 = v45.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v45.trim(3, 0)
v45 = v45.correct_left_side(width = 200).correct_left_side(width = 100)
v45_angle = 2.
v45 = v45.rotate(-v45_angle)
#return v45.adjustBorders.prefetch

v46 = full.trim(6462, 6500)
v46 = v46.crop(left - 0, top + 10, right - 0, bot + 10)
v46 = v46.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v46.trim(3, 0)
v46 = v46.correct_left_side(width = 200).correct_left_side(width = 100)
v46_angle = 3.
v46 = v46.rotate(-v46_angle)
#return v46.adjustBorders.prefetch

v47 = full.trim(6501, 6670)
v47 = v47.crop(left + 0, top + 10, right + 0, bot + 10)
v47 = v47.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v47.trim(3, 0)
v47 = v47.correct_left_side(width = 200).correct_left_side(width = 100)
#return v47.adjustBorders.prefetch

v48 = full.trim(6671, 6917)
v48 = v48.crop(left + 0, top + 10, right + 0, bot + 10)
v48 = v48.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v48.trim(3, 0)
v48 = v48.correct_left_side(width = 200).correct_left_side(width = 100)
v48_angle = 3.
v48 = v48.rotate(-v48_angle)
#return v48.adjustBorders.prefetch

v49 = full.trim(6918, 7014)
v49 = v49.crop(left + 0, top + 10, right + 0, bot + 10)
v49 = v49.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v49.trim(3, 0)
v49 = v49.correct_left_side(width = 200).correct_left_side(width = 100)
v49_angle = 5.
v49 = v49.rotate(-v49_angle)
#return v49.adjustBorders.prefetch

v50 = full.trim(7015, 7139)
v50 = v50.crop(left + 10, top + 10, right + 0, bot + 2)
v50 = v50.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v50.trim(3, 0)
v50 = v50.deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = true)
v50_angle = 5.
v50 = v50.rotate(-v50_angle)
#return v50.adjustBorders.prefetch

v51 = full.trim(7140, 7224)
v51 = v51.crop(left + 10, top + 10, right + 0, bot + 2)
v51 = v51.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v51.trim(3, 0)
v51 = v51.correct_left_side(width = 200).correct_left_side(width = 100)
v51_angle = 3.
v51 = v51.rotate(-v51_angle)
#return v51.adjustBorders.prefetch

v52 = full.trim(7225, 7396)
v52 = v52.crop(left + 10, top + 0, right + 10, bot + 0)
v52 = v52.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v52.trim(3, 0)
v52 = v52.correct_left_side(width = 200).correct_left_side(width = 100)
v52_angle = 4.
v52 = v52.rotate(-v52_angle)
#return v52.adjustBorders.prefetch

v53 = full.trim(7397, 7584)
v53 = v53.crop(left + 10, top + 10, right + 10, bot + 10)
v53 = v53.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v53.trim(3, 0)
v53 = v53.correct_left_side(width = 200).correct_left_side(width = 100)
#return v53.adjustBorders.prefetch

v54 = full.trim(7585, 7654)
v54 = v54.crop(left + 10, top + 0, right + 10, bot + 0)
v54 = v54.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v54.trim(3, 0)
v54 = v54.correct_left_side(width = 200).correct_left_side(width = 100)
#return v54.adjustBorders.prefetch

v55 = full.trim(7658, 7855)
v55 = v55.crop(left + 0, top + 10, right + 0, bot + 10)
v55 = v55.correct_left_side(width = 200).correct_left_side(width = 100)
v55_angle = 4.
v55 = v55.rotate(-v55_angle)
#return v55.adjustBorders.prefetch

v56 = full.trim(7856, 8002)
v56 = v56.crop(left + 10, top + 0, right + 10, bot + 0)
v56 = v56.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v56.trim(3, 0)
v56 = v56.trim(0, 136) +\
      v56.trim(136, 0).deflickOverlapped(width = 600, step = 200, radius = 8, toward_darkest = true, right2left = true).trim(1, 0)
v56 = v56.correct_left_side(width = 200).correct_left_side(width = 100)
#return v56.adjustBorders.prefetch

v57 = full.trim(8003, 8075)
v57 = v57.crop(left + 10, top + 0, right + 10, bot + 0)
v57 = v57.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v57.trim(3, 0)
v57 = v57.deflickOverlapped(width = 600, step = 200, radius = 11, toward_darkest = true, right2left = true)
v57 = v57.correct_left_side(width = 200).correct_left_side(width = 100)
#return v57.adjustBorders.prefetch

v58 = full.trim(8076, 8167)
v58 = v58.crop(left + 10, top + 0, right + 10, bot + 0)
v58 = v58.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v58.trim(3, 0)
v58 = v58.deflickOverlapped(width = 600, step = 200, radius = 11, toward_darkest = true, right2left = true)
v58 = v58.correct_left_side(width = 200).correct_left_side(width = 100)
#return v58.adjustBorders.prefetch

v59 = full.trim(8168, 8346)
v59 = v59.crop(left + 10, top + 0, right + 10, bot + 0)
v59 = v59.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v59.trim(3, 0)
v59 = v59.deflickOverlapped(width = 600, step = 200, radius = 15, toward_darkest = true, right2left = true)
v59 = v59.correct_left_side(width = 200).correct_left_side(width = 100)
#return v59.adjustBorders.prefetch

v60 = full.trim(8348, 8391)
v60 = v60.crop(left + 30, top + 10, right + 30, bot + 10)
v60 = v60.deflickOverlapped(width = 600, step = 200, radius = 30, toward_darkest = true, right2left = true)
v60 = v60.correct_left_side(width = 200).correct_left_side(width = 100)
#return v60.adjustBorders.prefetch

v61 = full.trim(8392, 8539)
v61 = v61.crop(left + 30, top + 10, right + 30, bot + 10)
v61 = v61.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v61.trim(3, 0)
v61 = v61.deflickOverlapped(width = 600, step = 200, radius = 10, toward_darkest = true, right2left = true).trim(0, 121) +\
      v61.trim(122, 0)
v61 = v61.correct_left_side(width = 200).correct_left_side(width = 100)
#return v61.adjustBorders.prefetch

v62 = full.trim(8540, 8657)
v62 = v62.crop(left + 30, top + 0, right + 30, bot + 0)
v62 = v62.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v62.trim(3, 0)
v62 = v62.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = true)
v62 = v62.correct_left_side(width = 200).correct_left_side(width = 100)
v62_angle = 3.
v62 = v62.rotate(-v62_angle)
#return v62.adjustBorders.prefetch

v63 = full.trim(8658, 8793)
v63 = v63.crop(left + 30, top + 0, right + 30, bot + 0)
v63 = v63.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v63.trim(3, 0)
v63 = v63.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = true)
v63 = v63.correct_left_side(width = 200).correct_left_side(width = 100)
#return v63.adjustBorders.prefetch

v64 = full.trim(8794, 8946)
v64 = v64.crop(left + 20, top + 20, right + 20, bot + 20)
v64 = v64.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v64.trim(3, 0)
v64 = v64.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = true)
v64 = v64.correct_left_side(width = 200).correct_left_side(width = 100)
#v64_angle = 3.
#v64 = v64.rotate(-v64_angle)
#return v64.adjustBorders.prefetch
*/

#global filter16 = true

import("..\common.avs")

/*

#******

# 33

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
b_ex = undefined
v33 = v33.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v33 = v33.colorYUV(off_u = +4, off_v = -4)
v33 = v33.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate

v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
b_ex = undefined
v34 = v34.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v34 = v34.colorYUV(off_u = +4, off_v = -4)
v34 = v34.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate

v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
b_ex = undefined
v35 = v35.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v35 = v35.colorYUV(off_u = +4, off_v = -4)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate

v36 = LSMASHVideoSource(dst_dir + "v36f.mp4").ConvertToYV24()
b_ex = undefined
v36 = v36.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
v36 = v36.add_blank_audio
return v36.prefetch
#adjustframerate

v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
b_ex = undefined
v37 = v37.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate

v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
b_ex = undefined
v38 = v38.AdjustColor(ou = +12, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v38 = v38.colorYUV(off_u = +4, off_v = -4)
v38 = v38.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate

v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
b_ex = undefined
v39 = v39.AdjustColor(ou = +10, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v39 = v39.colorYUV(off_u = +6, off_v = -6)
v39 = v39.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.9)#, autolevel=false, input_low=16, input_high=235)
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate

v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
b_ex = undefined
v40 = v40.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v40 = v40.colorYUV(off_u = +6, off_v = -6)
v40 = v40.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.9)#, autolevel=false, input_low=16, input_high=235)
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate

v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
b_ex = undefined
v41 = v41.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v41 = v41.colorYUV(off_u = +6, off_v = -6)
v41 = v41.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.9)#, autolevel=false, input_low=16, input_high=235)
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate

v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
v42 = v42.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v42 = v42.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v42 = v42.colorYUV(off_u = +6, off_v = -6)
v42 = v42.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate

v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
b_ex = undefined
v43 = v43.AdjustColor(ou = +6, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v43 = v43.colorYUV(off_u = +6, off_v = -6)
v43 = v43.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=2.1)#, autolevel=false, input_low=16, input_high=235)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate

v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
b_ex = undefined
v44 = v44.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v44 = v44.colorYUV(off_u = +6, off_v = -8)
v44 = v44.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate

v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
v45 = v45.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v45 = v45.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v45 = v45.colorYUV(off_u = +3, off_v = -0)
v45 = v45.autolevels(filterRadius=0, minRng=0, ignore_low=0.06, ignore_high=0.01, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate

v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
b_ex = undefined
v46 = v46.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v46 = v46.colorYUV(off_u = -3, off_v = -0)
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate

v47 = LSMASHVideoSource(dst_dir + "v47f.mp4").ConvertToYV24()
v47 = v47.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v47 = v47.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v47 = v47.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.01, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
v47 = v47.add_blank_audio
return v47.prefetch
#adjustframerate

v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
v48 = v48.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v48 = v48.AdjustColor(ou = +10, ov = -10, x=100, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v48 = v48.colorYUV(off_u = -3, off_v = +3)
v48 = v48.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5, border_t=600)
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate

v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
b_ex = undefined
v49 = v49.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v49 = v49.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.9)
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate

v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
b_ex = undefined
v50 = v50.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v50 = v50.colorYUV(off_u = +6, off_v = -6)
v50 = v50.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.9)
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate

v51 = LSMASHVideoSource(dst_dir + "v51f.mp4").ConvertToYV24()
b_ex = undefined
v51 = v51.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v51 = v51.colorYUV(off_u = +8, off_v = -4)
v51 = v51.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.9, border_t = 600)
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
v51 = v51.add_blank_audio
return v51.prefetch
#adjustframerate

v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
v52 = v52.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v52 = v52.AdjustColor(ou = +10, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v52 = v52.colorYUV(off_u = +2, off_v = -2)
v52 = v52.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate

v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
v53 = v53.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v53 = v53.AdjustColor(ou = +10, ov = -10, x=0, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v53 = v53.colorYUV(off_u = -2, off_v = +2)
v53 = v53.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=1.9)
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate

v54 = LSMASHVideoSource(dst_dir + "v54f.mp4").ConvertToYV24()
v54 = v54.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v54 = v54.AdjustColor(ou = +10, ov = -10, x=0, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v54 = v54.colorYUV(off_u = +2, off_v = -2)
v54 = v54.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
v54 = v54.add_blank_audio
return v54.prefetch
#adjustframerate

v55 = LSMASHVideoSource(dst_dir + "v55f.mp4").ConvertToYV24()
v55 = v55.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v55 = v55.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v55 = v55.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.5)
v55 = v55.adjustSize
v55 = v55.assumeFPS(18)
v55 = v55.add_blank_audio
return v55.prefetch
#adjustframerate

v56 = LSMASHVideoSource(dst_dir + "v56f.mp4").ConvertToYV24()
b_ex = undefined
v56 = v56.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v56 = v56.colorYUV(off_u = +4, off_v = -4)
v56 = v56.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.9)
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
v56 = v56.add_blank_audio
return v56.prefetch
#adjustframerate

v57 = LSMASHVideoSource(dst_dir + "v57f.mp4").ConvertToYV24()
b_ex = undefined
v57 = v57.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v57 = v57.autolevels(filterRadius=0, minRng=0, ignore_low=0.06, ignore_high=0.03, gamma=1.9)
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
v57 = v57.add_blank_audio
return v57.prefetch
#adjustframerate

v58 = LSMASHVideoSource(dst_dir + "v58f.mp4").ConvertToYV24()
v58 = v58.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v58 = v58.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v58 = v58.colorYUV(off_u = +2, off_v = -2)
v58 = v58.autolevels(filterRadius=0, minRng=0, ignore_low=0.06, ignore_high=0.003, gamma=1.9)
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
v58 = v58.add_blank_audio
return v58.prefetch
#adjustframerate

v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
b_ex = undefined
v59 = v59.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v59 = v59.colorYUV(off_u = +2, off_v = -2)
v59 = v59.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
v59 = v59.add_blank_audio
return v59.prefetch
#adjustframerate

v60 = LSMASHVideoSource(dst_dir + "v60f.mp4").ConvertToYV24()
b_ex = undefined
v60 = v60.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v60 = v60.colorYUV(off_u = +2, off_v = -2)
v60 = v60.autolevels(filterRadius=0, minRng=0, ignore_low=0.06, ignore_high=0.01, gamma=1.7)
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
v60 = v60.add_blank_audio
return v60.prefetch
#adjustframerate

v61 = LSMASHVideoSource(dst_dir + "v61f.mp4").ConvertToYV24()
b_ex = undefined
v61 = v61.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v61 = v61.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.01, gamma=1.1)
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
v61 = v61.add_blank_audio
return v61.prefetch
#adjustframerate

v62 = LSMASHVideoSource(dst_dir + "v62f.mp4").ConvertToYV24()
v62 = v62.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v62 = v62.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v62 = v62.colorYUV(off_u = +2, off_v = -2)
v62 = v62.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.3)
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
v62 = v62.add_blank_audio
return v62.prefetch
#adjustframerate

v63 = LSMASHVideoSource(dst_dir + "v63f.mp4").ConvertToYV24()
v63 = v63.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v63 = v63.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
v63 = v63.add_blank_audio
return v63.prefetch
#adjustframerate

v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
#v64 = v64.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v64 = v64.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v64 = v64.colorYUV(autowhite=true)
v64 = v64.colorYUV(off_u = -4, off_v = +4)
v64 = v64.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.3)
#return v64.hist_levels.prefetch
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate

#******

12 - rotate
23 - r 9
26 - r 9
28 - r 9
29 - r 9
30 - r 9
31 - r 9
32 - r 9
*/