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
# 19169, 19260, 19479, 19687, 19764, 20085, 20153, 20233, 20303, 20498, 20649, 20860, 20967

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

left = 56
top = 94
right = -104
bot = -100

v129 = full.trim(18933, 19014)
#v129o = v129
v129 = v129.rotate(-3.)
#v129 = v129.crop(left + 50, top + 30, right + 8, bot + 0)
v129 = v129.crop(left + 30, top + 14, right + 10, bot + 0)
v129 = v129.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v129.trim(3, 0)
v129 = v129.correct_left_side(width = 200).correct_left_side(width = 100)
#v129 = v129.addBorders(left + 20, top - 0, -right - 50, -bot - 20)
#return v129.adjustBorders
#return v129o.interleave(v129)
#v129 = v129.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
#       v129.trim(3, 0)
#v129 = v129.correct_left_side(width = 200).correct_left_side(width = 100)
#return v129.prefetch

v130 = full.trim(19015, 19118)
#v130 = v130.crop(left + 20, top - 0, right + 50, bot + 20)
v130 = v130.rotate(-3.)
#v130 = v130.crop(left + 50, top + 30, right + 8, bot + 0)
v130 = v130.crop(left + 30, top + 14, right + 10, bot + 0)
v130 = v130.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v130.trim(3, 0)
v130 = v130.correct_left_side(width = 200).correct_left_side(width = 100)
#return v130.prefetch

v131 = full.trim(19119, 19168)
#v131 = v131.crop(left + 20, top - 0, right + 50, bot + 20)
v131 = v131.rotate(-3.)
#v131 = v131.crop(left + 50, top + 30, right + 8, bot + 0)
v131 = v131.crop(left + 30, top + 14, right + 10, bot + 0)
v131 = v131.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v131.trim(3, 0)
v131 = v131.correct_left_side(width = 200).correct_left_side(width = 100)
#return v131.prefetch

v132 = full.trim(19169, 19259)
v132 = v132.crop(left + 20, top - 0, right + 50, bot + 20)
v132 = v132.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v132.trim(3, 0)
v132 = v132.correct_left_side(width = 100)
#return v132.prefetch

v133 = full.trim(19260, 19478)
v133 = v133.crop(left + 20, top - 0, right + 50, bot + 20)
v133 = v133.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v133.trim(3, 0)
v133 = v133.correct_left_side(width = 100)
#return v133.prefetch

v134 = full.trim(19479, 19686)
v134 = v134.rotate(-4.)
v134 = v134.crop(left + 40, top + 32, right - 20, bot - 10)
v134 = v134.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v134.trim(3, 0)
v134 = v134.correct_left_side(width = 200).correct_left_side(width = 100)
#return v134.prefetch

v135 = full.trim(19687, 19763)
v135 = v135.rotate(-4.)
v135 = v135.crop(left + 40, top + 32, right - 20, bot - 10)
v135 = v135.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v135.trim(3, 0)
v135 = v135.correct_left_side(width = 200).correct_left_side(width = 100)
#return v135.prefetch

v136 = full.trim(19764, 20084)
v136 = v136.animate(60, 65, "rotate", -3., -4.)
v136 = v136.crop(left + 40, top + 32, right - 20, bot - 10)
v136 = v136.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v136.trim(3, 0)
v136 = v136.correct_left_side(width = 200).correct_left_side(width = 100)
#return v136.prefetch

v137 = full.trim(20085, 20152)
v137 = v137.rotate(-2.)
v137 = v137.crop(left + 20, top + 10, right + 36, bot + 20)
v137 = v137.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v137.trim(3, 0)
v137 = v137.correct_left_side(width = 200).correct_left_side(width = 100)
#return v137.prefetch

v138 = full.trim(20153, 20232)
v138 = v138.rotate(-3.)
v138 = v138.crop(left + 30, top + 14, right + 10, bot + 0)
v138 = v138.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v138.trim(3, 78) +\
       v138.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(79, 0)
v138 = v138.correct_left_side(width = 200).correct_left_side(width = 100)
#return v138.adjustBorders.prefetch

v139 = full.trim(20233, 20302)
#v139 = v139.crop(left + 20, top - 0, right + 50, bot + 20)
v139 = v139.rotate(-2.)
v139 = v139.crop(left + 20, top + 10, right + 36, bot + 20)
v139 = v139.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v139.trim(3, 0)
#return v139.adjustBorders.prefetch

v140 = full.trim(20303, 20497)
#v140 = v140.crop(left + 20, top - 0, right + 50, bot + 20)
v140 = v140.rotate(-4.)
v140 = v140.crop(left + 40, top + 32, right - 20, bot - 10)
v140 = v140.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v140.trim(3, 0)
#return v140.adjustBorders.prefetch

v141 = full.trim(20498, 20648)
#v141 = v141.crop(left + 20, top - 0, right + 50, bot + 20)
v141 = v141.rotate(-2.)
v141 = v141.crop(left + 20, top + 10, right + 36, bot + 20)
v141 = v141.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v141.trim(3, 0)
#return v141.adjustBorders.prefetch

v142 = full.trim(20649, 20859)
v142 = v142.crop(left + 20, top - 0, right + 50, bot + 20)
v142 = v142.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v142.trim(3, 0)
v142 = v142.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true)
#return v142.adjustBorders.prefetch

v143 = full.trim(20860, 20966)
v143 = v143.crop(left + 20, top - 0, right + 50, bot + 20)
v143 = v143.deflickOverlapped(step = 100, radius = 1, toward_darkest = true, right2left = false).trim(0, 2) +\
       v143.trim(3, 0)
v143 = v143.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = true).\
            correct_left_side(width = 200).correct_left_side(width = 100)
#return v143.adjustBorders.prefetch

#global filter16 = true

import("..\common.avs")

/*

#******

# 129

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