SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("M:\Media\video\Super8\1982-skola\N8 film.mov")
assumefps(18)

full = last

crop(210, 80, -50, -92)
#crop(210, 80, -10, -92)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 79, 186, 317, 505, 635, 793, 872, 962, 1023, 1164, 1279, 1363, 1493, 1554, 1741, 2154, 2314, 2435, 2657, 2853, 3007,
# 3347, 3547, 3777, 3966, 4058, 4173, 4473, 4864, 5013, 5057, 5076, 5297, 5637, 5643, 5840, 5908, 6065, 6156, 6201, 6383,
# 6608, 6806, 6859, 7001, 7027, 7525, 7535, 7635, 7767, 7772, 7841, 7966, 8249, 8439, 8725, 8808, 8894, 9038, 9224, 9393,
# 9560, 9721, 9841, 9936, 10049, 10226, 10496, 10757, 10798, 11000, 11182, 11570, 11604, 11913, 12377, 12428, 12556, 12732, # 80
# 12741, 12767, 12780, 12822, 12876, 12921, 12931, 13005, 13025, 13102, 13133, 13161, 13254, 13277, 13291, 13373, 13476, # 97, 17 per col.
# 13547, 13631, 13697, 13820, 13856, 13919, 13963, 13989, 14013, 14074, 14115, 14168, 14307, 14470, 14514, 14751, 14973, # 114
# 15136, 15203, 15274, 15486, 15650, 15838, 16278, 16428, 16671, 16958, 17123, 17453, 17723, 17972, 18045, 18539, 18590, # 131
# 19130, 19248, 19534, 19699, 19819, 20222, 20331, 20750, 21109, 21161, 21232, 21282, 21410, 21634, 21932, 22282, 22734, # 148
# 22753, 23236, 23370, 23443, 23664, 23720, 23832, 24000, 24019, 24143, 24324, 24443, 24450, 24522, 24550, 24668, 24701, # 165
# 24807, 24938, 25193, 25267, 25343, 25487, 25725, 26121, 26309, 26390, 26932, 27473, 27569, 27624
#
# skipped
# (7525, 7534)
# (7767, 7771)
# (12921, 12930)
# (13133, 13160)
# (13277, 13290)
# (24443, 24449)

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

ref_left = 180 + 18
ref_right = -30 + 2
ref_top = 110
ref_bot = -92

left = ref_left
right = ref_right
top = ref_top
bot = ref_bot

full = full.stackHorizontal(full.crop(full.width - 16, 0, 0, 0))

left = ref_left
right = ref_right
top = ref_top
bot = ref_bot

v129 = full.trim(19534, 19698)
v129 = v129.crop(left + 40, top - 30, right - 58, bot - 44).trim(0, 75) +\
       v129.crop(left + 40, top - 26, right - 58, bot - 40).trim(76, 0)

v130 = full.trim(19699, 19818)
v130 = v130.animate(52, 57, "crop", left + 50, top - 30, right - 48, bot - 44, left + 40, top - 30, right - 58, bot - 44).trim(0, 57) +\
       v130.animate(57, 62, "crop", left + 40, top - 30, right - 58, bot - 44, left + 50, top - 30, right - 48, bot - 44).trim(58, 62) +\
       v130.animate(65, 79, "crop", left + 50, top - 30, right - 48, bot - 44, left + 80, top - 30, right - 18, bot - 44).trim(63, 79) +\
       v130.animate(79, 95, "crop", left + 80, top - 30, right - 18, bot - 44, left + 50, top - 30, right - 48, bot - 44).trim(80, 95) +\
       v130.animate(95, 116, "crop", left + 50, top - 30, right - 48, bot - 44, left + 40, top - 30, right - 58, bot - 44).trim(96, 0)

v131 = full.trim(19819, 20221)
v131 = v131.crop(left + 40, top - 30, right - 58, bot - 44)

v132 = full.trim(20222, 20330)
v132 = v132.crop(left + 40, top - 30, right - 58, bot - 44)

v133 = full.trim(20331, 20749)
v133 = v133.crop(left + 40, top - 30, right - 58, bot - 44)

v134 = full.trim(20750, 21108)
v134 = v134.crop(left + 40, top - 30, right - 58, bot - 44)

v135 = full.trim(21109, 21160)
v135 = v135.crop(left + 40, top - 30, right - 58, bot - 44)

v136 = full.trim(21161, 21231)
v136 = v136.crop(left + 40, top - 30, right - 58, bot - 44)

v137 = full.trim(21232, 21281)
v137 = v137.crop(left + 40, top - 30, right - 58, bot - 44)

v138 = full.trim(21282, 21409)
v138 = v138.crop(left + 50, top - 30, right - 48, bot - 44)

v139 = full.trim(21410, 21633)
v139 = v139.crop(left + 50, top - 30, right - 48, bot - 44)

v140 = full.trim(21635, 21931)
v140 = v140.crop(left + 50, top - 30, right - 48, bot - 44)

v141 = full.trim(21932, 22281)
v141 = v141.crop(left + 50, top - 30, right - 48, bot - 44)

v142 = full.trim(22282, 22733)
v142 = v142.crop(left + 50, top - 30, right - 48, bot - 44)

v143 = full.trim(22734, 22752)
v143 = v143.crop(left + 50, top - 30, right - 48, bot - 44)

v144 = full.trim(22753, 23235)
v144 = v144.crop(left + 50, top - 20, right - 48, bot - 34)

v145 = full.trim(23236, 23369)
v145 = v145.crop(left + 50, top - 20, right - 48, bot - 34)

v146 = full.trim(23370, 23442)
v146 = v146.crop(left + 50, top - 20, right - 48, bot - 34)

v147 = full.trim(23443, 23663)
v147 = v147.crop(left + 50, top - 20, right - 48, bot - 34)

v148 = full.trim(23664, 23719)
v148 = v148.crop(left + 50, top - 20, right - 48, bot - 34)

v149 = full.trim(23720, 23831)
v149 = v149.crop(left + 50, top - 20, right - 48, bot - 34)

v150 = full.trim(23832, 23999)
v150 = v150.animate(164, 167, "crop", left + 50, top - 20, right - 48, bot - 34, left + 90, top - 20, right - 8, bot - 34)

v151 = full.trim(24000, 24017)
v151 = v151.animate(0, 3, "crop", left + 90, top - 20, right - 8, bot - 34, left + 126, top - 20, right + 28, bot - 34).trim(0, 14) +\
       v151.animate(15, 17, "crop", left + 126, top - 20, right + 28, bot - 34, left + 70, top - 20, right - 28, bot - 34).trim(15, 17)

v152 = full.trim(24019, 24142)
v152 = v152.animate(0, 6, "crop", left + 10, top - 10, right - 88, bot - 24, left + 126, top - 10, right + 28, bot - 24).trim(0, 8) +\
       v152.animate(9, 10, "crop", left + 126, top - 10, right + 28, bot - 24, left + 70, top - 10, right - 28, bot - 24).trim(9, 44) +\
       v152.animate(45, 52, "crop", left + 70, top - 10, right - 28, bot - 24, left + 56, top - 10, right - 42, bot - 24).trim(45, 72) +\
       v152.animate(73, 75, "crop", left + 56, top - 10, right - 42, bot - 24, left + 46, top - 10, right - 52, bot - 24).trim(73, 0)

v153 = full.trim(24143, 24323)
v153 = v153.crop(left + 50, top - 10, right - 48, bot - 24)

v154 = full.trim(24324, 24442)
v154 = v154.crop(left + 50, top - 10, right - 48, bot - 24)

#v155 = full.trim(24443, 24449)
v155 = full.trim(24450, 24521)
v155 = v155.crop(left + 50, top - 10, right - 48, bot - 24)

v156 = full.trim(24523, 24549)
v156 = v156.crop(left + 50, top - 10, right - 48, bot - 24)

v157 = full.trim(24550, 24667)
v157 = v157.crop(left + 50, top - 10, right - 48, bot - 24)

v158 = full.trim(24668, 24700)
v158 = v158.crop(left + 50, top - 10, right - 48, bot - 24)

v159 = full.trim(24704, 24806)
v159 = v159.crop(left + 50, top - 10, right - 58, bot - 24)

v160 = full.trim(24807, 24937)
v160 = v160.crop(left + 60, top - 10, right - 48, bot - 24)

#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).info.prefetch
#return v160.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 129

v129 = LWLibavVideoSource(source_dir + "v129f.avi", cache=false).ConvertToYV24()
v129 = v129.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v129 = v129.colorYUV(off_u=-4, off_v=0)
v129 = v129.adjustSize
v129 = v129.assumeFPS(18)
return v129.prefetch
#adjustframerate

v130 = LWLibavVideoSource(source_dir + "v130f.avi", cache=false).ConvertToYV24()
v130 = v130.AdjustColor(ou=8, ov=-8, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v130 = v130.colorYUV(off_u=-8, off_v=4)
v130 = v130.adjustSize
v130 = v130.assumeFPS(18)
return v130.prefetch
#adjustframerate

v131 = LWLibavVideoSource(source_dir + "v131f.avi", cache=false).ConvertToYV24()
v131 = v131.AdjustColor(ou=8, ov=-8, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v131 = v131.colorYUV(off_u=-8, off_v=4)
v131 = v131.adjustSize
v131 = v131.assumeFPS(18)
return v131.prefetch
#adjustframerate

v132 = LWLibavVideoSource(source_dir + "v132f.avi", cache=false).ConvertToYV24()
v132 = v132.AdjustColor(ou=8, ov=-8, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v132 = v132.colorYUV(off_u=-4, off_v=4)
v132 = v132.adjustSize
v132 = v132.assumeFPS(18)
return v132.prefetch
#adjustframerate

v133 = LWLibavVideoSource(source_dir + "v133f.avi", cache=false).ConvertToYV24()
v133 = v133.AdjustColor(ou=8, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v133 = v133.colorYUV(off_u=-4, off_v=4)
v133 = v133.adjustSize
v133 = v133.assumeFPS(18)
return v133.prefetch
#adjustframerate

v134 = LWLibavVideoSource(source_dir + "v134f.avi", cache=false).ConvertToYV24()
v134 = v134.AdjustColor(ou=8, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v134 = v134.colorYUV(off_u=-4, off_v=4)
v134 = v134.adjustSize
v134 = v134.assumeFPS(18)
return v134.prefetch
#adjustframerate

v135 = LWLibavVideoSource(source_dir + "v135f.avi", cache=false).ConvertToYV24()
v135 = v135.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v135 = v135.colorYUV(off_u=-4, off_v=4)
v135 = v135.adjustSize
v135 = v135.assumeFPS(18)
return v135.prefetch
#adjustframerate

v136 = LWLibavVideoSource(source_dir + "v136f.avi", cache=false).ConvertToYV24()
v136 = v136.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v136 = v136.adjustSize
v136 = v136.assumeFPS(18)
return v136.prefetch
#adjustframerate

v137 = LWLibavVideoSource(source_dir + "v137f.avi", cache=false).ConvertToYV24()
v137 = v137.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v137 = v137.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v137 = v137.adjustSize
v137 = v137.assumeFPS(18)
return v137.prefetch
#adjustframerate

v138 = LWLibavVideoSource(source_dir + "v138f.avi", cache=false).ConvertToYV24()
v138 = v138.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v138 = v138.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v138 = v138.adjustSize
v138 = v138.assumeFPS(18)
return v138.prefetch
#adjustframerate

v139 = LWLibavVideoSource(source_dir + "v139f.avi", cache=false).ConvertToYV24()
v139 = v139.trim(1, 0)
v139 = v139.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v139 = v139.colorYUV(off_u=-4, off_v=4)
v139 = v139.autolevels(minRng=0, ignore_low=0.003, ignore_high=0, gamma=1.1)
v139 = v139.adjustSize
v139 = v139.assumeFPS(18)
return v139.prefetch
#adjustframerate

v140 = LWLibavVideoSource(source_dir + "v140f.avi", cache=false).ConvertToYV24()
v140 = v140.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v140 = v140.autolevels(minRng=0, ignore_low=0.003, ignore_high=0, gamma=1.1)
v140 = v140.adjustSize
v140 = v140.assumeFPS(18)
return v140.prefetch
#adjustframerate

v141 = LWLibavVideoSource(source_dir + "v141f.avi", cache=false).ConvertToYV24()
v141 = v141.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v141 = v141.colorYUV(off_u=-4, off_v=4)
v141 = v141.adjustSize
v141 = v141.assumeFPS(18)
return v141.prefetch
#adjustframerate

v142 = LWLibavVideoSource(source_dir + "v142f.avi", cache=false).ConvertToYV24()
v142 = v142.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v142 = v142.colorYUV(off_u=-4, off_v=4)
v142 = v142.autolevels(minRng=0, ignore_low=0.003, ignore_high=0, gamma=1.1)
v142 = v142.adjustSize
v142 = v142.assumeFPS(18)
return v142.prefetch
#adjustframerate

v143 = LWLibavVideoSource(source_dir + "v143f.avi", cache=false).ConvertToYV24()
v143 = v143.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v143 = v143.colorYUV(off_u=-4, off_v=4)
v143 = v143.adjustSize
v143 = v143.assumeFPS(18)
return v143.prefetch
#adjustframerate

v144 = LWLibavVideoSource(source_dir + "v144f.avi", cache=false).ConvertToYV24()
v144 = v144.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v144 = v144.colorYUV(off_u=-4, off_v=4)
v144 = v144.adjustSize
v144 = v144.assumeFPS(18)
return v144.prefetch
#adjustframerate

v145 = LWLibavVideoSource(source_dir + "v145f.avi", cache=false).ConvertToYV24()
v145 = v145.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v145 = v145.colorYUV(off_u=-4, off_v=4)
v145 = v145.adjustSize
v145 = v145.assumeFPS(18)
return v145.prefetch
#adjustframerate

v146 = LWLibavVideoSource(source_dir + "v146f.avi", cache=false).ConvertToYV24()
v146 = v146.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v146 = v146.colorYUV(off_u=-8, off_v=0)
v146 = v146.autolevels(minRng=0, ignore_low=0.003, ignore_high=0, gamma=1.1)
v146 = v146.adjustSize
v146 = v146.assumeFPS(18)
return v146.prefetch
#adjustframerate

v147 = LWLibavVideoSource(source_dir + "v147f.avi", cache=false).ConvertToYV24()
v147 = v147.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v147 = v147.colorYUV(off_u=-8, off_v=0)
v147 = v147.adjustSize
v147 = v147.assumeFPS(18)
return v147.prefetch
#adjustframerate

v148 = LWLibavVideoSource(source_dir + "v148f.avi", cache=false).ConvertToYV24()
v148 = v148.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v148 = v148.colorYUV(off_u=-8, off_v=0)
v148 = v148.adjustSize
v148 = v148.assumeFPS(18)
return v148.prefetch
#adjustframerate

v149 = LWLibavVideoSource(source_dir + "v149f.avi", cache=false).ConvertToYV24()
v149 = v149.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v149 = v149.colorYUV(off_u=-4, off_v=0)
v149 = v149.adjustSize
v149 = v149.assumeFPS(18)
return v149.prefetch
#adjustframerate

v150 = LWLibavVideoSource(source_dir + "v150f.avi", cache=false).ConvertToYV24()
v150 = v150.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v150 = v150.adjustSize
v150 = v150.assumeFPS(18)
return v150.prefetch
#adjustframerate

v151 = LWLibavVideoSource(source_dir + "v151f.avi", cache=false).ConvertToYV24()
v151 = v151.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v151 = v151.adjustSize
v151 = v151.assumeFPS(18)
return v151.prefetch
#adjustframerate

v152 = LWLibavVideoSource(source_dir + "v152f.avi", cache=false).ConvertToYV24()
v152 = v152.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v152 = v152.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v152 = v152.adjustSize
v152 = v152.assumeFPS(18)
return v152.prefetch
#adjustframerate

v153 = LWLibavVideoSource(source_dir + "v153f.avi", cache=false).ConvertToYV24()
v153 = v153.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v153 = v153.colorYUV(off_u=-4, off_v=4)
v153 = v153.adjustSize
v153 = v153.assumeFPS(18)
return v153.prefetch
#adjustframerate

v154 = LWLibavVideoSource(source_dir + "v154f.avi", cache=false).ConvertToYV24()
v154 = v154.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v154 = v154.colorYUV(off_u=-4, off_v=4)
v154 = v154.adjustSize
v154 = v154.assumeFPS(18)
return v154.prefetch
#adjustframerate

v155 = LWLibavVideoSource(source_dir + "v155f.avi", cache=false).ConvertToYV24()
v155 = v155.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v155 = v155.adjustSize
v155 = v155.assumeFPS(18)
return v155.prefetch
#adjustframerate

v156 = LWLibavVideoSource(source_dir + "v156f.avi", cache=false).ConvertToYV24()
v156 = v156.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v156 = v156.adjustSize
v156 = v156.assumeFPS(18)
return v156.prefetch
#adjustframerate

v157 = LWLibavVideoSource(source_dir + "v157f.avi", cache=false).ConvertToYV24()
v157 = v157.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v157 = v157.adjustSize
v157 = v157.assumeFPS(18)
return v157.prefetch
#adjustframerate

v158 = LWLibavVideoSource(source_dir + "v158f.avi", cache=false).ConvertToYV24()
v158 = v158.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v158 = v158.adjustSize
v158 = v158.assumeFPS(18)
return v158.prefetch
#adjustframerate

v159 = LWLibavVideoSource(source_dir + "v159f.avi", cache=false).ConvertToYV24()
v159 = v159.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v159 = v159.adjustSize
v159 = v159.assumeFPS(18)
return v159.prefetch
#adjustframerate

v160 = LWLibavVideoSource(source_dir + "v160f.avi", cache=false).ConvertToYV24()
#v160_ = LWLibavVideoSource(source_dir + "v160s.avi", cache=false).ConvertToYV24()
#return v160_.interleave(v160).histogram("levels")
#v160 = v160.colorYUV(off_y=6)
#v160 = v160.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v160 = v160.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
#v160 = v160.colorYUV(off_u=-4, off_v=4)
#v160 = v160.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v160 = v160.adjustSize
v160 = v160.assumeFPS(18)
#return v160.histogram("levels").prefetch
return v160.prefetch
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
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode )
}

function gamma(clip c, int "gamma")
{
    return c.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=gamma/1000.0)
}

function color_uv(clip c, int off_u, int off_v)
{
    return c.colorYUV(off_u = off_u, off_v = off_v)
}

/*
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/
