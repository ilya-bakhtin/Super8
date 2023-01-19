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

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

left = 56
top = 94
right = -100
bot = -98

v33 = full.trim(5285, 5335)
v33 = v33.crop(left, top - 20, right, bot - 20).trim(0, -1) +\
      v33.crop(left + 30, top - 20, right + 30, bot - 20).trim(1, 1) +\
      v33.crop(left + 30, top - 30, right + 30, bot - 30).trim(2, 2) +\
      v33.crop(left + 40, top - 30, right + 40, bot - 30).trim(3, 4) +\
      v33.crop(left + 60, top - 40, right + 60, bot - 40).trim(5, 5) +\
      v33.crop(left + 60, top - 30, right + 60, bot - 30).trim(6, 6) +\
      v33.crop(left + 70, top - 20, right + 70, bot - 20).trim(7, 7) +\
      v33.crop(left + 70, top - 30, right + 70, bot - 30).trim(8, 9) +\
      v33.crop(left + 20, top - 10, right + 20, bot - 10).trim(10, 13) +\
      v33.crop(left - 10, top - 30, right - 10, bot - 30).trim(14, 20) +\
      v33.animate(21, 49, "crop", left - 0, top - 30, right - 0, bot - 30, left + 30, top - 30, right + 30, bot - 30).trim(21, 0)

v34 = full.trim(5336, 5383)
v34 = v34.crop(left + 30, top - 20, right + 30, bot - 20).trim(0, -1) +\
      v34.crop(left + 20, top + 10, right + 20, bot + 10).trim(1, 1) +\
      v34.crop(left + 0, top + 80, right + 0, bot + 80).trim(2, 2) +\
      v34.crop(left - 20, top + 40, right - 20, bot + 40).trim(3, 3) +\
      v34.crop(left - 20, top + 30, right - 20, bot + 30).trim(4, 4) +\
      v34.crop(left - 56, top + 0, right - 56, bot + 0).trim(5, 5) +\
      v34.crop(left - 56, top - 10, right - 56, bot - 10).trim(6, 6) +\
      v34.crop(left - 56, top - 30, right - 56, bot - 30).trim(7, 7) +\
      v34.crop(left - 56, top - 40, right - 56, bot - 40).trim(8, 9) +\
      v34.crop(left - 40, top - 40, right - 40, bot - 40).trim(10, 10) +\
      v34.crop(left - 20, top - 30, right - 20, bot - 30).trim(11, 11) +\
      v34.crop(left + 30, top - 30, right + 30, bot - 30).trim(12, 12) +\
      v34.crop(left + 50, top - 30, right + 50, bot - 30).trim(13, 13) +\
      v34.crop(left + 30, top - 40, right + 30, bot - 40).trim(14, 18) +\
      v34.crop(left + 40, top - 40, right + 40, bot - 40).trim(19, 19) +\
      v34.crop(left + 0, top - 40, right + 0, bot - 40).trim(20, 20) +\
      v34.crop(left + 10, top - 20, right + 10, bot - 20).trim(21, 21) +\
      v34.crop(left + 30, top - 30, right + 30, bot - 30).trim(22, 22) +\
      v34.crop(left + 40, top - 30, right + 40, bot - 30).trim(23, 23) +\
      v34.crop(left + 60, top - 10, right + 60, bot - 10).trim(24, 24) +\
      v34.crop(left + 40, top - 10, right + 40, bot - 10).trim(25, 25) +\
      v34.crop(left + 40, top - 20, right + 40, bot - 20).trim(26, 27) +\
      v34.crop(left + 10, top - 20, right + 10, bot - 20).trim(28, 31) +\
      v34.crop(left - 10, top - 20, right - 10, bot - 20).trim(32, 32) +\
      v34.crop(left - 20, top - 50, right - 20, bot - 50).trim(33, 33) +\
      v34.crop(left - 20, top - 40, right - 20, bot - 40).trim(34, 37) +\
      v34.crop(left - 0, top - 40, right - 0, bot - 40).trim(38, 38) +\
      v34.crop(left + 30, top - 40, right + 30, bot - 40).trim(39, 39) +\
      v34.crop(left + 40, top - 40, right + 40, bot - 40).trim(40, 43) +\
      v34.crop(left + 40, top - 20, right + 40, bot - 20).trim(44, 0)

v35 = full.trim(5384, 5392)
v35 = v35.crop(left + 20, top - 30, right + 20, bot - 30)

v36 = full.trim(5393, 5442)
v36 = v36.crop(left + 20, top - 30, right + 20, bot - 30).trim(0, 2) +\
      v36.crop(left + 0, top - 30, right + 0, bot - 30).trim(3, 3) +\
      v36.crop(left + 0, top + 30, right + 0, bot + 30).trim(4, 4) +\
      v36.crop(left + 10, top + 40, right + 10, bot + 40).trim(5, 5) +\
      v36.crop(left - 0, top + 10, right - 0, bot + 10).trim(6, 6) +\
      v36.crop(left + 20, top + 10, right + 20, bot + 10).trim(7, 7) +\
      v36.crop(left + 0, top + 0, right + 0, bot + 0).trim(8, 8) +\
      v36.crop(left + 4, top - 10, right + 4, bot - 10).trim(9, 9) +\
      v36.crop(left + 14, top - 20, right + 14, bot - 20).trim(10, 10) +\
      v36.animate(11, 13, "crop", left + 20, top - 30, right + 20, bot - 30, left + 40, top - 30, right + 40, bot - 30).trim(11, 17) +\
      v36.animate(18, 23, "crop", left + 40, top - 30, right + 40, bot - 30, left - 40, top - 30, right - 40, bot - 30).trim(18, 23) +\
      v36.animate(23, 33, "crop", left - 40, top - 30, right - 40, bot - 30, left + 40, top - 30, right + 40, bot - 30).trim(24, 29) +\
      v36.animate(23, 33, "crop", left - 40, top - 10, right - 40, bot - 10, left + 40, top - 10, right + 40, bot - 10).trim(30, 32) +\
      v36.crop(left + 40, top - 30, right + 40, bot - 30).trim(33, 33) +\
      v36.crop(left + 30, top + 10, right + 30, bot + 10).trim(34, 36) +\
      v36.crop(left + 20, top + 10, right + 20, bot + 10).trim(37, 37) +\
      v36.crop(left - 10, top - 0, right - 10, bot - 0).trim(38, 38) +\
      v36.crop(left - 20, top - 20, right - 20, bot - 20).trim(39, 40) +\
      v36.crop(left - 0, top - 80, right - 0, bot - 80).trim(41, 41) +\
      v36.crop(left - 0, top - 40, right - 0, bot - 40).trim(42, 42) +\
      v36.animate(43, 49, "crop", left + 10, top - 30, right + 10, bot - 30, left + 50, top - 30, right + 50, bot - 30).trim(43, 0)

v37 = full.trim(5443, 5455)
v37 = v37.animate(0, 3, "crop", left + 40, 0, right + 40, 0, left + 20, 0, right + 20, 0).trim(0, 7) +\
      v37.animate(8, 12, "crop", left + 20, 0, right + 20, 0, left + 50, 0, right + 50, 0).trim(8, 0)

v37 = v37.animate(0, 2, "crop", 0, top - 30, 0, bot - 30, 0, top - 50, 0, bot - 50).trim(0, 2) +\
      v37.animate(3, 6, "crop", 0, top - 10, 0, bot - 10, 0, top - 30, 0, bot - 30).trim(3, 6) +\
      v37.crop(0, top - 20, 0, bot - 20).trim(7, 7) +\
      v37.crop(0, top - 30, 0, bot - 30).trim(8, 0)

v38 = full.trim(5456, 5514)
v38 = v38.animate(0, 9, "crop", left + 40, top - 30, right + 40, bot - 30, left + 0, top - 30, right + 0, bot - 30).trim(0, 13) +\
\
      v38.animate(14, 27, "crop", left + 0, top - 30, right + 0, bot - 30, left + 40, top - 30, right + 40, bot - 30).trim(14, 16) +\
      v38.animate(14, 27, "crop", left + 0, top - 20, right + 0, bot - 20, left + 40, top - 20, right + 40, bot - 20).trim(17, 17) +\
      v38.animate(14, 27, "crop", left + 0, top - 30, right + 0, bot - 30, left + 40, top - 30, right + 40, bot - 30).trim(18, 26) +\
      v38.animate(14, 27, "crop", left + 0, top - 20, right + 0, bot - 20, left + 40, top - 20, right + 40, bot - 20).trim(27, 28) +\
\
      v38.animate(29, 46, "crop", left + 24, top - 30, right + 24, bot - 30, left + 0, top - 30, right + 0, bot - 30).trim(29, 54) +\
      v38.crop(left + 0, top - 20, right + 0, bot - 20).trim(55, 55) +\
      v38.crop(left + 0, top - 30, right + 0, bot - 30).trim(56, 56) +\
      v38.crop(left + 0, top - 10, right + 0, bot - 10).trim(57, 0)

v39 = full.trim(5515, 5526)
v39 = v39.crop(left - 10, top - 10, right - 10, bot - 10).trim(0, -1) +\
      v39.crop(left - 10, top - 20, right - 10, bot - 20).trim(1, 2) +\
      v39.crop(left - 10, top - 30, right - 10, bot - 30).trim(3, 4) +\
      v39.crop(left + 10, top - 30, right + 10, bot - 30).trim(5, 9) +\
      v39.crop(left + 30, top - 30, right + 30, bot - 30).trim(10, 0)

v40 = full.trim(5527, 5557)
v40 = v40.crop(left + 10, top - 20, right + 10, bot - 20).trim(0, 4) +\
      v40.crop(left + 20, top - 30, right + 20, bot - 30).trim(5, 13) +\
      v40.crop(left + 20, top - 50, right + 20, bot - 50).trim(14, 15) +\
      v40.crop(left + 20, top + 20, right + 20, bot + 20).trim(16, 16) +\
      v40.crop(left + 10, top + 0, right + 10, bot + 0).trim(17, 17) +\
      v40.crop(left + 0, top + 0, right + 0, bot + 0).trim(18, 19) +\
      v40.crop(left - 10, top + 0, right - 10, bot + 0).trim(20, 20) +\
      v40.crop(left + 6, top - 30, right + 6, bot - 30).trim(21, 21) +\
      v40.crop(left + 20, top - 60, right + 20, bot - 60).trim(22, 22) +\
      v40.crop(left + 20, top - 40, right + 20, bot - 40).trim(23, 23) +\
      v40.crop(left + 20, top - 0, right + 20, bot - 0).trim(24, 24) +\
      v40.crop(left + 40, top - 0, right + 40, bot - 0).trim(25, 25) +\
      v40.crop(left + 50, top - 10, right + 50, bot - 10).trim(26, 26) +\
      v40.crop(left + 70, top - 20, right + 70, bot - 20).trim(27, 27) +\
      v40.crop(left + 60, top - 0, right + 60, bot - 0).trim(28, 0)

v41 = full.trim(5558, 5659)
v41 = v41.animate(0, 2, "crop", left + 50, top - 30, right + 50, bot - 30, left + 30, top - 30, right + 30, bot - 30).trim(0, 2) +\
      v41.crop(left + 0, top - 80, right + 0, bot - 80).trim(3, 4) +\
      v41.crop(left + 0, top - 40, right + 0, bot - 40).trim(5, 6) +\
      v41.crop(left + 0, top - 30, right + 0, bot - 30).trim(7, 19) +\
      v41.crop(left + 10, top - 30, right + 10, bot - 30).trim(20, 71) +\
      v41.animate(72, 76, "crop", left + 20, top - 30, right + 20, bot - 30, left + 20, top + 50, right + 20, bot + 50).trim(72, 77) +\
      v41.crop(left - 10, top + 30, right - 10, bot + 30).trim(78, 78) +\
      v41.crop(left + 10, top + 30, right + 10, bot + 30).trim(79, 79) +\
      v41.crop(left + 10, top + 0, right + 10, bot + 0).trim(80, 80) +\
      v41.crop(left + 10, top - 20, right + 10, bot - 20).trim(81, 82) +\
      v41.crop(left + 10, top - 30, right + 10, bot - 30).trim(83, 85) +\
      v41.crop(left + 20, top - 30, right + 20, bot - 30).trim(86, 86) +\
      v41.crop(left + 40, top - 30, right + 40, bot - 30).trim(87, 87) +\
      v41.crop(left + 50, top - 30, right + 50, bot - 30).trim(88, 88) +\
      v41.crop(left + 30, top - 30, right + 30, bot - 30).trim(89, 89) +\
      v41.crop(left + 10, top - 30, right + 10, bot - 30).trim(90, 91) +\
      v41.crop(left - 10, top - 30, right - 10, bot - 30).trim(92, 93) +\
      v41.crop(left + 10, top - 30, right + 10, bot - 30).trim(94, 97) +\
      v41.crop(left + 10, top - 0, right + 10, bot - 0).trim(98, 0)

v42 = full.trim(5660, 5686)
v42 = v42.crop(left - 40, top - 20, right - 40, bot - 20).trim(0, 2) +\
      v42.crop(left - 0, top - 30, right - 0, bot - 30).trim(3, 3) +\
      v42.crop(left + 10, top - 30, right + 10, bot - 30).trim(4, 4) +\
      v42.crop(left + 20, top - 30, right + 20, bot - 30).trim(5, 5) +\
      v42.crop(left + 20, top - 60, right + 20, bot - 60).trim(6, 6) +\
      v42.crop(left + 40, top - 30, right + 40, bot - 30).trim(7, 7) +\
      v42.crop(left + 60, top - 20, right + 60, bot - 20).trim(8, 8) +\
      v42.crop(left + 70, top - 10, right + 70, bot - 10).trim(9, 9) +\
      v42.crop(left + 80, top - 20, right + 80, bot - 20).trim(10, 10) +\
      v42.crop(left + 30, top - 30, right + 30, bot - 30).trim(11, 11) +\
      v42.crop(left + 20, top - 30, right + 20, bot - 30).trim(12, 12) +\
      v42.animate(13, 17, "crop", left + 20, top - 30, right + 20, bot - 30, left - 20, top - 30, right - 20, bot - 30).trim(13, 19) +\
      v42.crop(left + 20, top - 90, right + 20, bot - 90).trim(20, 20) +\
      v42.crop(left + 40, top - 60, right + 40, bot - 60).trim(21, 21) +\
      v42.crop(left + 50, top + 10, right + 50, bot + 10).trim(22, 22) +\
      v42.crop(left + 60, top + 30, right + 60, bot + 30).trim(23, 23) +\
      v42.crop(left + 70, top + 30, right + 70, bot + 30).trim(24, 25) +\
      v42.crop(left + 90, top + 30, right + 90, bot + 30).trim(26, 0)

v43 = full.trim(5687, 5814)
v43 = v43.crop(left + 16, top - 20, right + 16, bot - 20)

v44 = full.trim(5815, 5970)
v44 = v44.crop(left + 16, top - 20, right + 16, bot - 20).trim(0, 151) +\
      v44.crop(left + 16, top + 30, right + 16, bot + 30).trim(152, 0)

v45 = full.trim(5971, 6477)
v45 = v45.crop(left + 0, top - 20, right + 0, bot - 20).trim(0, 6) +\
      v45.crop(left + 16, top - 30, right + 16, bot - 30).trim(7, 0)
v45 = v45.trim(0, 219) + v45.trim(222, 0)

v46 = full.trim(6478, 6514)
v46 = v46.crop(left + 0, top - 20, right + 0, bot - 20)

v47 = full.trim(6515, 7059)
v47 = v47.crop(left + 10, top - 30, right + 10, bot - 30)

v48 = full.trim(7060, 7182)
v48 = v48.crop(left + 10, top - 30, right + 10, bot - 30)
v48 = v48.trim(0, v48.frameCount - 3)

v49 = full.trim(7184, 7605)
v49 = v49.crop(left + 10, top - 30, right + 10, bot - 30)

v50 = full.trim(7607, 8083)
v50 = v50.crop(left + 10, top - 30, right + 10, bot - 30).trim(0, 425) +\
      v50.crop(left + 10, top - 10, right + 10, bot - 10).trim(426, 466) +\
      v50.crop(left + 20, top - 10, right + 20, bot - 10).trim(467, 467) +\
      v50.crop(left + 40, top - 10, right + 40, bot - 10).trim(468, 472) +\
      v50.crop(left + 40, top + 10, right + 40, bot + 10).trim(473, 473) +\
      v50.crop(left + 40, top + 30, right + 40, bot + 30).trim(474, 0)

v51 = full.trim(8084, 8577)
v51 = v51.crop(left + 10, top - 10, right + 10, bot - 10).trim(0, 390) +\
      v51.crop(left + 20, top - 10, right + 20, bot - 10).trim(391, 442) +\
      v51.crop(left + 30, top - 0, right + 30, bot - 0).trim(443, 445) +\
      v51.crop(left + 50, top - 0, right + 50, bot - 0).trim(446, 446) +\
      v51.animate(463, 470, "crop", left + 30, top - 20, right + 30, bot - 20, left + 0, top - 20, right + 0, bot - 20).trim(447, 470) +\
      v51.animate(470, 478, "crop", left + 0, top - 20, right + 0, bot - 20, left + 40, top - 20, right + 40, bot - 20).trim(471, 478) +\
      v51.crop(left + 80, top - 10, right + 80, bot - 10).trim(479, 480) +\
      v51.animate(481, 489, "crop", left + 80, top - 10, right + 80, bot - 10, left + 0, top - 10, right + 0, bot - 10).trim(481, 486) +\
      v51.crop(left + 40, top - 10, right + 40, bot - 10).trim(487, 487) +\
      v51.animate(481, 489, "crop", left + 80, top - 10, right + 80, bot - 10, left + 0, top - 10, right + 0, bot - 10).trim(488, 0)

v52 = full.trim(8578, 8872)
v52 = v52.crop(left + 10, top - 10, right + 10, bot - 10)

v53 = full.trim(8873, 9124)
v53 = v53.crop(left + 10, top - 10, right + 10, bot - 10)

v54 = full.trim(9125, 9402)
v54 = v54.crop(left + 10, top - 10, right + 10, bot - 10)

v55 = full.trim(9403, 9669)
v55 = v55.crop(left + 10, top - 10, right + 10, bot - 10)

v56 = full.trim(9670, 10181)
v56 = v56.crop(left + 10, top - 10, right + 10, bot - 10).trim(0, 502) +\
      v56.crop(left + 30, top - 10, right + 30, bot - 10).trim(503, 507) +\
      v56.crop(left + 30, top + 20, right + 30, bot + 20).trim(508, 508) +\
      v56.crop(left + 30, top + 30, right + 30, bot + 30).trim(509, 0)

v57 = full.trim(10182, 10247)
v57 = v57.crop(left + 10, top - 10, right + 10, bot - 10)

v58 = full.trim(10248, 10397)
v58 = v58.crop(left + 10, top - 10, right + 10, bot - 10)

v59 = full.trim(10398, 10516)
v59 = v59.crop(left + 10, top - 10, right + 10, bot - 10)

v60 = full.trim(10517, 10925)
v60 = v60.crop(left + 10, top - 10, right + 10, bot - 10)

v61 = full.trim(10926, 11058)
v61 = v61.crop(left + 10, top - 10, right + 10, bot - 10)

v62 = full.trim(11059, 11228)
v62 = v62.crop(left + 10, top - 10, right + 10, bot - 10)

v63 = full.trim(11229, 11593)
v63 = v63.crop(left + 10, top - 20, right + 10, bot - 20)

v64 = full.trim(11595, 11913)
v64 = v64.crop(left + 10, top - 20, right + 10, bot - 20)

#return v1.adjustBorders.prefetch
#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return v64.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 33

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
v33 = v33.AdjustColor(ou = -2, ov = +2, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate

v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
v34 = v34.AdjustColor(ou = -2, ov = +2, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v34 = v34.colorYUV(off_u = -2, off_v = +0)
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate

v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
v35 = v35.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v35 = v35.colorYUV(off_u = -4, off_v = +0)
v35 = v35.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate

v36 = LSMASHVideoSource(dst_dir + "v36f.mp4").ConvertToYV24()
v36 = v36.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v36 = v36.colorYUV(off_u = -4, off_v = +0)
v36 = v36.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
v36 = v36.add_blank_audio
return v36.prefetch
#adjustframerate

v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
v37 = v37.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate

v38 = LSMASHVideoSource(dst_dir + "v38f.mp4").ConvertToYV24()
v38 = v38.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v38 = v38.colorYUV(off_u = -4, off_v = +0)
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
v38 = v38.add_blank_audio
return v38.prefetch
#adjustframerate

v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
v39 = v39.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v39 = v39.colorYUV(off_u = -4, off_v = +0)
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate

v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
v40 = v40.AdjustColor(ou = -0, ov = +0, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v40 = v40.colorYUV(off_u = -8, off_v = +4)
v40 = v40.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate

v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
v41 = v41.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate

v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
v42 = v42.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v42 = v42.colorYUV(off_u = -8, off_v = +4)
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate

v43 = LSMASHVideoSource(dst_dir + "v43f.mp4").ConvertToYV24()
v43 = v43.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v43 = v43.colorYUV(off_u = -8, off_v = +4)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
v43 = v43.add_blank_audio
return v43.prefetch
#adjustframerate

v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
v44 = v44.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true)
v44 = v44.colorYUV(off_u = -8, off_v = +4)
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate

v45 = LSMASHVideoSource(dst_dir + "v45f.mp4").ConvertToYV24()
v45 = v45.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v45 = v45.colorYUV(off_u = -10, off_v = +4)
v45 = v45.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
v45 = v45.add_blank_audio
return v45.prefetch
#adjustframerate

v46 = LSMASHVideoSource(dst_dir + "v46f.mp4").ConvertToYV24()
v46 = v46.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v46 = v46.colorYUV(off_u = -6, off_v = +0)
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
v46 = v46.add_blank_audio
return v46.prefetch
#adjustframerate

v47 = LSMASHVideoSource(dst_dir + "v47f.mp4").ConvertToYV24()
v47 = v47.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=0, sat=2, gam_mac=true)
v47 = v47.colorYUV(off_u = -6, off_v = +0)
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
v47 = v47.add_blank_audio
return v47.prefetch
#adjustframerate

v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
v48 = v48.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v48 = v48.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate

v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
v49 = v49.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate

v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
v50 = v50.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
v50 = v50.colorYUV(off_u = -4, off_v = +0)
v50 = v50.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate

v51 = LSMASHVideoSource(dst_dir + "v51f.mp4").ConvertToYV24()
v51 = v51.AdjustColor(ou = +18, ov = -12, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
v51 = v51.add_blank_audio
return v51.prefetch
#adjustframerate

v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
v52 = v52.AdjustColor(ou = +18, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate

v53 = LSMASHVideoSource(dst_dir + "v53f.mp4").ConvertToYV24()
v53 = v53.AdjustColor(ou = +12, ov = -12, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
v53 = v53.add_blank_audio
return v53.prefetch
#adjustframerate

v54 = LSMASHVideoSource(dst_dir + "v54f.mp4").ConvertToYV24()
v54 = v54.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true, \
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
v54 = v54.add_blank_audio
return v54.prefetch
#adjustframerate

v55 = LSMASHVideoSource(dst_dir + "v55f.mp4").ConvertToYV24()
v55 = v55.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v55 = v55.adjustSize
v55 = v55.assumeFPS(18)
v55 = v55.add_blank_audio
return v55.prefetch
#adjustframerate

v56 = LSMASHVideoSource(dst_dir + "v56f.mp4").ConvertToYV24()
v56 = v56.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
v56 = v56.add_blank_audio
return v56.prefetch
#adjustframerate

v57 = LSMASHVideoSource(dst_dir + "v57f.mp4").ConvertToYV24()
v57 = v57.AdjustColor(ou = +12, ov = -12, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
v57 = v57.add_blank_audio
return v57.prefetch
#adjustframerate

v58 = LSMASHVideoSource(dst_dir + "v58f.mp4").ConvertToYV24()
v58 = v58.AdjustColor(ou = +18, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
v58 = v58.add_blank_audio
return v58.prefetch
#adjustframerate

v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
v59 = v59.AdjustColor(ou = +18, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
v59 = v59.add_blank_audio
return v59.prefetch
#adjustframerate

v60 = LSMASHVideoSource(dst_dir + "v60f.mp4").ConvertToYV24()
v60 = v60.AdjustColor(ou = +12, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
v60 = v60.add_blank_audio
return v60.prefetch
#adjustframerate

v61 = LSMASHVideoSource(dst_dir + "v61f.mp4").ConvertToYV24()
v61 = v61.AdjustColor(ou = +12, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
v61 = v61.add_blank_audio
return v61.prefetch
#adjustframerate

v62 = LSMASHVideoSource(dst_dir + "v62f.mp4").ConvertToYV24()
v62 = v62.AdjustColor(ou = +12, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
v62 = v62.add_blank_audio
return v62.prefetch
#adjustframerate

v63 = LSMASHVideoSource(dst_dir + "v63f.mp4").ConvertToYV24()
v63 = v63.AdjustColor(ou = +12, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
v63 = v63.add_blank_audio
return v63.prefetch
#adjustframerate

v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
#v64 = v64.colorYUV(off_y = 0)
#v64 = v64.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v64 = v64.AdjustColor(ou = +12, ov = -10, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v64 = v64.colorYUV(off_u = -4, off_v = +0)
#v64 = v64.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
#return v64.histogram("levels").prefetch
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
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

function Curves(clip c, string "bluePoints")
{
    return StrLen(bluePoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac", string "bluePoints", float "sat")
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
    bluePoints = Default(bluePoints, "")
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints = bluePoints).\
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
#return mask
    mask = mask.MaskUpdate(mask_w = mask_w, mask_h = mask_h)

    return mask.Spline64Resize(c.width + 288, c.height + 216).crop(0, 0, -288, -216) # 120%
#    return mask.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%
}

function add_blank_audio(clip v)
{
    a = BlankClip(v, audio_rate = 48000, channels = 2).killVideo
    v = v.audioDub(a)
    return v
}