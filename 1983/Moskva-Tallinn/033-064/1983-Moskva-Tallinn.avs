SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

#LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

import("..\s8_functions.avs")
import("..\deflick_overlapped.avs")

LSMASHVideoSource("F:\Media\video\Super8\Sources\1983\S8.Res2K43.Aspect43In43.Speed18Fps-1.mov")
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 372, 638, 1006, 1178, 1409, 1509, 1612, 1677, 1767, 1869, 2076, 2193, 2311, 2536, 2588, 2889, 3415, 3522, 3725, 3833, #20
# 3987, 4060, 4182, 4230, 4297, 4459, 4534, 4586, 4851, 4921, 5082, 5152, 5220, 5272, 5589, 5817, 5867, 6136, 6304, 6455,  #40
# 6641, 6781, 6954, 7064, 7098, 7180, 7304, 7411, 7482, 7693, 7881, 8003, 8186, 8326, 8529, 8599, 8855, 8928, 9012, 9274,  #60
# 9483, 9619, 9685, 10012, 10107,

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
v33 = full.trim(5152, 5219)
v33 = v33.crop(left + 50, top + 10, right + 50, bot + 10)
#v33_0 = v33
v33_r1 = v33.deflickOverlapped(width = 600, height = 1000, step = 200, radius = 1, toward_darkest = true, right2left = true)
v33_r2 = v33.deflickOverlapped(width = 600, height = 1000, step = 200, radius = 2, toward_darkest = true, right2left = true)
v33_r3 = v33.deflickOverlapped(width = 600, height = 1000, step = 200, radius = 3, toward_darkest = true, right2left = true)
v33_r6 = v33.deflickOverlapped(width = 10000, step = 20, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
         v33.deflickOverlapped(width = 600, height = 1000, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v33 = v33_r6.trim(0, 17) +\
      v33_r3.trim(18, -1) +\
      v33_r1.trim(19, -1) +\
      v33_r2.trim(20, -1) +\
      v33_r3.trim(21, 22) +\
      v33_r1.trim(23, 25) +\
      v33_r3.trim(26, 28) +\
      v33.deflickOverlapped(width = 600, step = 200, radius = 3, toward_darkest = true, right2left = true).trim(29, 33) +\
      v33.deflickOverlapped(width = 800, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(34, 0)

v33 = v33.correct_left_side(width = 400).trim(0, 25) +\
      v33.correct_left_side(width = 400, height = 1000).trim(26, 28) +\
      v33.correct_left_side(width = 400).trim(29, 0)
#return v33_0.interleave(v33).prefetch
#return v33.prefetch

v34 = full.trim(5220, 5271)
v34 = v34.crop(left + 50, top + 10, right + 50, bot + 10)
v34 = v34.deflickOverlapped(width = 10000, step = 20, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v34.deflickOverlapped(width = 400, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v34 = v34.correct_left_side(width = 200)
#return v34.prefetch

v35 = full.trim(5272, 5588)
v35 = v35.crop(left + 50, top + 10, right + 50, bot + 10)
v35 = v35.deflickOverlapped(width = 10000, step = 20, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v35.deflickOverlapped(width = 800, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v35 = v35.correct_left_side(width = 600)
#return v35.prefetch

v36 = full.trim(5589, 5816)
v36 = v36.crop(left + 50, top + 10, right + 50, bot + 10)
v36 = v36.deflickOverlapped(width = 10000, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v36.deflickOverlapped(width = 400, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v36 = v36.correct_left_side(width = 200)
#return v36.prefetch

v37 = full.trim(5817, 5866)
v37 = v37.crop(left + 50, top + 10, right + 50, bot + 10).trim(0, 46) +\
      v37.trim(46, -1).crop(0, top + 10, 0, top + 10 - (v37.height - 100)).stackVertical(v37.trim(47, -1).crop(0, 0, 0, -100)).crop(left + 50, top - 90, right + 50, bot - 90) +\
      v37.crop(left + 50, top + 10, right + 50, bot + 10).trim(48, 0)
v37 = v37.deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v37.deflickOverlapped(step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 41) +\
      v37.deflickOverlapped(step = 200, radius = 6, toward_darkest = true, right2left = true).trim(42, -1) +\
      v37.deflickOverlapped(step = 200, radius = 7, toward_darkest = true, right2left = true).trim(43, 0)
v37 = v37.correct_left_side(width = 600)
#return v37.prefetch

left = left - 30
top = top - 8
right = right + 10
bot = bot + 20
v38 = full.trim(5868, 6135)
v38 = v38.crop(left + 50, top + 0, right + 50, bot + 0)
v38 = v38.deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v38.trim(1, 0)
v38 = v38.rotate(-4.)
#return v38.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 40
top = top - 10
right = right - 20
bot = bot + 20
v39 = full.trim(6136, 6303)
v39 = v39.crop(left + 50, top + 0, right + 50, bot + 0)
v39 = v39.deflickOverlapped(step = 30, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v39.trim(1, 0)
v39 = v39.rotate(-4.5)
v39 = v39.crop(0, 0, -20, -30)
#return v39.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 40
top = top - 10
right = right - 20
bot = bot + 20
v40 = full.trim(6304, 6454)
v40 = v40.crop(left + 50, top + 0, right + 50, bot + 0)
v40 = v40.deflickOverlapped(step = 30, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v40.trim(1, 0)
v40 = v40.animate(20, 30, "rotate", -5., -6.)
v40 = v40.crop(0, 0, -20, -30)
#return v40.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v41 = full.trim(6455, 6640)
v41 = v41.crop(left + 50, top + 0, right + 50, bot + 0)
v41 = v41.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v41.trim(1, 0)
#return v41.prefetch

v42 = full.trim(6641, 6780)
v42 = v42.crop(left + 50, top + 0, right + 50, bot + 0)
v42 = v42.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v42.trim(1, 0)
#return v42.prefetch

left = left - 40
top = top - 10
right = right - 20
bot = bot + 20
v43 = full.trim(6781, 6953)
v43 = v43.crop(left + 50, top + 0, right + 50, bot + 0)
v43 = v43.deflickOverlapped(step = 30, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v43.trim(1, 0)
v43 = v43.rotate(-3.)
v43 = v43.crop(0, 0, -20, -30)
#return v43.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 40
top = top - 10
right = right - 20
bot = bot + 20
v44 = full.trim(6954, 7063)
v44 = v44.crop(left + 30, top + 0, right + 30, bot + 0)
v44 = v44.deflickOverlapped(step = 30, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v44.trim(1, 0)
v44 = v44.rotate(-2.)
v44 = v44.crop(30, 0, -26, -56)
#return v44.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v45 = full.trim(7064, 7097)
v45 = v45.crop(left + 30, top + 0, right + 30, bot + 0)
v45 = v45.deflickOverlapped(step = 30, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v45.trim(1, 0)
#return v45.prefetch

left = left - 40
top = top - 10
right = right - 20
bot = bot + 20
v46 = full.trim(7098, 7179)
v46 = v46.crop(left + 30, top + 0, right + 30, bot + 0)
v46 = v46.deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v46.trim(1, 0)
v46 = v46.rotate(-3.5)
v46 = v46.crop(38, 0, -20, -58)
#return v46.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 30
top = top - 8
right = right + 10
bot = bot + 20
v47 = full.trim(7180, 7302)
v47 = v47.crop(left + 30, top + 0, right + 30, bot + 0)
v47 = v47.deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v47.trim(1, 0)
v47 = v47.rotate(-3.9)
#return v47.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v48 = full.trim(7304, 7410)
v48 = v48.crop(left + 30, top + 0, right + 30, bot + 0)
v48 = v48.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v48.trim(1, 0)
#return v48.prefetch

v49 = full.trim(7411, 7481)
v49 = v49.crop(left + 30, top + 0, right + 30, bot + 0)
v49 = v49.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v49.trim(1, 0)
#return v49.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v50 = full.trim(7482, 7692)
v50 = v50.crop(left + 30, top + 0, right + 30, bot + 0)
v50 = v50.deflickOverlapped(step = 6000, radius = 16, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(1, 0).deflickOverlapped(step = 6000, radius = 15, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(2, 0).deflickOverlapped(step = 6000, radius = 14, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(3, 0).deflickOverlapped(step = 6000, radius = 13, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(4, 0).deflickOverlapped(step = 6000, radius = 12, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(5, 0).deflickOverlapped(step = 6000, radius = 11, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(6, 0).deflickOverlapped(step = 6000, radius = 10, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(7, 0).deflickOverlapped(step = 6000, radius = 09, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(8, 0).deflickOverlapped(step = 6000, radius = 08, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(9, 0).deflickOverlapped(step = 6000, radius = 07, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(10, 0).deflickOverlapped(step = 6000, radius = 06, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(11, 0).deflickOverlapped(step = 6000, radius = 05, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(12, 0).deflickOverlapped(step = 6000, radius = 04, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(13, 0).deflickOverlapped(step = 6000, radius = 03, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(14, 0).deflickOverlapped(step = 6000, radius = 02, toward_darkest = true, right2left = false).trim(0, -1) +\
      v50.trim(15, 0)
v50 = v50.animate(55, 95, "rotate", -2.5, -4.5)
#return v50.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

#left = left - 20
#top = top - 10
#right = right + 20
#bot = bot + 18
v51 = full.trim(7693, 7879)
v51 = v51.crop(left + 30, top + 0, right + 30, bot + 0)
v51 = v51.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v51.deflickOverlapped(width = 400, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v51 = v51.correct_left_side(width = 200)
#v51 = v51.animate(10, 60, "rotate", -5., -8)
#return v51.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v52 = full.trim(7881, 8001)
v52 = v52.crop(left + 30, top + 0, right + 30, bot + 0)
v52 = v52.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v52.deflickOverlapped(width = 400, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v52 = v52.correct_left_side(width = 200)
v52 = v52.rotate(-5.)
#return v52.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v53 = full.trim(8004, 8185)
v53 = v53.crop(left + 30, top + 0, right + 30, bot + 0)
v53 = v53.trim(0, 75).deflicker(noise = 0, scene = 255) +\
      v53.trim(76, 0).deflicker(noise = 0, scene = 255)
v53 = v53.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true)
v53 = v53.correct_left_side(width = 400)
#return v53.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v54 = full.trim(8186, 8325)
v54 = v54.crop(left + 30, top + 0, right + 30, bot + 0)
v54 = v54.deflickOverlapped(step = 200, radius = 6, toward_darkest = true, right2left = true)
v54 = v54.correct_left_side(width = 600)
v54 = v54.rotate(-3.5)
#return v54.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v55 = full.trim(8326, 8528)
v55 = v55.crop(left + 30, top + 0, right + 30, bot + 0)
v55 = v55.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v55.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v55 = v55.correct_left_side(width = 200)
v55 = v55.animate(73, 103, "rotate", -3.5, -5.)
#return v55.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v56 = full.trim(8529, 8598)
v56 = v56.crop(left + 30, top + 0, right + 30, bot + 0)
v56 = v56.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v56.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v56 = v56.correct_left_side(width = 200)
#return v56.prefetch

v57 = full.trim(8599, 8854)
v57 = v57.crop(left + 30, top + 0, right + 30, bot + 0)
v57 = v57.trim(0, -1) +\
      v57.colorYUV(gain_y = 128).trim(1, -1) +\
      v57.trim(2, -1) +\
      v57.colorYUV(gain_y = 64).trim(3, -1) +\
      v57.trim(4, 0)
v57 = v57.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v57.deflickOverlapped(width = 18000, step = 200, radius = 5, toward_darkest = true, right2left = true).trim(1, 0)
v57 = v57.correct_left_side(width = 400)
#return v57.hist_levels.prefetch

v58 = full.trim(8855, 8927)
v58 = v58.crop(left + 30, top + 0, right + 30, bot + 0)
v58 = v58.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v58.deflickOverlapped(width = 800, step = 200, radius = 5, toward_darkest = true, right2left = true).trim(1, 0)
v58 = v58.correct_left_side(width = 400)
#return v58.prefetch

v59 = full.trim(8928, 9011)
v59 = v59.crop(left + 30, top + 0, right + 30, bot + 0)
v59 = v59.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v59.deflickOverlapped(width = 800, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v59 = v59.correct_left_side(width = 400)
#return v59.prefetch

v60 = full.trim(9014, 9273)
v60 = v60.crop(left + 30, top + 0, right + 30, bot + 0)
v60 = v60.deflickOverlapped(width = 800, step = 200, radius = 5, toward_darkest = true, right2left = true)
v60 = v60.correct_left_side(width = 400)
#return v60.prefetch

v61 = full.trim(9274, 9482)
v61 = v61.crop(left + 30, top + 0, right + 30, bot + 0)
v61 = v61.deflickOverlapped(step = 40, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v61.deflickOverlapped(width = 800, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v61 = v61.correct_left_side(width = 400)
#return v61.prefetch

v62 = full.trim(9483, 9618)
v62 = v62.crop(left + 30, top + 0, right + 30, bot + 0)
v62 = v62.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v62.deflickOverlapped(width = 1200, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v62 = v62.correct_left_side(width = 400)
#return v62.prefetch

v63 = full.trim(9619, 9684)
v63 = v63.crop(left + 30, top + 0, right + 30, bot + 0)
v63 = v63.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v63.deflickOverlapped(width = 600, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v63 = v63.correct_left_side(width = 400)
#return v63.prefetch
*/
left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v64 = full.trim(9685, 10011)
v64 = v64.crop(left + 30, top + 0, right + 30, bot + 0)
v64 = v64.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v64.deflickOverlapped(width = 1000, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v64 = v64.correct_left_side(width = 400)
v64 = v64.rotate(-3.)
#return v64.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo
/*
#return v1.adjustBorders.prefetch
#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#v2 = v2.AdjustColor(ou = +12, ov = -4, x=1000, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
#return src.adjustBorders.info.prefetch

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30
*/
global filter16 = true

import("..\common.avs")

/*

#******

# 33

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
v33 = v33.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v33 = v33.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate

v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
v34 = v34.colorYUV(off_y = -8)
v34 = v34.AdjustColor(ou = +18, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v34 = v34.colorYUV(off_u = +0, off_v = +4)
v34 = v34.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate

v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
v35 = v35.colorYUV(off_y = -16)
v35 = v35.AdjustColor(ou = +18, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v35 = v35.colorYUV(off_u = +0, off_v = +4)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate

v36 = LSMASHVideoSource(dst_dir + "v36f.mp4").ConvertToYV24()
v36 = v36.AdjustColor(ou = +20, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.5, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v36 = v36.colorYUV(off_u = -4, off_v = +4)
v36 = v36.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=2)
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
v36 = v36.add_blank_audio
return v36.prefetch
#adjustframerate

v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
v37 = v37.AdjustColor(ou = +24, ov = -16, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.5, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v37 = v37.colorYUV(off_u = -4, off_v = +6)
v37 = v37.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.9)
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate

v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
v38 = v38.colorYUV(off_y = -16).trim(0, 88) +\
      v38.colorYUV(off_y = -20).trim(89, 0)
v38 = v38.AdjustColor(ou = +16, ov = -16, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v38 = v38.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate

v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
v39 = v39.colorYUV(off_y = -20)
v39 = v39.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
v39 = v39.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.7)
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate

v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
v40 = v40.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v40 = v40.animate(55, 80, "color_yuv", 0, 0, -4, -4).trim(0, 114) +\
      v40.animate(115, 125, "color_yuv", -4, -4, 0, 0).trim(115, 0)
v40 = v40.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=2)
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate

v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
v41 = v41.colorYUV(off_y = -16)
v41 = v41.AdjustColor(ou = +10, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
v41 = v41.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate

v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
v42 = v42.AdjustColor(ou = +16, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v42 = v42.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.9)
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate

v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
v43 = v43.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v43 = v43.colorYUV(off_u = +6, off_v = -6)
v43 = v43.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.7)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate

v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
v44 = v44.AdjustColor(ou = +14, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true)
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate

v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
v45 = v45.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate

v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
v46 = v46.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true)
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate

v47 = LSMASHVideoSource(dst_dir + "v47f.mp4").ConvertToYV24()
v47 = v47.colorYUV(off_y = -20)
v47 = v47.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v47 = v47.colorYUV(off_u = +2, off_v = -2)
v47 = v47.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.4).trim(0, -1) +\
      v47.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.6).trim(1, -1) +\
      v47.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.4).trim(2, 3) +\
      v47.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2).trim(4, -1) +\
      v47.trim(5, 0)
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
v47 = v47.add_blank_audio
return v47.prefetch
#adjustframerate

v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
v48 = v48.colorYUV(off_y = -16).trim(0, 15) +\
      v48.colorYUV(off_y = -20).trim(16, 0)
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v48 = v48.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v48 = v48.colorYUV(off_u = -2, off_v = +2)
v48 = v48.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.7)
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate

v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
v49 = v49.colorYUV(off_y = -20)
v49 = v49.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate

v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
v50 = v50.animate(70, 90, "offset_y", 0, -12)
v50 = v50.AdjustColor(ou = +10, ov = -6, x=10, y=10, w=-8, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v50 = v50.colorYUV(off_u = 2, off_v = +0)
v50 = v50.animate(0, 6, "gamma_f", 1, 2.3)
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate

v51 = LSMASHVideoSource(dst_dir + "v51f.mp4").ConvertToYV24()
v51 = v51.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v51 = v51.colorYUV(off_u = 2, off_v = -2)
v51 = v51.autolevels(filterRadius = 0, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=1.3)
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
v51 = v51.add_blank_audio
return v51.prefetch
#adjustframerate

v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
v52 = v52.AdjustColor(ou = +14, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v52 = v52.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=2).trim(0, -1) +\
      v52.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=2.7).trim(1, -1) +\
      v52.animate(2, 75, "gamma_f", 2.7, 1.0).trim(2, 0)
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate

v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
v53 = v53.AdjustColor(ou = +16, ov = -10, x=600, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=0.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v53 = v53.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=2)
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate

v54 = LSMASHVideoSource(dst_dir + "v54f.mp4").ConvertToYV24()
v54 = v54.AdjustColor(ou = +16, ov = -10, x=300, y=800, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
v54 = v54.add_blank_audio
return v54.prefetch
#adjustframerate

v55 = LSMASHVideoSource(dst_dir + "v55f.mp4").ConvertToYV24()
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v55 = v55.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.4, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v55 = v55.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.1)
v55 = v55.adjustSize
v55 = v55.assumeFPS(18)
v55 = v55.add_blank_audio
return v55.prefetch
#adjustframerate

v56 = LSMASHVideoSource(dst_dir + "v56f.mp4").ConvertToYV24()
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v56 = v56.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v56 = v56.colorYUV(off_u = -4, off_v = -4)
v56 = v56.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
v56 = v56.add_blank_audio
return v56.prefetch
#adjustframerate

v57 = LSMASHVideoSource(dst_dir + "v57f.mp4").ConvertToYV24()
v57 = v57.autolevels
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v57 = v57.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v57 = v57.colorYUV(off_u = +8, off_v = -12)
v57 = v57.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
v57 = v57.add_blank_audio
return v57.prefetch
#adjustframerate

v58 = LSMASHVideoSource(dst_dir + "v58f.mp4").ConvertToYV24()
v58 = v58.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v58 = v58.colorYUV(off_u = +4, off_v = -4)
v58 = v58.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.2)
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
v58 = v58.add_blank_audio
return v58.prefetch
#adjustframerate

v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
v59 = v59.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.1, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v59 = v59.colorYUV(off_u = +4, off_v = -4)
#v59 = v59.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.2)
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
v59 = v59.add_blank_audio
return v59.prefetch
#adjustframerate

v60 = LSMASHVideoSource(dst_dir + "v60f.mp4").ConvertToYV24()
v60 = v60.animate(80, 100, "offset_y", -12, 0)
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v60 = v60.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
v60 = v60.add_blank_audio
return v60.prefetch
#adjustframerate

v61 = LSMASHVideoSource(dst_dir + "v61f.mp4").ConvertToYV24()
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v61 = v61.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v61 = v61.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
v61 = v61.add_blank_audio
return v61.prefetch
#adjustframerate

v62 = LSMASHVideoSource(dst_dir + "v62f.mp4").ConvertToYV24()
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v62 = v62.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v62 = v62.colorYUV(off_u = +4, off_v = -4)
v62 = v62.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
v62 = v62.add_blank_audio
return v62.prefetch
#adjustframerate

v63 = LSMASHVideoSource(dst_dir + "v63f.mp4").ConvertToYV24()
v63 = v63.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=1.3, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v63 = v63.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
v63 = v63.add_blank_audio
return v63.prefetch
#adjustframerate

v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
#v64 = v64.autolevels
#v64 = v64.colorYUV(off_y = -12)
#v64 = v64.animate(80, 100, "offset_y", -12, 0)
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v64 = v64.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v64 = v64.colorYUV(off_u = +4, off_v = -4)
v64 = v64.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.7)
#return v64.hist_levels
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate

#******

*/