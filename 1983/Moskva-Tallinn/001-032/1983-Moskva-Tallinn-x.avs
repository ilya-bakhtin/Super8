SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

#LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

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

v1 = full.trim(0, 371)
v1_0 = v1.trim(0, -1)
v1_0 = v1_0.crop(0, 710, 0, -70).stackVertical(v1_0.crop(0, 20, 0, -v1_0.height + 800))
v1_19 = v1.trim(19, -1)
v1_19 = v1_19.crop(0, 720, 0, -60).stackVertical(v1_19.crop(0, 20, 0, -v1_19.height + 800))
v1 = v1_0 + v1.trim(1, 18) + v1_19 + v1.trim(20, 0)

#v1 = v1.animate(13, 16, "crop", left - 30, top + 40, right - 30, bot + 40, left - 10, top - 20, right - 10, bot - 20).trim(13, 18)
v1 = v1.animate(13, 16, "crop", left - 30, top + 40, right - 30, bot + 40, left - 10, top + 40, right - 10, bot + 40)
#v1 = v1.trim(13, 18)
#v1 = v1.animate(33, 39, "crop", left + 20, top + 30, right + 20, bot + 30, left + 20, top + 0, right + 20, bot + 0).trim(33, 44)
/*
     v1.crop(left - 56, top - 40, right - 56, bot - 40).trim(0, -1) +\
     v1.crop(left - 56, top + 10, right - 56, bot + 10).trim(1, 5) +\
     v1.crop(left - 50, top - 10, right - 50, bot - 10).trim(6, 6) +\
     v1.crop(left - 50, top - 20, right - 50, bot - 20).trim(7, 7) +\
     v1.crop(left - 50, top - 30, right - 50, bot - 30).trim(8, 9) +\
     v1.crop(left - 46, top - 26, right - 46, bot - 26).trim(10, 10) +\
     v1.crop(left - 40, top - 16, right - 40, bot - 16).trim(11, 11) +\
     v1.crop(left - 30, top + 40, right - 30, bot + 40).trim(12, 12) +\
     v1.animate(13, 16, "crop", left - 30, top + 40, right - 30, bot + 40, left - 10, top - 20, right - 10, bot - 20).trim(13, 18) #+\
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
*/
return v1