SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("MaskUpdate", MT_SERIALIZED)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("M:\Media\video\Super8\1983-1984\8mm - 1.Res2K43.Aspect43In43.Speed18Fps.mov")
assumefps(18)

full = last

crop(56, 94, -100, -98)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 147, 344, 584,  709, 1184, 1454, 1570, 1696, 1772, 2070, 2257, 2407, 2590, 2689, 2784, 2873, 2949, 3043, 3116, 3291, #20
# 3585, 3804, 4228, 4466, 4519, 4592, 4840, 4907, 4933, 5017, 5086, 5285, 5336, 5384, 5393, 5443, 5456, 5515, 5527, 5558, #40
# 5660, 5687, 5815, 5971, 6478, 6515, 7060, 7183, 7606, 8084, 8578, 8873, 9125, 9403, 9670, 10182, 10248, 10398, 10517, 10926, #60
# 11059, 11229, 11594, 11914, 12125, 12301, 12433, 12626, 12732, 12914, 13334, 13880, 14001, 14228, 14330, 14613, 14703, #77
# 15028, 15340, 15376, 15564, 15763, 16077, 16249, 16468, 16782 #86

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
return full

left = 56
top = 94
right = -100
bot = -98

v65 = full.trim(11914, 12124)
v65 = v65.crop(left + 10, top - 20, right + 10, bot - 20)

v66 = full.trim(12125, 12300)
v66 = v66.crop(left + 10, top - 10, right + 10, bot - 10)

v67 = full.trim(12301, 12432)
v67 = v67.animate(0, 5, "crop", left - 10, top - 0, right - 10, bot - 0, left + 10, top - 0, right + 10, bot - 0).trim(0, 9) +\
      v67.animate(10, 21, "crop", left + 16, top - 0, right + 16, bot - 0, left + 40, top - 0, right + 40, bot - 0).trim(10, 24) +\
      v67.animate(25, 31, "crop", left + 40, top - 0, right + 40, bot - 0, left + 16, top - 0, right + 16, bot - 0).trim(25, 32) +\
      v67.animate(33, 41, "crop", left + 16, top - 0, right + 16, bot - 0, left + 30, top - 0, right + 30, bot - 0).trim(33, 75) +\
      v67.crop(left + 40, top - 0, right + 40, bot - 0).trim(76, 0)

v68 = full.trim(12433, 12625)
v68 = v68.crop(left + 40, top - 0, right + 40, bot - 0)

v69 = full.trim(12626, 12731)
v69 = v69.crop(left + 20, top - 0, right + 20, bot - 0)

v70 = full.trim(12732, 12913)
v70 = v70.crop(left + 20, top - 10, right + 20, bot - 10)

v71 = full.trim(12914, 13333)
v71 = v71.crop(0, top - 10, 0, bot - 10).trim(0, 9) +\
      v71.crop(0, top - 0, 0, bot - 0).trim(10, 10) +\
      v71.crop(0, top + 10, 0, bot + 10).trim(11, 11) +\
      v71.crop(0, top - 0, 0, bot - 0).trim(12, 14) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(15, 16) +\
      v71.crop(0, top - 0, 0, bot - 0).trim(17, 20) +\
      v71.crop(0, top + 10, 0, bot + 10).trim(21, 21) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(22, 22) +\
      v71.crop(0, top + 10, 0, bot + 10).trim(23, 29) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(30, 30) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(31, 33) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(34, 36) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(37, 38) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(39, 40) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(41, 41) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(42, 59) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(60, 60) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(61, 61) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(62, 62) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(63, 63) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(64, 64) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(65, 71) +\
      v71.crop(0, top + 10, 0, bot + 10).trim(72, 72) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(73, 74) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(75, 77) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(78, 79) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(80, 81) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(82, 82) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(83, 83) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(84, 85) +\
      v71.crop(0, top - 20, 0, bot - 20).trim(86, 86) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(87, 108) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(109, 111) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(112, 113) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(114, 114) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(115, 148) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(149, 149) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(150, 150) +\
      v71.crop(0, top + 10, 0, bot + 10).trim(151, 151) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(152, 153) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(154, 159) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(160, 176) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(177, 179) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(180, 219) +\
      v71.crop(0, top + 10, 0, bot + 10).trim(220, 221) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(222, 222) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(223, 227) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(228, 230) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(231, 265) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(266, 266) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(267, 323) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(324, 325) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(326, 334) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(335, 336) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(337, 339) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(340, 340) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(341, 342) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(343, 343) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(344, 364) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(365, 365) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(366, 368) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(369, 369) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(370, 375) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(376, 376) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(377, 405) +\
      v71.crop(0, top - 10, 0, bot - 10).trim(406, 407) +\
      v71.crop(0, top + 0, 0, bot + 0).trim(408, 0)

v71 = v71.crop(left + 20, 0, right + 20, 0).trim(0, 10) +\
      v71.animate(14, 17, "crop", left + 30, 0, right + 30, 0, left + 20, 0, right + 20, 0).trim(11, 119) +\
      v71.animate(120, 131, "crop", left + 20, 0, right + 20, 0, left + 40, 0, right + 40, 0).trim(120, 138) +\
      v71.animate(139, 144, "crop", left + 40, 0, right + 40, 0, left + 20, 0, right + 20, 0).trim(139, 151) +\
      v71.animate(152, 156, "crop", left + 20, 0, right + 20, 0, left + 10, 0, right + 10, 0).trim(152, 155) +\
      v71.animate(156, 160, "crop", left + 10, 0, right + 10, 0, left + 20, 0, right + 20, 0).trim(156, 192) +\
      v71.animate(193, 205, "crop", left + 20, 0, right + 20, 0, left + 30, 0, right + 30, 0).trim(193, 225) +\
      v71.animate(226, 229, "crop", left + 30, 0, right + 30, 0, left + 20, 0, right + 20, 0).trim(226, 228) +\
      v71.animate(229, 248, "crop", left + 20, 0, right + 20, 0, left + 40, 0, right + 40, 0).trim(229, 276) +\
      v71.animate(277, 281, "crop", left + 40, 0, right + 40, 0, left + 30, 0, right + 30, 0).trim(277, 325) +\
      v71.animate(326, 335, "crop", left + 30, 0, right + 30, 0, left + 40, 0, right + 40, 0).trim(326, 346) +\
      v71.animate(347, 353, "crop", left + 40, 0, right + 40, 0, left + 10, 0, right + 10, 0).trim(347, 353) +\
      v71.animate(354, 356, "crop", left + 10, 0, right + 10, 0, left + 20, 0, right + 20, 0).trim(354, 355) +\
      v71.animate(356, 358, "crop", left + 20, 0, right + 20, 0, left + 10, 0, right + 10, 0).trim(356, 360) +\
      v71.animate(361, 363, "crop", left + 10, 0, right + 10, 0, left + 30, 0, right + 30, 0).trim(361, 378) +\
      v71.animate(379, 383, "crop", left + 30, 0, right + 30, 0, left + 10, 0, right + 10, 0).trim(379, 382) +\
      v71.animate(383, 389, "crop", left + 10, 0, right + 10, 0, left + 30, 0, right + 30, 0).trim(383, 404) +\
      v71.animate(405, 408, "crop", left + 30, 0, right + 30, 0, left + 10, 0, right + 10, 0).trim(405, 408) +\
      v71.animate(408, 415, "crop", left + 10, 0, right + 10, 0, left + 40, 0, right + 40, 0).trim(409, 0)

v72 = full.trim(13334, 13879)
v72 = v72.animate(0, 28, "crop", left + 20, top - 10, right + 20, bot - 10, left + 40, top - 10, right + 40, bot - 10).trim(0, 506) +\
      v72.animate(507, 510, "crop", left + 40, top - 10, right + 40, bot - 10, left + 20, top - 10, right + 20, bot - 10).trim(507, 0)

v73 = full.trim(13880, 14000)
v73 = v73.crop(left + 30, top - 10, right + 30, bot - 10).trim(0, -1) +\
      v73.crop(left + 20, top - 10, right + 20, bot - 10).trim(1, 1) +\
      v73.crop(left + 30, top - 20, right + 30, bot - 20).trim(2, 2) +\
      v73.crop(left + 30, top - 40, right + 30, bot - 40).trim(3, 3) +\
      v73.crop(left + 30, top - 30, right + 30, bot - 30).trim(4, 4) +\
      v73.crop(left + 30, top - 20, right + 30, bot - 20).trim(5, 6) +\
      v73.crop(left + 30, top - 30, right + 30, bot - 30).trim(7, 7) +\
      v73.crop(left + 30, top - 20, right + 30, bot - 20).trim(8, 9) +\
      v73.crop(left + 30, top - 30, right + 30, bot - 30).trim(10, 10) +\
      v73.crop(left + 20, top - 20, right + 20, bot - 20).trim(11, 12) +\
      v73.crop(left + 30, top - 10, right + 30, bot - 10).trim(13, 13) +\
      v73.crop(left + 30, top - 20, right + 30, bot - 20).trim(14, 15) +\
      v73.crop(left + 30, top - 10, right + 30, bot - 10).trim(16, 18) +\
      v73.crop(left + 30, top - 0, right + 30, bot - 0).trim(19, 19) +\
      v73.crop(left + 30, top - 10, right + 30, bot - 10).trim(20, 20) +\
      v73.crop(left + 20, top - 0, right + 20, bot - 0).trim(21, 46) +\
      v73.animate(60, 63, "crop", left + 30, top - 0, right + 30, bot - 0, left + 10, top - 0, right + 10, bot - 0).trim(47, 74) +\
      v73.animate(75, 88, "crop", left + 10, top - 0, right + 10, bot - 0, left + 30, top - 20, right + 30, bot - 20).trim(75, 98) +\
      v73.crop(left + 20, top - 20, right + 20, bot - 20).trim(99, 99) +\
      v73.crop(left + 30, top - 20, right + 30, bot - 20).trim(100, 101) +\
      v73.crop(left + 20, top - 20, right + 20, bot - 20).trim(102, 106) +\
      v73.crop(left + 20, top - 10, right + 20, bot - 10).trim(107, 107) +\
      v73.crop(left + 10, top - 20, right + 10, bot - 20).trim(108, 108) +\
      v73.crop(left + 20, top - 10, right + 20, bot - 10).trim(109, 110) +\
      v73.animate(113, 120, "crop", left + 20, top - 10, right + 20, bot - 10, left + 70, top - 10, right + 70, bot - 10).trim(111, 113) +\
      v73.crop(left + 50, top - 10, right + 50, bot - 10).trim(114, 114) +\
      v73.crop(left + 54, top - 10, right + 54, bot - 10).trim(115, 115) +\
      v73.animate(113, 120, "crop", left + 20, top - 10, right + 20, bot - 10, left + 70, top - 10, right + 70, bot - 10).trim(116, 116) +\
      v73.animate(113, 120, "crop", left + 20, top + 10, right + 20, bot + 10, left + 70, top + 10, right + 70, bot + 10).trim(117, 117) +\
      v73.animate(113, 120, "crop", left + 20, top - 10, right + 20, bot - 10, left + 70, top - 10, right + 70, bot - 10).trim(118, 118) +\
      v73.animate(113, 120, "crop", left + 20, top + 10, right + 20, bot + 10, left + 70, top + 10, right + 70, bot + 10).trim(119, 0)

v74 = full.trim(14001, 14227)
v74 = v74.animate(2, 4, "crop", left + 30, top - 10, right + 30, bot - 10, left + 10, top - 10, right + 10, bot - 10).trim(0, 3) +\
      v74.animate(4, 7, "crop", left + 10, top - 10, right + 10, bot - 10, left + 30, top - 10, right + 30, bot - 10).trim(4, 12) +\
      v74.animate(13, 16, "crop", left + 30, top - 10, right + 30, bot - 10, left + 10, top - 10, right + 10, bot - 10).trim(13, 16) +\
      v74.animate(17, 20, "crop", left + 10, top - 10, right + 10, bot - 10, left + 30, top - 10, right + 30, bot - 10).trim(17, 99) +\
      v74.animate(100, 108, "crop", left + 30, top - 10, right + 30, bot - 10, left + 0, top - 10, right + 0, bot - 10).trim(100, 108) +\
      v74.animate(109, 115, "crop", left + 0, top - 10, right + 0, bot - 10, left + 30, top - 10, right + 30, bot - 10).trim(109, 137) +\
      v74.animate(138, 142, "crop", left + 30, top - 10, right + 30, bot - 10, left + 0, top - 10, right + 0, bot - 10).trim(138, 142) +\
      v74.animate(143, 148, "crop", left + 0, top - 10, right + 0, bot - 10, left + 30, top - 10, right + 30, bot - 10).trim(143, 0)

v75 = full.trim(14228, 14329)
v75 = v75.crop(left + 30, top - 10, right + 30, bot - 10).trim(0, 25) +\
      v75.animate(95, 101, "crop", left + 30, top - 0, right + 30, bot - 0, left + 60, top - 0, right + 60, bot - 0).trim(26, 0)

v76 = full.trim(14330, 14612)
v76 = v76.crop(left + 30, top - 10, right + 30, bot - 10).trim(0, 2) +\
      v76.crop(left + 30, top - 30, right + 30, bot - 30).trim(3, 3) +\
      v76.animate(128, 133, "crop", left + 30, top - 10, right + 30, bot - 10, left + 10, top - 10, right + 10, bot - 10).trim(4, 133) +\
      v76.animate(134, 142, "crop", left + 10, top - 10, right + 10, bot - 10, left + 30, top - 10, right + 30, bot - 10).trim(134, 263) +\
      v76.animate(264, 272, "crop", left + 30, top - 10, right + 30, bot - 10, left + 10, top - 10, right + 10, bot - 10).trim(264, 271) +\
      v76.animate(272, 274, "crop", left + 10, top - 10, right + 10, bot - 10, left + 30, top - 10, right + 30, bot - 10).trim(272, 278) +\
      v76.animate(272, 274, "crop", left + 10, top + 20, right + 10, bot + 20, left + 30, top + 20, right + 30, bot + 20).trim(279, 0)

v77 = full.trim(14613, 14702)
v77 = v77.crop(left + 10, top - 0, right + 10, bot - 0).trim(0, 13) +\
      v77.crop(left + 10, top + 10, right + 10, bot + 10).trim(14, 14) +\
      v77.crop(left + 10, top - 0, right + 10, bot - 0).trim(15, 17) +\
      v77.crop(left + 10, top + 10, right + 10, bot + 10).trim(18, 19) +\
      v77.crop(left + 10, top + 0, right + 10, bot + 0).trim(20, 20) +\
      v77.animate(22, 30, "crop", left + 10, top + 10, right + 10, bot + 10, left + 10, top + 20, right + 10, bot + 20).trim(21, 31) +\
      v77.crop(left + 10, top + 10, right + 10, bot + 10).trim(32, 33) +\
      v77.crop(left + 10, top + 20, right + 10, bot + 20).trim(34, 34) +\
      v77.crop(left + 10, top + 10, right + 10, bot + 10).trim(35, 35) +\
      v77.animate(36, 40, "crop", left + 10, top + 20, right + 10, bot + 20, left + 10, top - 10, right + 10, bot - 10).trim(36, 58) +\
      v77.animate(59, 63, "crop", left + 10, top - 10, right + 10, bot - 10, left + 10, top + 20, right + 10, bot + 20).trim(59, 70) +\
      v77.animate(71, 76, "crop", left + 10, top + 20, right + 10, bot + 20, left + 10, top - 10, right + 10, bot - 10).trim(71, 0)

v78 = full.trim(14703, 15027)
v78 = v78.crop(left + 10, top - 10, right - 4, bot - 20)

v79 = full.trim(15028, 15339)
v79 = v79.crop(left + 10, top - 10, right - 4, bot - 20)

v80 = full.trim(15340, 15375)
v80 = v80.crop(left + 10, top - 20, right + 10, bot - 20)

v81 = full.trim(15376, 15563)
v81 = v81.crop(left + 10, top - 20, right - 4, bot - 30).trim(0, 64) +\
      v81.crop(left + 10, top - 30, right - 4, bot - 40).trim(65, 65) +\
      v81.crop(left + 10, top - 20, right - 4, bot - 30).trim(66, 84) +\
      v81.crop(left + 10, top - 30, right - 4, bot - 40).trim(85, 86) +\
      v81.crop(left + 10, top - 20, right - 4, bot - 30).trim(87, 92) +\
      v81.crop(left + 10, top - 30, right - 4, bot - 40).trim(93, 99) +\
      v81.crop(left + 10, top - 20, right - 4, bot - 30).trim(100, 108) +\
      v81.crop(left + 10, top - 30, right - 4, bot - 40).trim(109, 109) +\
      v81.crop(left + 10, top - 20, right - 4, bot - 30).trim(110, 110) +\
      v81.crop(left + 10, top - 30, right - 4, bot - 40).trim(111, 115) +\
      v81.crop(left + 10, top - 20, right - 4, bot - 30).trim(116, 0)

v82 = full.trim(15564, 15762)
v82 = v82.crop(left + 10, top - 30, right + 10, bot - 30).trim(0, 145) +\
      v82.crop(left + 10, top - 50, right + 10, bot - 50).trim(146, 146) +\
      v82.crop(left + 10, top - 30, right + 10, bot - 30).trim(147, 148) +\
      v82.crop(left + 10, top - 40, right + 10, bot - 40).trim(149, 149) +\
      v82.crop(left + 10, top - 30, right + 10, bot - 30).trim(150, 173) +\
      v82.crop(left + 10, top - 40, right + 10, bot - 40).trim(174, 174) +\
      v82.crop(left + 10, top - 50, right + 10, bot - 50).trim(175, 175) +\
      v82.crop(left + 10, top - 30, right + 10, bot - 30).trim(176, 176) +\
      v82.crop(left + 10, top - 40, right + 10, bot - 40).trim(177, 177) +\
      v82.crop(left + 10, top - 30, right + 10, bot - 30).trim(178, 179) +\
      v82.crop(left + 10, top - 40, right + 10, bot - 40).trim(180, 180) +\
      v82.crop(left + 10, top - 30, right + 10, bot - 30).trim(181, 189) +\
      v82.crop(left + 10, top - 40, right + 10, bot - 40).trim(190, 190) +\
      v82.crop(left + 10, top - 30, right + 10, bot - 30).trim(191, 0)

v83 = full.trim(15763, 16076)
v83 = v83.crop(left + 10, top - 30, right + 10, bot - 30).trim(0, 20) +\
      v83.crop(left + 10, top - 40, right + 10, bot - 40).trim(21, 21) +\
      v83.crop(left + 10, top - 20, right + 10, bot - 20).trim(22, 22) +\
      v83.crop(left + 10, top - 30, right + 10, bot - 30).trim(23, 28) +\
      v83.crop(left + 0, top - 40, right + 0, bot - 40).trim(29, 30) +\
      v83.crop(left + 10, top - 30, right + 10, bot - 30).trim(31, 33) +\
      v83.crop(left + 0, top - 40, right + 0, bot - 40).trim(34, 36) +\
      v83.crop(left + 10, top - 30, right + 10, bot - 30).trim(37, 40) +\
      v83.crop(left + 0, top - 40, right + 0, bot - 40).trim(41, 42) +\
      v83.crop(left + 10, top - 30, right + 10, bot - 30).trim(43, 45) +\
      v83.crop(left + 10, top - 40, right + 10, bot - 40).trim(46, 46) +\
      v83.animate(58, 71, "crop", left + 10, top - 30, right + 10, bot - 30, left + 40, top - 30, right + 40, bot - 30).trim(47, 66) +\
      v83.animate(58, 71, "crop", left + 10, top - 40, right + 10, bot - 40, left + 40, top - 40, right + 40, bot - 40).trim(67, 67) +\
      v83.animate(58, 71, "crop", left + 10, top - 30, right + 10, bot - 30, left + 40, top - 30, right + 40, bot - 30).trim(68, 73) +\
      v83.animate(74, 85, "crop", left + 40, top - 30, right + 40, bot - 30, left - 10, top - 30, right - 10, bot - 30).trim(74, 81) +\
      v83.animate(74, 85, "crop", left + 40, top - 50, right + 40, bot - 50, left - 10, top - 50, right - 10, bot - 50).trim(82, 82) +\
      v83.animate(74, 85, "crop", left + 40, top - 30, right + 40, bot - 30, left - 10, top - 30, right - 10, bot - 30).trim(83, 94) +\
      v83.crop(left + 10, top - 30, right + 10, bot - 30).trim(95, 144) +\
      v83.crop(left + 10, top - 50, right + 10, bot - 50).trim(145, 145) +\
      v83.crop(left + 10, top - 30, right + 10, bot - 30).trim(146, 162) +\
      v83.crop(left + 10, top - 90, right + 10, bot - 90).trim(163, 163) +\
      v83.crop(left + 10, top - 20, right + 10, bot - 20).trim(164, 0)

v84 = full.trim(16077, 16248)
v84 = v84.crop(left + 10, top - 20, right - 4, bot - 30)

v85 = full.trim(16249, 16467)
v85 = v85.crop(left + 10, top - 20, right - 4, bot - 30)

v86 = full.trim(16468, 16781)
v86 = v86.animate(141, 146, "crop", left + 10, top - 30, right - 4, bot - 40, left - 10, top - 30, right - 24, bot - 40).trim(0, 145) +\
      v86.animate(146, 149, "crop", left - 10, top - 30, right - 24, bot - 40, left + 10, top - 30, right - 4, bot - 40).trim(146, 156) +\
      v86.crop(left + 20, top - 30, right + 6, bot - 40).trim(157, 158) +\
      v86.crop(left + 10, top - 30, right - 4, bot - 40).trim(159, 160) +\
      v86.crop(left + 20, top - 30, right + 6, bot - 40).trim(161, 162) +\
      v86.crop(left + 10, top - 30, right - 4, bot - 40).trim(163, 205) +\
      v86.crop(left + 20, top - 30, right + 6, bot - 40).trim(206, 206) +\
      v86.crop(left + 10, top - 30, right - 4, bot - 40).trim(207, 207) +\
      v86.crop(left + 20, top - 30, right + 6, bot - 40).trim(208, 210) +\
      v86.crop(left + 10, top - 30, right - 4, bot - 40).trim(211, 240) +\
      v86.crop(left + 20, top - 30, right + 6, bot - 40).trim(241, 242) +\
      v86.crop(left + 10, top - 30, right - 4, bot - 40).trim(243, 244) +\
      v86.crop(left + 20, top - 30, right + 6, bot - 40).trim(245, 246) +\
      v86.crop(left + 10, top - 30, right - 4, bot - 40).trim(247, 248) +\
      v86.crop(left + 20, top - 30, right + 6, bot - 40).trim(249, 255) +\
      v86.crop(left + 20, top - 30, right + 6, bot - 40).trim(256, 261) +\
      v86.animate(262, 269, "crop", left + 20, top - 30, right + 6, bot - 40, left + 50, top - 30, right + 36, bot - 40).trim(262, 291) +\
      v86.animate(292, 296, "crop", left + 50, top - 30, right + 36, bot - 40, left + 20, top - 30, right + 6, bot - 40).trim(292, 309) +\
      v86.animate(310, 313, "crop", left + 10, top - 30, right - 4, bot - 40, left + 50, top - 30, right + 36, bot - 40).trim(310, 0)
v86 = v86.trim(0, 255) + v86.trim(262, 0)

#return v1.adjustBorders.prefetch
#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return v74.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 65

v65 = LSMASHVideoSource(dst_dir + "v65f.mp4").ConvertToYV24()
v65 = v65.AdjustColor(ou = +12, ov = -10, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
v65 = v65.add_blank_audio
return v65.prefetch
#adjustframerate

v66 = LSMASHVideoSource(dst_dir + "v66f.mp4").ConvertToYV24()
v66 = v66.AdjustColor(ou = +12, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
v66 = v66.add_blank_audio
return v66.prefetch
#adjustframerate

v67 = LSMASHVideoSource(dst_dir + "v67f.mp4").ConvertToYV24()
v67 = v67.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
v67 = v67.add_blank_audio
return v67.prefetch
#adjustframerate

v68 = LSMASHVideoSource(dst_dir + "v68f.mp4").ConvertToYV24()
v68 = v68.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v68 = v68.colorYUV(off_u = -4, off_v = +0)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
v68 = v68.add_blank_audio
return v68.prefetch
#adjustframerate

v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
v69 = v69.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate

v70 = LSMASHVideoSource(dst_dir + "v70f.mp4").ConvertToYV24()
v70 = v70.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
v70 = v70.add_blank_audio
return v70.prefetch
#adjustframerate

v71 = LSMASHVideoSource(dst_dir + "v71f.mp4").ConvertToYV24()
v71 = v71.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v71 = v71.adjustSize
v71 = v71.assumeFPS(18)
v71 = v71.add_blank_audio
return v71.prefetch
#adjustframerate

v72 = LSMASHVideoSource(dst_dir + "v72f.mp4").ConvertToYV24()
v72 = v72.AdjustColor(ou = +0, ov = -0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true)
v72 = v72.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
v72 = v72.add_blank_audio
return v72.prefetch
#adjustframerate

v73 = LSMASHVideoSource(dst_dir + "v73f.mp4").ConvertToYV24()
v73 = v73.AdjustColor(ou = +2, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v73 = v73.adjustSize
v73 = v73.assumeFPS(18)
v73 = v73.add_blank_audio
return v73.prefetch
#adjustframerate

v74 = LSMASHVideoSource(dst_dir + "v74f.mp4").ConvertToYV24()
v74 = v74.AdjustColor(ou = +2, ov = -2, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
v74 = v74.add_blank_audio
return v74.prefetch
#adjustframerate

v75 = LSMASHVideoSource(dst_dir + "v75f.mp4").ConvertToYV24()
v75 = v75.AdjustColor(ou = +2, ov = -2, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
v75 = v75.add_blank_audio
return v75.prefetch
#adjustframerate

v76 = LSMASHVideoSource(dst_dir + "v76f.mp4").ConvertToYV24()
v76 = v76.AdjustColor(ou = +2, ov = -2, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v76 = v76.adjustSize
v76 = v76.assumeFPS(18)
v76 = v76.add_blank_audio
return v76.prefetch
#adjustframerate

v77 = LSMASHVideoSource(dst_dir + "v77f.mp4").ConvertToYV24()
v77 = v77.AdjustColor(ou = +10, ov = -6, x=400, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v77 = v77.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
v77 = v77.add_blank_audio
return v77.prefetch
#adjustframerate

v78 = LSMASHVideoSource(dst_dir + "v78f.mp4").ConvertToYV24()
v78 = v78.AdjustColor(ou = +10, ov = -4, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true,\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v78 = v78.colorYUV(off_u = -4, off_v = +0)
v78 = v78.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v78 = v78.adjustSize
v78 = v78.assumeFPS(18)
v78 = v78.add_blank_audio
return v78.prefetch
#adjustframerate

v79 = LSMASHVideoSource(dst_dir + "v79f.mp4").ConvertToYV24()
v79 = v79.AdjustColor(ou = +10, ov = -6, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v79 = v79.colorYUV(off_u = -4, off_v = +0)
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
v79 = v79.add_blank_audio
return v79.prefetch
#adjustframerate

v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
v80 = v80.AdjustColor(ou = +12, ov = -6, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v80 = v80.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate

v81 = LSMASHVideoSource(dst_dir + "v81f.mp4").ConvertToYV24()
v81 = v81.AdjustColor(ou = +6, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
v81 = v81.add_blank_audio
return v81.prefetch
#adjustframerate

v82 = LSMASHVideoSource(dst_dir + "v82f.mp4").ConvertToYV24()
v82 = v82.AdjustColor(ou = +6, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
v82 = v82.add_blank_audio
return v82.prefetch
#adjustframerate

v83 = LSMASHVideoSource(dst_dir + "v83f.mp4").ConvertToYV24()
v83 = v83.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
v83 = v83.add_blank_audio
return v83.prefetch
#adjustframerate

v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
v84 = v84.AdjustColor(ou = +8, ov = -4, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate

v85 = LSMASHVideoSource(dst_dir + "v85f.mp4").ConvertToYV24()
v85 = v85.AdjustColor(ou = +10, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=2, gam_mac=true)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
v85 = v85.add_blank_audio
return v85.prefetch
#adjustframerate

v86 = LSMASHVideoSource(dst_dir + "v86f.mp4").ConvertToYV24()
#v86 = v86.colorYUV(off_y = 0)
#v86 = v86.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v86 = v86.AdjustColor(ou = +6, ov = -6, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=2, sat=1.7, gam_mac=true)
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v86 = v86.colorYUV(off_u = -4, off_v = +0)
#v86 = v86.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
#return v86.histogram("levels")#.prefetch
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
v86 = v86.add_blank_audio
return v86.prefetch
#adjustframerate

#******

*/

function adjustBorders(clip c)
{
    ref_w = src.width
    ref_h = src.height
    ref_w = ref_w*1080/ref_h
    rem = ref_w % 16
    ref_w = (rem == 0) ? ref_w : ref_w + 16 - rem
    ref_h = 1080

    w = c.width
    h = c.height
    w = w*1080/h
    h = 1080

    c = c.height == h ? c : c.spline64Resize(w, h)

    assert(ref_w >= w, "ref_w < w")

    return ref_w == w ? c : c.addBorders(0, 0, ref_w - w, 0)
}

function adjustSize(clip c)
{
    w = c.width
    h = c.height
    w = w*1080/h
    w = (w % 2 == 0) ? w : w + 1
    h = 1080

    return c.gaussResize(w, h)
}

function Curves(clip c, string "bluePoints", string "redPoints")
{
    return StrLen(bluePoints) == 0 && StrLen(redPoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints, redPoints=redPoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac", string "redPoints", string "bluePoints", float "sat")
{
    ou = Default(ou, 0)
    ov = Default(ov, 0)
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)
    x = Default(x, 20)
    y = Default(y, 20)
    w = Default(w, -20)
    h = Default(h, -20)
    lo_th = Default(lo_th, 0)
    hi_th = Default(hi_th, 0.1)
    scale = Default(scale, 2)
    gam_mac = Default(gam_mac, true)
    lock_chan = Default(lock_chan, 1)
    redPoints = Default(redPoints, "")
    bluePoints = Default(bluePoints, "")
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(redPoints = redPoints, bluePoints = bluePoints).\
       ConvertToYV24() : c

    c = sat == 1 ? c : c.tweak(sat=sat, coring=false)

#    c = c.AdjustDiv2(1, 2)

    return c
}

function AdjustColorWB(clip c, y_gamma)
{
    c = c.tweak(sat=0, coring=false)
    c = c.Filter()
    c = c.ColorYUV(autogain=true, gamma_y = y_gamma)

    return c
}

function Filter_0(clip c)
{
    bsize = 8
    over = 4
    chrom = true
    hp = 16
    vp = 16
    search_v = 3
    dct_v = 1

    super = c.MSuper(pel=1, sharp=1, hpad=hp, vpad=vp, rfilter=4)
#return super.info

    backward_vec1 = MAnalyse(super, isb = true, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec2 = MAnalyse(super, isb = true, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec3 = MAnalyse(super, isb = true, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec1 = MAnalyse(super, isb = false, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec2 = MAnalyse(super, isb = false, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec3 = MAnalyse(super, isb = false, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
#    return c.MDegrain2(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,thSAD=4000)
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=400)
}

function Filter(clip c, int "th_SAD", int "th_SADC", float "sigma_y", float "sigma_c", int "dct", int "tr", bool "RefineMotion", bool "contrasharp",\
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter", float "fft_sharp")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)
    dct = default(dct, 0)
    tr = default(tr, 9)
    RefineMotion = default(RefineMotion, true)
    contrasharp = default(contrasharp, true)
    truemotion = default(truemotion, true)
    fft_sharp = default(fft_sharp, 0)

    new_w = (c.width + 15) / 16
    new_w = new_w * 16
    new_h = (c.height + 15) / 16
    new_h = new_h * 16
    dh = new_h - c.height
    dw = new_w - c.width
    c = c.addBorders(0, 0, dw, dh)

    c = filter16 ? c.convertBits(16) : c
#c = c.Spline64Resize(960, 720)
#c = c.SMDegrain(tr=tr, globals=3, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap)
    c = th_SAD == 0 && th_SADC == 0 ? c : c.SMDegrain(tr=tr, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap, search=3, truemotion=truemotion,\
                                                      RefineMotion=RefineMotion, prefilter=prefilter, contrasharp=contrasharp, globals=0, pel=1, subpixel=1,\
                                                      hpad=hpad, vpad=vpad)
    c = (sigma_y == 0 && fft_sharp == 0) ?\
                       c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6, sharpen=fft_sharp)
    c = sigma_c == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

#c = c.SincResize(1440, 1080)
    c = filter16 ? c.convertBits(8) : c

    return c.crop(0,0,-dw,-dh)
}

function AdjustFrameRate(clip c, string "preset_p", string "output_p", int "blksize_p")
{
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
#    c = c.Histogram("levels").info
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
    return c
}

function RemoveDirt(clip input, bool "_grey", int "repmode")
{
    new_w = (input.width + 15) / 16
    new_w = new_w * 16
    new_h = (input.height + 15) / 16
    new_h = new_h * 16
    dh = new_h - input.height
    dw = new_w - input.width
    input = input.addBorders(0, 0, dw, dh)

    _grey=default(_grey, false)
	repmode=default(repmode, 16)
	clmode=17
	clensed=Clense(input, grey=_grey, cache=4)
	sbegin = ForwardClense(input, grey=_grey, cache=-1)
	send = BackwardClense(input, grey=_grey, cache=-1)
	alt=Repair(SCSelect(input, sbegin, send, clensed, debug=true), input, mode=repmode, modeU = _grey ? -1 : repmode )
	restore=Repair(clensed, input, mode=repmode, modeU = _grey ? -1 : repmode)
	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, debug=false, noise=10, noisy=12, grey=_grey)
    return corrected.crop(0,0,-dw,-dh)
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode ).crop(0,0,-dw,-dh)
}

function gamma(clip c, int "gamma")
{
    return c.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=gamma/1000.0)
}

function color_uv(clip c, int off_u, int off_v)
{
    return c.colorYUV(off_u = off_u, off_v = off_v)
}


function PrepareMask(clip c, int "off_y", float "ignore_low", float "ignore_high", int "mask_tolerance", int "border_r", int "border_b")
{
    mask_w = 192
    mask_h = 128

    off_y=default(off_y, 0)
    ignore_low=default(ignore_low, 0.2)
    ignore_high=default(ignore_high, 0.1)
    mask_tolerance=default(mask_tolerance, 100)
    border_r=default(border_r, 0)
    border_b=default(border_b, 0)

#    c = c.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%

    mask = c.crop(0, 0, mask_w, mask_h).\
             colorYUV(off_y = off_y, autowhite=true).extractY.\
             autoLevels(ignore_low=ignore_low, ignore_high=ignore_high, filterRadius=0, minRng=0, border_r=border_r, border_b=border_b, debug=false)

    mask = mask.addBorders(0, 0, c.width - mask_w, c.height - mask_h)
    mask = mask.letterbox(0, c.height - mask_h, 0, c.width - mask_w, color = $ffffff)
    mask = mask.ConvertToPlanarRGBA()
#return mask
    mask = mask.expr("sx 40 < sy 0 == & 0 x ?")
#return mask.ConvertToRGB32
    mask = mask.ColorKeyMask($000000, mask_tolerance).Invert("A").showAlpha.convertToRGB32

    mask = mask.MaskUpdate(mask_w = mask_w, mask_h = mask_h)
#return mask
    return mask.Spline64Resize(c.width + 288, c.height + 216).crop(0, 0, -288, -216) # 120%
#    return mask.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%
}

function add_blank_audio(clip v)
{
    a = BlankClip(v, audio_rate = 48000, channels = 2).killVideo
    v = v.audioDub(a)
    return v
}