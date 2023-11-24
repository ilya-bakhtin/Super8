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

# 0, 372, 638, 1006, 1178, 1409, 1509, 1612, 1677, 1767, 1869, 2076, 2193, 2311, 2536, 2588, 2889, 3415, 3522, 3725, 3833,      # 20
# 3987, 4060, 4182, 4230, 4297, 4459, 4534, 4586, 4851, 4921, 5082, 5152, 5220, 5272, 5589, 5817, 5867, 6136, 6304, 6455,       # 40
# 6641, 6781, 6954, 7064, 7098, 7180, 7304, 7411, 7482, 7693, 7881, 8003, 8186, 8326, 8529, 8599, 8855, 8928, 9012, 9274,       # 60
# 9483, 9619, 9685, 10012, 10107, 10148, 10193, 10317, 10677, 10785, 10903, 11239, 11456, 11567, 11603, 11688, 11766, 11934,    # 78
#drop trim(11567, 11602)
# 12146, 12278, 12471, 12636, 12824, 13008, 13238, 13358, 13470, 13601, 13838, 14120, 14291, 14380, 14405, 14470, 14541, 14606, # 96
# 14682, 14750, 14815, 14884, 14959, 15048, 15588, 15856, 16032, 16146, 16201, 16225, 16240, 16324, 16342, 16387, 16441, 16667, #114
#drop trim(16324, 16341)
# 17032, 17141, 17250, 17313, 17424, 17538, 17775, 17862, 18051, 18283, 18471, 18579, 18598, 18722, 18815, 18933, 19015, 19119, #132

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
v97 = full.trim(14682, 14749)
v97 = v97.crop(left + 30, top + 0, right + 30, bot + 0)
v97 = v97.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v97.trim(3, 0)
#return v97.prefetch

v98 = full.trim(14750, 14814)
v98 = v98.crop(left + 30, top + 0, right + 30, bot + 0)
v98 = v98.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v98.trim(3, 0)
#return v98.prefetch

v99 = full.trim(14815, 14883)
v99 = v99.crop(left + 30, top + 0, right + 30, bot + 0)
v99 = v99.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
      v99.trim(3, 0)
#return v99.prefetch

v100 = full.trim(14884, 14958)
v100 = v100.crop(left + 30, top + 0, right + 30, bot + 0)
v100 = v100.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
       v100.trim(1, 0)
#return v100.prefetch

v101 = full.trim(14959, 15047)
v101 = v101.crop(left + 30, top + 0, right + 30, bot + 0)
v101 = v101.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
       v101.trim(1, 0)
#return v101.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v102 = full.trim(15048, 15587)
v102 = v102.crop(left + 30, top + 0, right + 30, bot + 0)
v102 = v102.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v102.trim(3, 0)
#v102 = v102.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true).\
#            correct_left_side(width = 200)
v102 = v102.rotate(-3.)
#return v102.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v103 = full.trim(15588, 15855)
v103 = v103.crop(left + 30, top + 0, right + 30, bot + 0)
v103 = v103.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 3) +\
       v103.trim(4, 0)
v103df = v103.deflickOverlapped(width = 600, step = 200, radius = 10, toward_darkest = true, right2left = true).\
              correct_left_side(width = 400).correct_left_side(width = 200)
v103 = v103.trim(0, 80) + v103df.trim(81, 130) + v103.trim(131, 179) + v103df.trim(180, 0)
#return v103.prefetch

v104 = full.trim(15856, 16031)
v104 = v104.crop(left + 30, top + 0, right + 30, bot + 0)
v104 = v104.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v104.trim(3, 0)
v104 = v104.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).trim(0, 150) + v104.trim(151, 0)
#return v104.prefetch
*/
left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v105 = full.trim(16032, 16145)
v105 = v105.crop(left + 30, top + 0, right + 30, bot + 0)
v105 = v105.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v105.trim(3, 0)
v105 = v105.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v105 = v105.animate(17, 37, "rotate", -3., -5.)
#return v105.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo
/*
v106 = full.trim(16146, 16200)
v106 = v106.crop(left + 30, top + 0, right + 30, bot + 0)
v106 = v106.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v106.trim(3, 0)
v106 = v106.deflickOverlapped(width = 400, step = 200, radius = 3, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v106.prefetch

v107 = full.trim(16201, 16224)
v107 = v107.crop(left + 30, top + 0, right + 30, bot + 0)
v107 = v107.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v107.trim(3, 0)
v107 = v107.deflickOverlapped(width = 400, step = 200, radius = 3, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v107.prefetch

v108 = full.trim(16225, 16239)
v108 = v108.crop(left + 30, top + 0, right + 30, bot + 0)
v108 = v108.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v108.trim(3, 0)
#return v108.prefetch

v109 = full.trim(16240, 16323)
v109 = v109.crop(left + 30, top + 0, right + 30, bot + 0)
v109 = v109.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v109.trim(3, 0)
v109 = v109.deflickOverlapped(width = 400, step = 200, radius = 3, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v109.prefetch

#drop trim(16324, 16341)
v110 = full.trim(16342, 16386)
v110 = v110.crop(left + 30, top + 0, right + 30, bot + 0)
v110 = v110.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v110.trim(3, 0)
v110 = v110.deflickOverlapped(width = 400, step = 200, radius = 3, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v110.prefetch

v111 = full.trim(16387, 16440)
v111 = v111.crop(left + 30, top + 0, right + 30, bot + 0)
v111 = v111.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v111.trim(3, 0)
v111 = v111.deflickOverlapped(step = 200, radius = 13, toward_darkest = true, right2left = false).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v111.prefetch
*/
left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v112 = full.trim(16443, 16666)
v112 = v112.crop(left + 10, top + 10, right + 10, bot + 10)
v112df = v112.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true).\
              correct_left_side(width = 200).correct_left_side(width = 100)
v112 = v112df.trim(0, 58) + v112.trim(59, 61) + v112df.trim(62, 0)
v112 = v112.rotate(-3.)
#return v112.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo
/*
v113 = full.trim(16667, 17031)
v113 = v113.crop(left + 30, top + 0, right + 30, bot + 0)
v113 = v113.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v113.trim(3, 0)
v113df = v113.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true).\
              correct_left_side(width = 200).correct_left_side(width = 100)
v113df600 = v113.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = true).\
                 correct_left_side(width = 200).correct_left_side(width = 100)
v113cl = v113.correct_left_side(width = 200).correct_left_side(width = 100)
v113 = v113df.trim(  0,  84) + v113cl.trim( 85, 105) + v113df.trim(106, 142) + v113cl.trim(143, 159) +\
       v113df.trim(160, 182) + v113cl.trim(183, 189) + v113df.trim(190, 214) + v113cl.trim(215, 221) +\
       v113df600.trim(222, 0)
#return v113.prefetch

v114 = full.trim(17032, 17140)
v114 = v114.crop(left + 30, top + 0, right + 30, bot + 0)
v114 = v114.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v114.trim(3, 0)
v114 = v114.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v114.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v115 = full.trim(17141, 17249)
v115 = v115.crop(left + 10, top + 0, right + 10, bot + 0)
v115 = v115.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v115.trim(3, 0)
v115 = v115.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v115 = v115.rotate(-2.5)
#return v115.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v116 = full.trim(17250, 17312)
v116 = v116.crop(left + 10, top + 0, right + 10, bot + 0)
v116 = v116.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
       v116.trim(1, 0)
v116df = v116.deflickOverlapped(width = 800, step = 200, radius = 6, toward_darkest = true, right2left = true).\
              correct_left_side(width = 200).correct_left_side(width = 100)
v116 = v116df.trim( 0, 15) +\
       (v116df.trim(15, -1) + v116.trim(16, -1) + v116df.trim(15, -1)).deflickOverlapped(width = 1000, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(18, -1) + v116.trim(17, -1) + v116df.trim(18, -1)).deflickOverlapped(width = 800, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       v116df.trim(18, -1) +\
       (v116df.trim(18, -1) + v116.trim(19, -1) + v116df.trim(18, -1)).deflickOverlapped(width = 800, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(18, -1) + v116.trim(20, -1) + v116df.trim(18, -1)).deflickOverlapped(width = 800, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(22, -1) + v116.trim(21, -1) + v116df.trim(22, -1)).deflickOverlapped(width = 800, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       v116df.trim(22, 33) +\
       (v116df.trim(33, -1) + v116.trim(34, -1) + v116df.trim(33, -1)).deflickOverlapped(width = 800, step = 400, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116.trim(36, -1) + v116.trim(35, -1) + v116.trim(36, -1)).deflickOverlapped(width = 800, step = 400, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       v116.trim(36, 36) +\
       (v116.trim(36, -1) + v116.trim(37, -1) + v116.trim(36, -1)).deflickOverlapped(width = 800, step = 400, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116.trim(36, -1) + v116.trim(38, -1) + v116.trim(36, -1)).deflickOverlapped(width = 800, step = 400, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(41, -1) + v116.trim(39, -1) + v116df.trim(41, -1)).deflickOverlapped(width = 800, step = 400, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(41, -1) + v116.trim(40, -1) + v116df.trim(41, -1)).deflickOverlapped(width = 800, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       v116df.trim(41, 45) +\
       (v116df.trim(45, -1) + v116.trim(46, -1) + v116df.trim(45, -1)).deflickOverlapped(width = 800, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(45, -1) + v116.trim(47, -1) + v116df.trim(45, -1)).deflickOverlapped(width = 800, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(51, -1) + v116.trim(48, -1) + v116df.trim(51, -1)).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(51, -1) + v116.trim(49, -1) + v116df.trim(51, -1)).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       (v116df.trim(51, -1) + v116.trim(50, -1) + v116df.trim(51, -1)).deflickOverlapped(step = 200, radius = 1, toward_darkest = true, right2left = false).trim(1, -1) +\
       v116df.trim(51, 0)
v116 = v116.rotate(-3.)
#return v116.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v117 = full.trim(17313, 17423)
v117 = v117.crop(left + 10, top + 0, right + 10, bot + 0)
v117 = v117.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v117.trim(3, 0)
v117 = v117.deflickOverlapped(width = 800, step = 200, radius = 6, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v117 = v117.rotate(-3.)
#return v117.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v118 = full.trim(17424, 17537)
v118 = v118.crop(left + 30, top + 0, right + 30, bot + 0)
v118 = v118.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v118.trim(3, 0)
v118 = v118.deflickOverlapped(width = 800, step = 200, radius = 6, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v118.prefetch

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v119 = full.trim(17538, 17774)
v119 = v119.crop(left + 10, top + 0, right + 10, bot + 0)
v119 = v119.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v119.trim(3, 0)
v119 = v119.deflickOverlapped(width = 1200, step = 200, radius = 7, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v119 = v119.rotate(-4.)
#return v119.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v120 = full.trim(17775, 17861)
v120 = v120.crop(left + 10, top + 0, right + 10, bot + 0)
v120 = v120.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v120.trim(3, 0)
v120 = v120.deflickOverlapped(width = 800, step = 200, radius = 7, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v120 = v120.rotate(-3.)
#return v120.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v121 = full.trim(17862, 18050)
v121 = v121.crop(left + 20, top + 0, right + 20, bot + 0)
v121 = v121.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v121.trim(3, 0)
v121 = v121.deflickOverlapped(width = 800, step = 200, radius = 7, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v121 = v121.rotate(-3.5)
#return v121.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 0
right = right + 20
bot = bot + 28
v122 = full.trim(18051, 18282)
v122 = v122.crop(left + 20, top + 0, right + 20, bot + 0)
v122 = v122.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v122.trim(3, 0)
v122 = v122.deflickOverlapped(width = 1000, step = 200, radius = 8, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v122 = v122.rotate(-3.5)
#return v122.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v123 = full.trim(18283, 18470)
v123 = v123.crop(left + 30, top + 10, right + 30, bot + 10)
v123 = v123.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v123.trim(3, 0)
v123 = v123.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v123 = v123.rotate(-1.5)
#return v123.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v124 = full.trim(18471, 18578)
v124 = v124.crop(left + 30, top + 10, right + 30, bot + 10)
v124 = v124.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v124.trim(3, 0)
v124 = v124.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
v124 = v124.rotate(-3.)
#return v124.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

v125 = full.trim(18579, 18597)
v125 = v125.crop(left + 30, top + 0, right + 30, bot + 0)
v125 = v125.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v125.trim(3, 0)
v125 = v125.deflickOverlapped(width = 800, step = 200, radius = 8, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v125.prefetch

left = left - 20
top = top - 0
right = right + 20
bot = bot + 28
v126 = full.trim(18598, 18721)
v126 = v126.crop(left + 30, top + 0, right + 30, bot + 0)
v126 = v126.correct_left_side(width = 400).correct_left_side(width = 200).correct_left_side(width = 100).trim(0, 64) + v126.trim(65, 0)
v126 = v126.rotate(-3.5)
#return v126.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 0
right = right + 20
bot = bot + 28
v127 = full.trim(18722, 18814)
v127 = v127.crop(left + 30, top + 0, right + 30, bot + 0)
v127 = v127.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v127.trim(3, 0)
v127 = v127.rotate(-5.)
#return v127.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo

left = left - 20
top = top - 10
right = right + 20
bot = bot + 18
v128 = full.trim(18815, 18932)
v128 = v128.crop(left + 30, top + 0, right + 30, bot + 0)
v128 = v128.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v128.trim(3, 0)
v128 = v128.correct_left_side(width = 200).correct_left_side(width = 100)
v128 = v128.rotate(-3.)
#return v128.adjustBorders.prefetch
left = lo
top = to
right = ro
bot = bo
*/
#global filter16 = true

import("..\common.avs")

/*

#******

# 97

v97 = LSMASHVideoSource(dst_dir + "v97f.mp4").ConvertToYV24()
v97 = v97.colorYUV(off_y = -12)
b_ex = "z x 1.5 * > z y 1.5 * > & x y + 2. / z ?"
v97h = v97.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-200, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v97 = v97.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v97 = v97.trim(0, 46) + v97h.trim(47, 50) + v97.trim(51, 0)
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
v97 = v97.add_blank_audio
return v97.prefetch
#adjustframerate

v98 = LSMASHVideoSource(dst_dir + "v98f.mp4").ConvertToYV24()
v98 = v98.colorYUV(off_y = -16)
b_ex = undefined
v98 = v98.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v98 = v98.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
v98 = v98.add_blank_audio
return v98.prefetch
#adjustframerate

v99 = LSMASHVideoSource(dst_dir + "v99f.mp4").ConvertToYV24()
v99 = v99.colorYUV(off_y = -16)
v99 = v99.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true)
v99 = v99.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
v99 = v99.add_blank_audio
return v99.prefetch
#adjustframerate

v100 = LSMASHVideoSource(dst_dir + "v100f.mp4").ConvertToYV24()
v100 = v100.colorYUV(off_y = -16)
b_ex = "z x 1.3 * > z y 1.3 * > & x y + 2. / z ?"
v100 = v100.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
v100 = v100.add_blank_audio
return v100.prefetch
#adjustframerate

v101 = LSMASHVideoSource(dst_dir + "v101f.mp4").ConvertToYV24()
v101 = v101.colorYUV(off_y = -16)
b_ex = "z x 1.1 * > z y 1.1 * > & z x y + 2. / - 2. / z ?"
v101 = v101.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-800, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)#,\
v101 = v101.colorYUV(off_u = +2, off_v = -2)
v101 = v101.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v101 = v101.adjustSize
v101 = v101.assumeFPS(18)
v101 = v101.add_blank_audio
return v101.prefetch
#adjustframerate

v102 = LSMASHVideoSource(dst_dir + "v102f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v102 = v102.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v102 = v102.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v102 = v102.adjustSize
v102 = v102.assumeFPS(18)
v102 = v102.add_blank_audio
return v102.prefetch
#adjustframerate

v103 = LSMASHVideoSource(dst_dir + "v103f.mp4").ConvertToYV24()
b_ex = undefined
v103 = v103.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v103 = v103.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5, autolevel=false, input_low=16, input_high=235)
v103 = v103.adjustSize
v103 = v103.assumeFPS(18)
v103 = v103.add_blank_audio
return v103.prefetch
#adjustframerate

v104 = LSMASHVideoSource(dst_dir + "v104f.mp4").ConvertToYV24()
v104 = v104.colorYUV(off_y = -8)
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v104 = v104.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v104 = v104.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v104 = v104.adjustSize
v104 = v104.assumeFPS(18)
v104 = v104.add_blank_audio
return v104.prefetch
#adjustframerate

v105 = LSMASHVideoSource(dst_dir + "v105f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v105 = v105.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v105 = v105.colorYUV(off_u = +4, off_v = -0)
v105 = v105.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v105 = v105.adjustSize
v105 = v105.assumeFPS(18)
v105 = v105.add_blank_audio
return v105.prefetch
#adjustframerate

v106 = LSMASHVideoSource(dst_dir + "v106f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v106 = v106.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v106 = v106.colorYUV(off_u = -4, off_v = +4)
v106 = v106.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v106 = v106.adjustSize
v106 = v106.assumeFPS(18)
v106 = v106.add_blank_audio
return v106.prefetch
#adjustframerate

v107 = LSMASHVideoSource(dst_dir + "v107f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v107 = v107.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v107 = v107.colorYUV(off_u = -4, off_v = +4)
v107 = v107.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
v107 = v107.add_blank_audio
return v107.prefetch
#adjustframerate

v108 = LSMASHVideoSource(dst_dir + "v108f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v108 = v108.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v108 = v108.colorYUV(off_u = -4, off_v = +4)
v108 = v108.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v108 = v108.adjustSize
v108 = v108.assumeFPS(18)
v108 = v108.add_blank_audio
return v108.prefetch
#adjustframerate

v109 = LSMASHVideoSource(dst_dir + "v109f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v109 = v109.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v109 = v109.colorYUV(off_u = -4, off_v = +4)
v109 = v109.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
v109 = v109.add_blank_audio
return v109.prefetch
#adjustframerate

v110 = LSMASHVideoSource(dst_dir + "v110f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v110 = v110.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v110 = v110.colorYUV(off_u = -4, off_v = +4)
v110 = v110.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v110 = v110.adjustSize
v110 = v110.assumeFPS(18)
v110 = v110.add_blank_audio
return v110.prefetch
#adjustframerate

v111 = LSMASHVideoSource(dst_dir + "v111f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v111 = v111.AdjustColor(ou = +14, ov = -14, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.4, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v111 = v111.colorYUV(off_u = -4, off_v = +4)
v111 = v111.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.03, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
v111 = v111.add_blank_audio
return v111.prefetch
#adjustframerate

v112 = LSMASHVideoSource(dst_dir + "v112f.mp4").ConvertToYV24()
b_ex = undefined
v112 = v112.AdjustColor(ou = +12, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v112 = v112.colorYUV(off_u = +4, off_v = -0)
v112 = v112.adjustSize
v112 = v112.assumeFPS(18)
v112 = v112.add_blank_audio
return v112.prefetch
#adjustframerate

v113 = LSMASHVideoSource(dst_dir + "v113f.mp4").ConvertToYV24()
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v113 = v113.AdjustColor(ou = +12, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v113 = v113.animate(280, 285, "color_yuv", 6, -4, 0, 0)
v113 = v113.adjustSize
v113 = v113.assumeFPS(18)
v113 = v113.add_blank_audio
return v113.prefetch
#adjustframerate

v114 = LSMASHVideoSource(dst_dir + "v114f.mp4").ConvertToYV24()
b_ex = undefined
v114 = v114.AdjustColor(ou = +12, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v114 = v114.animate(40, 50, "color_yuv", 0, 0, -4, 4)
v114 = v114.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v114 = v114.adjustSize
v114 = v114.assumeFPS(18)
v114 = v114.add_blank_audio
return v114.prefetch
#adjustframerate

v115 = LSMASHVideoSource(dst_dir + "v115f.mp4").ConvertToYV24()
b_ex = undefined
v115 = v115.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v115 = v115.colorYUV(off_u = +4, off_v = -4)
v115 = v115.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v115 = v115.adjustSize
v115 = v115.assumeFPS(18)
v115 = v115.add_blank_audio
return v115.prefetch
#adjustframerate

v116 = LSMASHVideoSource(dst_dir + "v116f.mp4").ConvertToYV24()
b_ex = undefined
v116 = v116.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v116 = v116.colorYUV(off_u = +4, off_v = -4)
v116 = v116.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v116 = v116.adjustSize
v116 = v116.assumeFPS(18)
v116 = v116.add_blank_audio
return v116.prefetch
#adjustframerate

v117 = LSMASHVideoSource(dst_dir + "v117f.mp4").ConvertToYV24()
b_ex = undefined
v117 = v117.AdjustColor(ou = +14, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v117 = v117.adjustSize
v117 = v117.assumeFPS(18)
v117 = v117.add_blank_audio
return v117.prefetch
#adjustframerate

v118 = LSMASHVideoSource(dst_dir + "v118f.mp4").ConvertToYV24()
b_ex = undefined
v118 = v118.AdjustColor(ou = +14, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v118 = v118.adjustSize
v118 = v118.assumeFPS(18)
v118 = v118.add_blank_audio
return v118.prefetch
#adjustframerate

v119 = LSMASHVideoSource(dst_dir + "v119f.mp4").ConvertToYV24()
b_ex = undefined
v119 = v119.AdjustColor(ou = +10, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v119 = v119.animate(180, 210, "color_yuv", 4, -4, 16, -4)
v119 = v119.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.)#, autolevel=false, input_low=16, input_high=235)
v119 = v119.adjustSize
v119 = v119.assumeFPS(18)
v119 = v119.add_blank_audio
return v119.prefetch
#adjustframerate

v120 = LSMASHVideoSource(dst_dir + "v120f.mp4").ConvertToYV24()
b_ex = undefined
v120 = v120.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v120 = v120.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.)#, autolevel=false, input_low=16, input_high=235)
v120 = v120.adjustSize
v120 = v120.assumeFPS(18)
v120 = v120.add_blank_audio
return v120.prefetch
#adjustframerate

v121 = LSMASHVideoSource(dst_dir + "v121f.mp4").ConvertToYV24()
b_ex = undefined
v121 = v121.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v121 = v121.colorYUV(off_u = +6, off_v = -10)
v121 = v121.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v121 = v121.adjustSize
v121 = v121.assumeFPS(18)
v121 = v121.add_blank_audio
return v121.prefetch
#adjustframerate

v122 = LSMASHVideoSource(dst_dir + "v122f.mp4").ConvertToYV24()
b_ex = undefined
v122 = v122.AdjustColor(ou = +6, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v122 = v122.colorYUV(off_u = +6, off_v = -6)
v122 = v122.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v122 = v122.adjustSize
v122 = v122.assumeFPS(18)
v122 = v122.add_blank_audio
return v122.prefetch
#adjustframerate

v123 = LSMASHVideoSource(dst_dir + "v123f.mp4").ConvertToYV24()
b_ex = undefined
v123 = v123.AdjustColor(ou = +10, ov = -6, x=300, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v123 = v123.colorYUV(off_u = +6, off_v = -6)
v123 = v123.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=1.7)#, autolevel=false, input_low=16, input_high=235)
v123 = v123.adjustSize
v123 = v123.assumeFPS(18)
v123 = v123.add_blank_audio
return v123.prefetch
#adjustframerate

v124 = LSMASHVideoSource(dst_dir + "v124f.mp4").ConvertToYV24()
b_ex = undefined
v124 = v124.AdjustColor(ou = +10, ov = -6, x=300, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v124 = v124.colorYUV(off_u = +6, off_v = -6)
v124 = v124.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=1.5)#, autolevel=false, input_low=16, input_high=235)
v124 = v124.adjustSize
v124 = v124.assumeFPS(18)
v124 = v124.add_blank_audio
return v124.prefetch
#adjustframerate

v125 = LSMASHVideoSource(dst_dir + "v125f.mp4").ConvertToYV24()
b_ex = undefined
v125 = v125.AdjustColor(ou = +10, ov = -6, x=300, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v125 = v125.colorYUV(off_u = +6, off_v = -6)
v125 = v125.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=1.2)#, autolevel=false, input_low=16, input_high=235)
v125 = v125.adjustSize
v125 = v125.assumeFPS(18)
v125 = v125.add_blank_audio
return v125.prefetch
#adjustframerate

v126 = LSMASHVideoSource(dst_dir + "v126f.mp4").ConvertToYV24()
b_ex = undefined
v126 = v126.AdjustColor(ou = +10, ov = -6, x=500, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v126 = v126.colorYUV(off_u = +6, off_v = -6)
v126 = v126.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.2, border_l = 500)#, autolevel=false, input_low=16, input_high=235)
v126 = v126.adjustSize
v126 = v126.assumeFPS(18)
v126 = v126.add_blank_audio
return v126.prefetch
#adjustframerate

v127 = LSMASHVideoSource(dst_dir + "v127f.mp4").ConvertToYV24()
b_ex = undefined
v127 = v127.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v127 = v127.colorYUV(off_u = +6, off_v = -6)
v127 = v127.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.2)#, autolevel=false, input_low=16, input_high=235)
v127 = v127.adjustSize
v127 = v127.assumeFPS(18)
v127 = v127.add_blank_audio
return v127.prefetch
#adjustframerate

v128 = LSMASHVideoSource(dst_dir + "v128f.mp4").ConvertToYV24()
#v128 = v128.autolevels
#v128 = v128.colorYUV(off_y = -8)
#v128 = v128.animate(80, 100, "offset_y", -12, 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v128 = v128.AdjustColor(ou = +12, ov = -2, x=500, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex,\
*/
/*                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",*/\
/*
                     bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v128 = v128.colorYUV(off_u = +6, off_v = -6)
#v128 = v128.animate(180, 210, "color_yuv", 4, -4, 12, -4)
v128 = v128.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.2)#, autolevel=false, input_low=16, input_high=235)
#return v128.hist_levels
v128 = v128.adjustSize
v128 = v128.assumeFPS(18)
v128 = v128.add_blank_audio
return v128.prefetch
#adjustframerate

#******

*/