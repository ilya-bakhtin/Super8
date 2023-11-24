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
# 3987, 4060, 4182, 4230, 4297, 4459, 4534, 4586, 4851, 4921, 5082, 5152, 5220,

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
v1 = full.trim(0, 371)
v1_0 = v1.trim(0, -1)
v1_0 = v1_0.crop(0, 710, 0, -70).stackVertical(v1_0.crop(0, 20, 0, -v1_0.height + 800))
v1_19 = v1.trim(19, -1)
v1_19 = v1_19.crop(0, 720, 0, -60).stackVertical(v1_19.crop(0, 20, 0, -v1_19.height + 800))
v1 = v1_0 + v1.trim(1, 18) + v1_19 + v1.trim(20, 0)
left = left
right = right + 44
top = top - 24
bot = bot + 50
v1 = v1.crop(left - 56, top - 40, right - 56, bot - 40).trim(0, -1) +\
     v1.crop(left - 56, top + 10, right - 56, bot + 10).trim(1, 5) +\
     v1.crop(left - 50, top - 10, right - 50, bot - 10).trim(6, 6) +\
     v1.crop(left - 50, top - 20, right - 50, bot - 20).trim(7, 7) +\
     v1.crop(left - 50, top - 30, right - 50, bot - 30).trim(8, 9) +\
     v1.crop(left - 46, top - 26, right - 46, bot - 26).trim(10, 10) +\
     v1.crop(left - 40, top - 16, right - 40, bot - 16).trim(11, 11) +\
     v1.crop(left - 30, top + 40, right - 30, bot + 40).trim(12, 12) +\
     v1.animate(13, 16, "crop", left - 30, top + 40, right - 30, bot + 40, left - 10, top - 20, right - 10, bot - 20).trim(13, 18) +\
     v1.crop(left - 10, top + 40, right - 10, bot + 40).trim(19, 19) +\
     v1.crop(left - 10, top - 10, right - 10, bot - 10).trim(20, 20) +\
     v1.crop(left - 0, top - 10, right - 0, bot - 10).trim(21, 21) +\
     v1.crop(left + 10, top - 10, right + 10, bot - 10).trim(22, 28) +\
     v1.crop(left + 10, top - 20, right + 10, bot - 20).trim(29, 29) +\
     v1.crop(left + 10, top + 10, right + 10, bot + 10).trim(30, 31) +\
     v1.crop(left + 20, top + 20, right + 20, bot + 20).trim(32, 32) +\
     v1.animate(33, 39, "crop", left + 20, top + 30, right + 20, bot + 30, left + 20, top + 0, right + 20, bot + 0).trim(33, 44) +\
     v1.crop(left + 20, top - 20, right + 20, bot - 20).trim(45, 45) +\
     v1.crop(left + 20, top + 0, right + 20, bot + 0).trim(46, 57) +\
     v1.crop(left + 20, top + 10, right + 20, bot + 10).trim(58, 87) +\
     v1.crop(left + 20, top + 30, right + 20, bot + 30).trim(88, 90) +\
     v1.crop(left + 20, top + 10, right + 20, bot + 10).trim(91, 103) +\
     v1.crop(left + 20, top - 10, right + 20, bot - 10).trim(104, 106) +\
     v1.crop(left + 20, top + 10, right + 20, bot + 10).trim(107, 108) +\
     v1.crop(left + 20, top + 20, right + 20, bot + 20).trim(109, 115) +\
     v1.crop(left + 20, top + 0, right + 20, bot + 0).trim(116, 130) +\
     v1.crop(left + 20, top + 20, right + 20, bot + 20).trim(131, 131) +\
     v1.crop(left + 20, top + 30, right + 20, bot + 30).trim(132, 133) +\
     v1.crop(left + 20, top + 10, right + 20, bot + 10).trim(134, 134) +\
     v1.crop(left + 20, top - 20, right + 20, bot - 20).trim(135, 138) +\
     v1.crop(left + 20, top - 10, right + 20, bot - 10).trim(139, 141) +\
     v1.crop(left + 20, top + 10, right + 20, bot + 10).trim(142, 145) +\
     v1.crop(left + 20, top + 0, right + 20, bot + 0).trim(146, 165) +\
     v1.crop(left + 20, top + 20, right + 20, bot + 20).trim(166, 201) +\
     v1.crop(left + 20, top + 0, right + 20, bot + 0).trim(202, 202) +\
     v1.crop(left + 40, top + 20, right + 40, bot + 20).trim(203, 213) +\
     v1.crop(left + 20, top + 0, right + 20, bot + 0).trim(214, 228) +\
     v1.crop(left + 20, top + 40, right + 20, bot + 40).trim(229, 232) +\
     v1.animate(233, 236, "crop", left + 20, top + 0, right + 20, bot + 0, left + 20, top - 40, right + 20, bot - 40).trim(233, 236) +\
     v1.crop(left + 30, top + 0, right + 30, bot + 0).trim(237, 239) +\
     v1.crop(left + 30, top + 20, right + 30, bot + 20).trim(240, 269) +\
     v1.crop(left + 30, top + 0, right + 30, bot + 0).trim(270, 315) +\
     v1.crop(left + 30, top - 20, right + 30, bot - 20).trim(316, 318) +\
     v1.trim(319, 319).crop(0, v1.height - 200, 0, 0).stackVertical(v1.trim(319, 319).crop(0, 0, 0, -200)).crop(left + 20, top + 10, right + 20, bot + 10) +\
     v1.trim(319, 319).crop(0, v1.height - 230, 0, -30).stackVertical(v1.trim(320, 320).crop(0, 0, 0, -200)).crop(left + 60, top - 20, right + 60, bot - 20) +\
     v1.trim(320, 320).crop(0, v1.height - 300, 0, 0).stackVertical(v1.trim(321, 321).crop(0, 0, 0, -300)).crop(left, top - 70, right, bot - 70) +\
     v1.crop(left + 30, top - 0, right + 30, bot - 0).trim(322, 330) +\
     v1.crop(left + 30, top - 20, right + 30, bot - 20).trim(331, 331) +\
     v1.crop(left + 30, top - 0, right + 30, bot - 0).trim(332, 0)
#v1 = v1.deFlicker(scene = 255, info = true)
#return v1.crop(0, 0, 600, 600).histogram("levels").stackHorizontal(v1.deflickOverlapped(width = 900, step = 300, radius = 5, toward_darkest = true).histogram("levels"))
#return v1.colorYUV(off_u = 20).histogram("levels").info
#return v1.deflickRegion(scene = 255)
v1 = v1.deflickOverlapped(width = 800, step = 200, radius = 5, noise = 0, toward_darkest = true, right2left = true).trim(0, 58) +\
     v1.deflickOverlapped(width = 800, step = 400, radius = 5, noise = 0, toward_darkest = true, right2left = true).trim(59, 71) +\
     v1.deflickOverlapped(width = 800, step = 200, radius = 5, noise = 0, toward_darkest = true, right2left = true).trim(72, 74) +\
     v1.deflickOverlapped(width = 1000, step = 200, radius = 5, noise = 0, toward_darkest = true, right2left = true).trim(75, 84) +\
     v1.deflickOverlapped(width = 1200, step = 200, radius = 5, noise = 0, toward_darkest = true, right2left = true).trim(85, 149) +\
     v1.deflickOverlapped(width = 1200, step = 400, radius = 5, noise = 0, toward_darkest = true, right2left = true).trim(150, 166) +\
     v1.deflickOverlapped(width = 10200, step = 400, radius = 5, noise = 0, toward_darkest = true, right2left = true).trim(167, 211) +\
     v1.deflickOverlapped(width = 10200, step = 200, radius = 5, noise = 0, toward_darkest = true, right2left = true).trim(212, 0)
v1 = v1.deflickOverlapped(width = 600, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v1 = v1.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v1 = v1.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v1 = v1.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v1 = v1.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#v1 = v1.AdjustColor(ou = +12, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=2, gam_mac=true,\
#                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v1 = v1.rotate(-3.5)
v1 = v1.crop(110, 70, -40, -80)
#return v1.adjustBorders.autolevels(minRng = 0, border_l = 300, filterRadius = 0).prefetch

left = lo
right = ro
top = to
bot = bo
top = top - 24
right = right + 30
v2 = full.trim(372, 637)
v2 = v2.crop(left + 40, top + 10, right + 40, bot + 10).trim(0, 46) +\
     v2.crop(left + 40, top - 10, right + 40, bot - 10).trim(47, 47) +\
     v2.crop(left + 40, top + 10, right + 40, bot + 10).trim(48, 48) +\
     v2.trim(48, 48).crop(0, v2.height - 50, 0, 0).stackVertical(v2.trim(49, 49).crop(0, 0, 0, -50)).crop(left + 40, top - 70, right + 40, bot - 70) +\
     v2.crop(left + 40, top + 10, right + 40, bot + 10).trim(50, 52) +\
     v2.crop(left + 40, top + 0, right + 40, bot + 0).trim(53, 150) +\
     v2.crop(left + 40, top - 30, right + 40, bot - 30).trim(151, 152) +\
     v2.crop(left + 40, top + 0, right + 40, bot + 0).trim(153, 154) +\
     v2.crop(left + 40, top + 20, right + 40, bot + 20).trim(155, 163) +\
     v2.crop(left + 40, top - 20, right + 40, bot - 20).trim(164, 164) +\
     v2.crop(left + 40, top - 0, right + 40, bot - 0).trim(165, 165) +\
     v2.crop(left + 40, top + 20, right + 40, bot + 20).trim(166, 262) +\
     v2.crop(left + 40, top - 10, right + 40, bot - 10).trim(263, 0)
#return v2.prefetch
#27 -  34
#80 -  87
#86 -  93 trim(2, 0)
#92 -  99 trim(2, 0)
#98 - 105 trim(2, 0)
     v2o = v2
v2 = v2o.deflickOverlapped(width = 1200, step = 300, radius = 7, toward_darkest = true, right2left = true).\
         trim(0, 26).correct_left_side(width = 400) +\
     v2o.trim(27, 34).deflickOverlappedInc(width = 1200, step = 200, toward_darkest = true, right2left = true) +\
     v2o.deflickOverlapped(width = 1200, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(35, 79).correct_left_side +\
     v2o.trim(80,  87).deflickOverlappedInc(width = 1200, step = 200, toward_darkest = true, right2left = true) +\
     v2o.trim(86,  93).deflickOverlappedInc(width = 1200, step = 200, toward_darkest = true, right2left = true).trim(2, 0) +\
     v2o.trim(92,  99).deflickOverlappedInc(width = 1200, step = 200, toward_darkest = true, right2left = true).trim(2, 0) +\
     v2o.trim(98, 105).deflickOverlappedInc(width = 1200, step = 200, toward_darkest = true, right2left = true).trim(2, 0) +\
     v2o.deflickOverlapped(width = 1200, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(106, 0).correct_left_side

#v2 = v2.correct_left_side(width = 600)
v2 = v2.rotate(-3.)
v2 = v2.crop(74, 58, -60, -40)
#return v2.prefetch
#return v2.adjustBorders.autolevels(border_l = 100, filterRadius = 0, minRng = 0).prefetch

left = lo
right = ro
top = to
bot = bo
top = top - 30
right = right + 30
v3 = full.trim(639, 1005)
v3 = v3.crop(left + 40, top + 10, right + 40, bot + 10)
#return v3
v3 = v3.deflickOverlapped(width = 1600, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = true).\
        trim(0, 160).correct_left_side +\
     v3.trim(161, 168).deflickOverlappedInc(width = 800, step = 200, toward_darkest = true, right2left = true) +\
     v3.deflickOverlapped(width = 1200, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = true).\
        trim(169, 207).correct_left_side +\
     v3.trim(208, 216).deflickOverlappedInc(width = 800, step = 200, toward_darkest = true, right2left = true).correct_left_side +\
     v3.trim(215, 222).deflickOverlappedInc(width = 800, step = 200, toward_darkest = true, right2left = true).trim(2, 0).correct_left_side +\
     v3.trim(222, 229).deflickOverlappedInc(width = 800, step = 200, toward_darkest = true, right2left = true).trim(1, 0).correct_left_side +\
     v3.deflickOverlapped(width = 800, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = true).\
        trim(230, 262).correct_left_side +\
     v3.trim(263, 271).deflickOverlappedInc(width = 800, step = 200, toward_darkest = true, right2left = true).correct_left_side +\
     v3.trim(270, 278).deflickOverlappedInc(width = 800, step = 200, toward_darkest = true, right2left = true).trim(2,0).correct_left_side +\
     v3.trim(277, 285).deflickOverlappedInc(width = 800, step = 200, toward_darkest = true, right2left = true).trim(2,0) +\
     v3.deflickOverlapped(width = 800, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = true).\
        trim(286, 290).correct_left_side +\
     v3.trim(291, 299).deflickOverlappedInc(width = 800, step = 200, toward_darkest = true, right2left = true) +\
     v3.deflickOverlapped(width = 800, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = true).\
        trim(300, 0)
#return v3
v3 = v3.rotate(-2.)
v3 = v3.crop(74, 58, -50, -40)
#return v3.adjustBorders.autolevels(border_l = 300, filterRadius = 0, minRng = 0).prefetch

left = lo
right = ro
top = to
bot = bo
v4 = full.trim(1006, 1177)
v4 = v4.crop(left + 40, top + 10, right + 40, bot + 10).trim(0, 5) +\
     v4.trim(5, 5).crop(0, v4.height - 50, 0, 0).stackVertical(v4.trim(6, 6).crop(0, 0, 0, -50)).crop(left + 40, top - 70, right + 40, bot - 70) +\
     v4.crop(left + 40, top + 10, right + 40, bot + 10).trim(7, 0)
v4 = v4.deflickOverlapped(width = 12000, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(0, -1) +\
     v4.deflickOverlapped(width = 1200, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v4 = v4.deflickOverlapped(width = 600, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v4 = v4.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v4 = v4.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v4 = v4.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v4 = v4.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v4.autolevels(border_l = 300, filterRadius = 0, minRng = 0).prefetch

v5 = full.trim(1178, 1408)
v5 = v5.crop(left + 40, top + 10, right + 40, bot + 10)
#v5_0 = v5
v5 = v5.deflickOverlapped(width = 12000, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(0, -1) +\
     v5.deflickOverlapped(width = 1500, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v5 = v5.deflickOverlapped(width = 600, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v5 = v5.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v5 = v5.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v5 = v5.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v5 = v5.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v5_0.interleave(v5).prefetch

v6 = full.trim(1409, 1508)
v6 = v6.crop(left + 40, top + 10, right + 40, bot + 10)
v6 = v6.deflickOverlapped(width = 1200, step = 200, radius = 7, toward_darkest = true, right2left = true)
v6 = v6.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v6 = v6.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v6 = v6.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v6 = v6.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v6 = v6.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v6.prefetch

v7 = full.trim(1509, 1610)
v7 = v7.crop(left + 40, top + 10, right + 40, bot + 10)
v7 = v7.deflickOverlapped(width = 10000, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(0, -1) +\
     v7.deflickOverlapped(width = 1200, step = 200, radius = 7, toward_darkest = true, right2left = true).trim(1, 0)
v7 = v7.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v7 = v7.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v7 = v7.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v7 = v7.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v7 = v7.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v7.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 50
top = top - 30
right = right + 30
bot = bot + 30
v8 = full.trim(1613, 1676)
v8 = v8.crop(left + 40, top + 10, right + 40, bot + 10)
v8 = v8.deflickOverlapped(width = 10000, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = true).trim(0, -1) +\
     v8.trim(1, 0)
v8 = v8.deflickOverlapped(width = 100, step = 50, step_h = 100, radius = 1, toward_darkest = true, right2left = true)
v8 = v8.deflickOverlapped(width = 60, step = 30, step_h = 100, radius = 1, toward_darkest = true, right2left = true)
v8 = v8.deflickOverlapped(width = 40, step = 20, step_h = 100, radius = 1, toward_darkest = true, right2left = true)
v8 = v8.deflickOverlapped(width = 40, step = 20, step_h = 100, radius = 1, toward_darkest = true, right2left = true)
v8 = v8.deflickOverlapped(width = 20, step = 10, step_h = 100, radius = 1, toward_darkest = true, right2left = true)
v8 = v8.rotate(-3.3)
v8 = v8.crop(90, 54, -50, -50)
return v8.adjustBorders.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 50
top = top - 30
right = right + 30
bot = bot + 30
v9 = full.trim(1677, 1766)
v9 = v9.crop(left + 40, top + 10, right + 40, bot + 10)
v9 = v9.deflickOverlapped(width = 10000, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = false).trim(0, -1) +\
     v9.trim(1, 0)
v9 = v9.rotate(-4.)
v9 = v9.crop(64, 30, -54, -58)
#return v9.adjustBorders.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 50
top = top - 40
right = right + 30
bot = bot + 30
v10 = full.trim(1767, 1868)
v10 = v10.crop(left + 40, top + 10, right + 40, bot + 10)
v10 = v10.deflickOverlapped(width = 10000, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = false).trim(0, -1) +\
      v10.trim(1, 0)
v10 = v10.rotate(-3.)
v10 = v10.crop(50, 20, -40, -58)
#return v10.adjustBorders.prefetch

function crop_n_size(clip c, int l, int t, int r, int b, int w, int h)
{
    c = c.crop(l, t, r, b)
    c = c.gaussResize(w, h)
    return c
}
left = lo
right = ro
top = to
bot = bo
left = left - 50
top = top - 40
right = right + 30
bot = bot + 30
v11 = full.trim(1869, 2075)
v11 = v11.crop(left + 40, top + 10, right + 40, bot + 10)
v11 = v11.deflickOverlapped(width = 10000, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = false).trim(0, -1) +\
      v11.trim(1, 0)
v11 = v11.rotate(-2.)
#182, 196
#v11 = v11.crop(62, 40, -60, -60)
v11r = v11.crop(32, 0, -32, -60)
tw = v11r.width
th = v11r.height
v11 = v11.animate(182, 196, "crop_n_size", 62, 40, -60, -60, tw, th,\
                                           32,  0, -32, -60, tw, th)
#return v11
#return v11.adjustBorders.prefetch

v12 = full.trim(2076, 2192)
v12 = v12.crop(left + 40, top + 10, right + 40, bot + 10)
v12 = v12.deflickOverlapped(width = 10000, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = false).trim(0, -1) +\
      v12.trim(1, 0)
#return v12.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 30
top = top - 28
right = right + 10
bot = bot + 0
v13 = full.trim(2194, 2310)
v13 = v13.crop(left + 40, top + 10, right + 40, bot + 10)
v13 = v13.rotate(-3.)
#return v13.adjustBorders.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 50
top = top - 60
right = right + 30
bot = bot + 30
v14 = full.trim(2313, 2535)
v14 = v14.crop(left + 40, top + 10, right + 40, bot + 10)
v14 = v14.rotate(-2.)
v14 = v14.crop(72, 60, -36, -50)
#return v14.adjustBorders.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 40
top = top - 20
right = right + 10
bot = bot + 30
v15 = full.trim(2536, 2587)
v15 = v15.crop(left + 40, top + 10, right + 40, bot + 10)
v15 = v15.rotate(-6.)
v15 = v15.crop(114, 40, -20, -70)
#return v15.adjustBorders.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 40
top = top - 30
right = right + 30
bot = bot + 30
v16 = full.trim(2588, 2888)
v16 = v16.crop(left + 40, top + 10, right + 40, bot + 10)
v16 = v16.deflickOverlapped(width = 10000, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v16.trim(1, 0)
v16 = v16.rotate(-3.)
v16 = v16.crop(138, 50, -50, -94)
return v16.AdjustBorders.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 30
top = top - 8
right = right + 10
bot = bot + 20
v17 = full.trim(2889, 3414)
v17 = v17.crop(left + 40, top + 10, right + 40, bot + 10)
v17 = v17.deflickOverlapped(width = 10000, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v17.trim(1, 0)
v17 = v17.rotate(-4.)
#v17 = v17.crop(36, 0, -40, -72)
#return v17.adjustBorders.prefetch

v18 = full.trim(3415, 3521)
v18 = v18.crop(left + 40, top + 10, right + 40, bot + 10)
v18 = v18.deflickOverlapped(width = 10000, step = 200, radius = 1, toward_darkest = true, right2left = false).trim(0, -1) +\
      v18.trim(1, 0)
#return v18.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 40
top = top - 14
right = right + 20
bot = bot + 30
v19 = full.trim(3522, 3723)
v19 = v19.crop(left + 50, top + 20, right + 50, bot + 20).trim(0, 198) +\
      v19.crop(left + 50, top - 80, right + 50, bot - 80).trim(199, 199) +\
      v19.crop(left + 50, top + 20, right + 50, bot + 20).trim(200, 0)
v19 = v19.deflickOverlapped(width = 10000, step = 200, step_h = 200, radius = 7, toward_darkest = true, right2left = true).trim(0, -1) +\
      v19.trim(1, 0) 
v19 = v19.rotate(-3.)
v19 = v19.crop(36, 0, -40, -56)
#return v19.adjustBorders.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 30
top = top - 28
right = right + 10
bot = bot + 0
v20 = full.trim(3726, 3832)
v20 = v20.crop(left + 50, top + 60, right + 50, bot + 60).trim(0, 2) +\
      v20.crop(left + 50, top + 10, right + 50, bot + 10).trim(3, 3) +\
      v20.crop(left + 50, top + 60, right + 50, bot + 60).trim(4, 0)
v20 = v20.deflickOverlapped(width = 9000, step = 300, radius = 5, toward_darkest = true, right2left = true).trim(0, 6) +\
      v20.deflickOverlapped(width = 900, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(7, 16) +\
      v20.deflickOverlapped(width = 9000, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(17, 24) +\
      v20.deflickOverlapped(width = 900, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(25, 0)
v20 = v20.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v20 = v20.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v20 = v20.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v20 = v20.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v20 = v20.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v20 = v20.rotate(-3.)
#v20 = v20.crop(30, 0, -32, -62)
#return v20.adjustBorders.prefetch

v21 = full.trim(3833, 3986)
v21 = v21.crop(left + 50, top + 60, right + 50, bot + 60)
v21 = v21.deflickOverlapped(width = 9000, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(0, -1) +\
      v21.deflickOverlapped(width = 900, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(1, 3) +\
      v21.deflickOverlapped(width = 600, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(4, 0)
v21 = v21.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v21 = v21.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v21 = v21.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v21 = v21.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v21 = v21.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v21.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 40
top = top - 30
right = right + 20
bot = bot + 30
v22 = full.trim(3987, 4059)
v22 = v22.crop(left + 50, top + 60, right + 50, bot + 60)
v22 = v22.deflickOverlapped(width = 9000, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(0, 10) +\
      v22.deflickOverlapped(width = 600, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(11, 0)
v22 = v22.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v22 = v22.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v22 = v22.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v22 = v22.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v22 = v22.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v22 = v22.rotate(-3.)
v22 = v22.crop(30, 0, -40, -68)
#return v22.adjustBorders.prefetch

v23 = full.trim(4060, 4181)
v23 = v23.crop(left + 50, top + 60, right + 50, bot + 60)
v23 = v23.deflickOverlapped(width = 9000, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(0, 5) +\
      v23.deflickOverlapped(width = 600, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(6, 0)
v23 = v23.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v23 = v23.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v23 = v23.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v23 = v23.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v23 = v23.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v23.prefetch

v24 = full.trim(4182, 4229)
v24 = v24.crop(left + 50, top + 60, right + 50, bot + 60)
v24 = v24.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v24 = v24.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v24 = v24.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v24 = v24.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v24 = v24.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v24.prefetch

v25 = full.trim(4230, 4296)
v25 = v25.crop(left + 50, top + 40, right + 50, bot + 40)
v25 = v25.deflickOverlapped(width = 9000, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(0, 5) +\
      v25.deflickOverlapped(width = 600, step = 300, radius = 7, toward_darkest = true, right2left = true).trim(6, 0)
v25 = v25.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v25 = v25.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v25 = v25.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v25 = v25.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v25 = v25.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v25.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 40
top = top - 20
right = right + 20
bot = bot + 30
v26 = full.trim(4298, 4458)
v26 = v26.crop(left + 50, top + 40, right + 50, bot + 40)
v26 = v26.deflickOverlapped(width = 600, step = 300, radius = 7, toward_darkest = true, right2left = true)
v26 = v26.deflickOverlapped(width = 600, step = 300, step_h = 300, radius = 1, toward_darkest = true, right2left = true)
v26 = v26.deflickOverlapped(width = 400, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v26 = v26.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v26 = v26.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v26 = v26.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v26 = v26.rotate(-4.)
v26 = v26.crop(44, 0, -40, -68)
return v26.adjustBorders.prefetch

v27 = full.trim(4459, 4533)
v27 = v27.crop(left + 50, top + 40, right + 50, bot + 40)
v27 = v27.deflickOverlapped(width = 6000, step = 300, radius = 5, toward_darkest = true, right2left = false).trim(0, -1) +\
      v27.deflickOverlapped(width = 600, step = 300, radius = 5, toward_darkest = true, right2left = false).trim(1, 4) +\
      v27.deflickOverlapped(width = 900, step = 300, radius = 5, toward_darkest = true, right2left = false).trim(5, 0)
v27 = v27.deflickOverlapped(width = 400, height = 1000, step = 200, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v27 = v27.deflickOverlapped(width = 200, height = 1000, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v27 = v27.deflickOverlapped(width = 100, height = 1000, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v27 = v27.deflickOverlapped(width = 60, height = 1000, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v27.prefetch

left = lo
right = ro
top = to
bot = bo
left = left - 40
top = top
right = right + 20
bot = bot + 30
v28 = full.trim(4534, 4585)
v28 = v28.crop(left + 50, top + 40, right + 50, bot + 40)
v28 = v28.deflickOverlapped(width = 6000, step = 300, radius = 5, toward_darkest = true, right2left = true).trim(0, -1) +\
      v28.deflickOverlapped(width = 600, step = 200, radius = 5, toward_darkest = true, right2left = false).trim(1, 0)
v28 = v28.rotate(-5.)
v28 = v28.crop(60, 0, -20, -44)
#return v28.adjustBorders.prefetch

v29 = full.trim(4586, 4850)
v29 = v29.crop(left + 50, top + 60, right + 50, bot + 60).trim(0, 80) +\
      v29.crop(left + 50, top + 40, right + 50, bot + 40).trim(81, 152) +\
      v29.crop(left + 50, top + 20, right + 50, bot + 20).trim(153, 0)
#v29_o = v29
v29 = v29.deflickOverlapped(width = 6000, step = 300, radius = 5, toward_darkest = true, right2left = true).trim(0, -1) +\
      v29.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = false).trim(1, 49) +\
      v29.trim(50, 52) +\
      v29.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = false).trim(53, 98) +\
      v29.trim(99, 144) +\
      v29.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = false).trim(145, 157) +\
      v29.trim(158, 160) +\
      v29.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = false).trim(161, 178) +\
      v29.trim(179, 192) +\
      v29.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = false).trim(193, 227) +\
      v29.trim(228, 229) +\
      v29.deflickOverlapped(width = 400, step = 200, radius = 5, toward_darkest = true, right2left = false).trim(230, 0)
#v29 = v29_o.interleave(v29)
#return v29.prefetch

v30 = full.trim(4851, 4920)
v30 = v30.crop(left + 50, top + 20, right + 50, bot + 20)
v30 = v30.deflickOverlapped(width = 6000, step = 300, radius = 6, toward_darkest = true, right2left = true).trim(0, -1) +\
      v30.deflickOverlapped(width = 1200, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v30 = v30.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v30 = v30.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v30 = v30.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v30.prefetch

v31 = full.trim(4921, 5081)
v31 = v31.crop(left + 50, top + 20, right + 50, bot + 20)
v31 = v31.deflickOverlapped(width = 6000, step = 300, radius = 6, toward_darkest = true, right2left = true).trim(0, -1) +\
      v31.deflickOverlapped(width = 600, step = 200, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v31 = v31.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v31 = v31.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v31 = v31.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v31.prefetch
*/
v32 = full.trim(5082, 5151)
v32 = v32.crop(left + 50, top + 20, right + 50, bot + 20)
v32 = v32.deflickOverlapped(width = 6000, step = 300, radius = 6, toward_darkest = true, right2left = true).trim(0, -1) +\
      v32.deflickOverlapped(width = 600, step = 200, step_h = 400, radius = 6, toward_darkest = true, right2left = true).trim(1, 0)
v32 = v32.deflickOverlapped(width = 200, step = 100, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v32 = v32.deflickOverlapped(width = 100, step = 50, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
v32 = v32.deflickOverlapped(width = 60, step = 30, step_h = 200, radius = 1, toward_darkest = true, right2left = true)
#return v32.prefetch
/*
#return v1.adjustBorders.prefetch
#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#v2 = v2.AdjustColor(ou = +12, ov = -4, x=1000, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
#return v1.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=500, border_r=100).histogram("levels").prefetch
#return src.adjustBorders.info.prefetch

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30
*/
global filter16 = true

import("..\common.avs")

/*

#******

# 1

v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
#b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
#v1_0 = v1.AdjustColor(ou = +12, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true,\
#                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v1 = v1.AdjustColor(ou = +12, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v1 = v1_0.interleave(v1)
v1 = v1.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate

v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
#v2_0 = v2.AdjustColor(ou = +15, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true, scale = 2,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v2 = v2.AdjustColor(ou = +15, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true, scale = 2, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v2 = v2_0.interleave(v2)
v2 = v2.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate

v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
#v3_0 = v3.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.1, gam_mac=true,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v3 = v3.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.1, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v3 = v3_0.interleave(v3)
v3 = v3.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate

v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
#v4_0 = v4.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v4 = v4.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.3, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v4 = v4_0.interleave(v4)
v4 = v4.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.1)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate

v5 = LSMASHVideoSource(dst_dir + "v5f.mp4").ConvertToYV24()
v5 = v5.colorYUV(off_y = -16)
#v5_0 = v5.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.5, gam_mac=true,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v5 = v5.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.5, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v5 = v5_0.interleave(v5)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
v5 = v5.add_blank_audio
return v5.prefetch
#adjustframerate

v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
v6 = v6.colorYUV(off_y = -16)
v6 = v6.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.5, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v6 = v6.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate

v7 = LSMASHVideoSource(dst_dir + "v7f.mp4").ConvertToYV24()
v7 = v7.colorYUV(off_y = -16)
#v7_0 = v7.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.5, gam_mac=true,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v7 = v7.AdjustColor(ou = +15, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.4, lock_chan=0, sat=1.5, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v7 = v7_0.interleave(v7)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
v7 = v7.add_blank_audio
return v7.prefetch
#adjustframerate

v8 = LSMASHVideoSource(dst_dir + "v8f.mp4").ConvertToYV24()
v8 = v8.AdjustColor(ou = +15, ov = -12, x=50, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v8 = v8.colorYUV(off_u = -2, off_v = +2)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
v8 = v8.add_blank_audio
return v8.prefetch
#adjustframerate

v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v9 = v9.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v9 = v9.colorYUV(off_u = +4, off_v = +2)
v9 = v9.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate

v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
v10 = v10.AdjustColor(ou = +10, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v10 = v10.colorYUV(off_u = +4, off_v = +2)
v10 = v10.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate

v11 = LSMASHVideoSource(dst_dir + "v11f.mp4").ConvertToYV24()
v11 = v11.colorYUV(off_y = -20)
v11 = v11.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v11 = v11.colorYUV(off_u = +6, off_v = +0)
v11 = v11.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
v11 = v11.add_blank_audio
return v11.prefetch
#adjustframerate

v12 = LSMASHVideoSource(dst_dir + "v12f.mp4").ConvertToYV24()
v12 = v12.colorYUV(off_y = -20)
v12 = v12.AdjustColor(ou = +12, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v12 = v12.colorYUV(off_u = +6, off_v = +0)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
v12 = v12.add_blank_audio
return v12.prefetch
#adjustframerate

v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
v13 = v13.colorYUV(off_y = -20)
v13 = v13.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v13 = v13.colorYUV(off_u = +4, off_v = -2)
v13 = v13.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate

v14 = LSMASHVideoSource(dst_dir + "v14f.mp4").ConvertToYV24()
v14 = v14.colorYUV(off_y = -20)
v14 = v14.AdjustColor(ou = +14, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v14 = v14.colorYUV(off_u = +4, off_v = -2)
v14 = v14.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v14 = v14.adjustSize
v14 = v14.assumeFPS(18)
v14 = v14.add_blank_audio
return v14.prefetch
#adjustframerate

v15 = LSMASHVideoSource(dst_dir + "v15f.mp4").ConvertToYV24()
v15 = v15.colorYUV(off_y = -10)
v15 = v15.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v15 = v15.colorYUV(off_u = +4, off_v = 2)
v15 = v15.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
v15 = v15.add_blank_audio
return v15.prefetch
#adjustframerate

v16 = LSMASHVideoSource(dst_dir + "v16f.mp4").ConvertToYV24()
v16 = v16.colorYUV(off_y = -20)
v16 = v16.AdjustColor(ou = +16, ov = -12, x=200, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v16 = v16.colorYUV(off_u = +4, off_v = -4)
v16 = v16.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
v16 = v16.add_blank_audio
return v16.prefetch
#adjustframerate

v17 = LSMASHVideoSource(dst_dir + "v17f.mp4").ConvertToYV24()
v17 = v17.colorYUV(off_y = -20)
v17 = v17.AdjustColor(ou = +14, ov = -10, x=200, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v17 = v17.colorYUV(off_u = +4, off_v = -4)
v17 = v17.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
#v17 = v17.rotate(angle=-5)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
v17 = v17.add_blank_audio
return v17.prefetch
#adjustframerate

v18 = LSMASHVideoSource(dst_dir + "v18f.mp4").ConvertToYV24()
v18 = v18.colorYUV(off_y = -24)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v18 = v18.AdjustColor(ou = +14, ov = -10, x=200, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v18 = v18.colorYUV(off_u = +4, off_v = -4)
v18 = v18.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
v18 = v18.add_blank_audio
return v18.prefetch
#adjustframerate

v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
v19 = v19.colorYUV(off_y = -20)
v19 = v19.AdjustColor(ou = +14, ov = -10, x=200, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v19 = v19.colorYUV(off_u = +4, off_v = -4)
v19 = v19.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate

v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
v20 = v20.colorYUV(off_y = -16)
v20 = v20.AdjustColor(ou = +14, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v20 = v20.colorYUV(off_u = +4, off_v = -4)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate

v21 = LSMASHVideoSource(dst_dir + "v21f.mp4").ConvertToYV24()
v21 = v21.trim(0, 7) +\
      v21.colorYUV(off_y = -4).trim(8, 40) +\
      v21.colorYUV(off_y = -16).trim(41, 60) +\
      v21.colorYUV(off_y = -12).trim(61, 69) +\
      v21.colorYUV(off_y = -20).trim(70, 100) +\
      v21.colorYUV(off_y = -24).trim(101, 0)
v21 = v21.AdjustColor(ou = +14, ov = -10, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v21 = v21.colorYUV(off_u = +4, off_v = -4)
v21 = v21.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
v21 = v21.add_blank_audio
return v21.prefetch
#adjustframerate

v22 = LSMASHVideoSource(dst_dir + "v22f.mp4").ConvertToYV24()
v22 = v22.colorYUV(off_y = -4).trim(0, 5) +\
      v22.colorYUV(off_y = -10).trim(6, 27) +\
      v22.colorYUV(off_y = -6).trim(28, 37) +\
      v22.colorYUV(off_y = -14).trim(38, 0)
v22 = v22.AdjustColor(ou = +14, ov = -10, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v22 = v22.colorYUV(off_u = +6, off_v = -4)
v22 = v22.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
v22 = v22.add_blank_audio
return v22.prefetch
#adjustframerate

v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
v23 = v23.colorYUV(off_y = -10).trim(0, 5) +\
      v23.colorYUV(off_y = -20).trim(6, 0)
v23 = v23.AdjustColor(ou = +14, ov = -10, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v23 = v23.colorYUV(off_u = +6, off_v = -4)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate

v24 = LSMASHVideoSource(dst_dir + "v24f.mp4").ConvertToYV24()
v24 = v24.trim(0, 6) +\
      v24.colorYUV(off_y = -10).trim(7, 0)
v24 = v24.AdjustColor(ou = +14, ov = -10, x=200, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.4, lock_chan=1, sat=1.7, gam_mac=true)
v24 = v24.colorYUV(off_u = +4, off_v = -4)
v24 = v24.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.9)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
v24 = v24.add_blank_audio
return v24.prefetch
#adjustframerate

v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
v25 = v25.colorYUV(off_y = -12).trim(0, 1) +\
      v25.colorYUV(off_y = -16).trim(2, 3) +\
      v25.colorYUV(off_y = -20).trim(4, 22) +\
      v25.colorYUV(off_y = -19).trim(23, 25) +\
      v25.colorYUV(off_y = -18).trim(26, 36) +\
      v25.colorYUV(off_y = -16).trim(37, 0)
v25 = v25.AdjustColor(ou = +14, ov = -10, x=200, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v25 = v25.colorYUV(off_u = +4, off_v = -4)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate

v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
#v26 = v26.trim(0, 48) +\
#      v26.colorYUV(off_y = -10).trim(49, 65) +\
#      v26.trim(66, 0)
v26 = v26.AdjustColor(ou = +14, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate

v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v27 = v27.AdjustColor(ou = +14, ov = -4, x=200, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.4, lock_chan=0, sat=1.7, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v27 = v27.colorYUV(off_u = +6, off_v = -6)
v27 = v27.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.5)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate

v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
v28 = v28.AdjustColor(ou = +8, ov = -4, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v28 = v28.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.7)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate

v29 = LSMASHVideoSource(dst_dir + "v29f.mp4").ConvertToYV24()
v29 = v29.colorYUV(off_y = -8).trim(0, 3) +\
      v29.colorYUV(off_y = -16).trim(4, 57) +\
      v29.colorYUV(off_y = -20).trim(58, 94) +\
      v29.colorYUV(off_y = -16).trim(95, 0)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v29 = v29.AdjustColor(ou = +12, ov = -8, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v29 = v29.colorYUV(off_u = +4, off_v = -4)
v29 = v29.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
v29 = v29.add_blank_audio
return v29.prefetch
#adjustframerate

v30 = LSMASHVideoSource(dst_dir + "v30f.mp4").ConvertToYV24()
v30 = v30.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v30 = v30.colorYUV(off_u = +4, off_v = -4)
v30 = v30.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.3)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
v30 = v30.add_blank_audio
return v30.prefetch
#adjustframerate

v31 = LSMASHVideoSource(dst_dir + "v31f.mp4").ConvertToYV24()
v31 = v31.colorYUV(off_y = -6).trim(0, -1) +\
      v31.colorYUV(off_y = -8).trim(1, 6) +\
      v31.colorYUV(off_y = -10).trim(7, 9) +\
      v31.colorYUV(off_y = -12).trim(10, 12) +\
      v31.colorYUV(off_y = -13).trim(13, 16) +\
      v31.colorYUV(off_y = -10, cont_y = -5).trim(17, 29) +\
      v31.colorYUV(off_y = -12, cont_y = -2).trim(30, 31) +\
      v31.colorYUV(off_y = -13).trim(32, -1) +\
      v31.colorYUV(off_y = -12).trim(33, -1) +\
      v31.colorYUV(off_y = -11).trim(34, 44) +\
      v31.colorYUV(off_y = -8).trim(45, 94) +\
      v31.colorYUV(off_y = -10).trim(95, 96) +\
      v31.colorYUV(off_y = -12).trim(97, 99) +\
      v31.colorYUV(off_y = -14).trim(100, 101) +\
      v31.colorYUV(off_y = -16).trim(102, 136) +\
      v31.colorYUV(off_y = -14).trim(137, 154) +\
      v31.colorYUV(off_y = -12).trim(155, 157) +\
      v31.colorYUV(off_y = -8, cont_y = -4).trim(158, 0)
b_ex = "z x > z y > & z x - x 2. / > & z y - y 2. / > & x y + 2. / z ?"
v31 = v31.AdjustColor(ou = +12, ov = -8, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true, b_expr = b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
v31 = v31.add_blank_audio
return v31.prefetch
#adjustframerate

v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
v32 = v32.AdjustColor(ou = +12, ov = -8, x=300, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate

#******

*/
