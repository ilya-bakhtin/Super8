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

# 0, 79, 186, 317, 505, 635, 793, 872, 962, 1023, 1164, 1279, 1363, 1493, 1554, 1741, 2154, 2314, 2435, 2657, 2853, 3007, # 22
# 3347, 3547, 3777, 3966, 4058, 4173, 4473, 4864, 5013, 5057, 5076, 5297, 5637, 5643, 5840, 5908, 6065, 6156, 6201, 6383, # 42, 20 per col.
# 6608, 6806, 6859, 7001, 7027, 7525, 7535, 7635, 7767, 7772, 7841, 7966, 8249, 8439, 8725, 8808, 8894, 9038, 9224, 9393, # 62
# 9560, 9721, 9841, 9936, 10049, 10226, 10496, 10757, 10798, 11000, 11182, 11570, 11604, 11913, 12377, 12428, 12556, 12732, # 80
# 12741, 12767, 12780, 12822, 12876, 12921, 12931, 13005, 13025, 13102, 13133, 13161, 13254, 13277, 13291, 13373, 13476, # 97, 17 per col.
# 13547, 13631, 13697, 13820, 13856, 13919, 13963, 13989, 14013, 14074, 14115, 14168, 14307, 14470, 14514, 14751, 14973, # 114
#
# skipped
# (7525, 7534)
# (7767, 7771)
# (12921, 12930)
# (13133, 13160)
# (13277, 13290)

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

v65 = full.trim(10050, 10225)
v65 = v65.crop(left + 48, top + 10, right - 50, bot + 00)

v66 = full.trim(10227, 10495)
v66 = v66.crop(left + 48, top + 10, right - 50, bot + 00)

v67 = full.trim(10502, 10756)
v67 = v67.crop(left + 48, top + 20, right - 70, bot - 10)

v68 = full.trim(10759, 10795)
v68 = v68.crop(left + 48, top + 20, right - 70, bot - 10)

v69 = full.trim(10798, 10999)
v69 = v69.animate(0, 11, "crop", left + 110, top + 40, right + 2, bot + 18, left + 60, top + 40, right - 48, bot + 18)
#v69 = v69.animate(0, 11, "crop", left + 110, top + 40, right + 12, bot + 30, left + 60, top + 40, right - 38, bot + 30)

v70 = full.trim(11000, 11181)
v70 = v70.crop(left + 60, top + 44, right - 46, bot + 24)

v71 = full.trim(11182, 11569)
v71 = v71.crop(left + 50, top + 40, right - 48, bot + 26)

v72 = full.trim(11570, 11603)
v72 = v72.crop(left + 60, top + 40, right - 38, bot + 26)

v73 = full.trim(11604, 11912)
v73 = v73.animate(70, 122, "crop", left + 60, top + 40, right - 38, bot + 26, left + 40, top + 40, right - 58, bot + 26)

v74 = full.trim(11913, 12376)
v74 = v74.animate(58, 145, "crop", left + 40, top + 40, right - 68, bot + 18, left + 60, top + 40, right - 48, bot + 18)

v75 = full.trim(12377, 12427)
v75 = v75.crop(left + 50, top + 40, right - 48, bot + 26)

v76 = full.trim(12428, 12555)
v76 = v76.crop(left + 50, top + 40, right - 48, bot + 26)

v77 = full.trim(12556, 12720)
v77 = v77.crop(left + 40, top + 50, right - 70, bot + 26)

v78 = full.trim(12732, 12740)
v78 = v78.crop(left + 40, top + 40, right - 58, bot + 26)

v79 = full.trim(12741, 12766)
v79 = v79.crop(left + 40, top + 40, right - 58, bot + 26)

v80 = full.trim(12767, 12779)
v80 = v80.crop(left + 50, top + 40, right - 48, bot + 26)

v81 = full.trim(12780, 12821)
v81 = v81.crop(left + 50, top + 40, right - 48, bot + 26)

v82 = full.trim(12822, 12875)
v82 = v82.crop(left + 60, top + 40, right - 38, bot + 26)

v83 = full.trim(12876, 12920)
v83 = v83.crop(left + 70, top + 40, right - 28, bot + 26)

#v84 = full.trim(12921, 12930)
v84 = full.trim(12931, 13004)
v84 = v84.crop(left + 70, top + 40, right - 28, bot + 26)

v85 = full.trim(13005, 13024)
v85 = v85.crop(left + 60, top + 30, right - 38, bot + 16)

v86 = full.trim(13025, 13101)
v86 = v86.crop(left + 50, top + 30, right - 48, bot + 16)

v87 = full.trim(13102, 13132)
v87 = v87.crop(left + 50, top + 30, right - 48, bot + 16)

#v88 = full.trim(13133, 13160)
v88 = full.trim(13161, 13253)
v88 = v88.crop(left + 40, top + 40, right - 58, bot + 26)

v89 = full.trim(13254, 13276)
v89 = v89.crop(left + 40, top + 40, right - 58, bot + 26)

#v90 = full.trim(13277, 13290)
v90 = full.trim(13291, 13372)
v90 = v90.crop(left + 40, top + 40, right - 58, bot + 26)

v91 = full.trim(13373, 13475)
v91 = v91.crop(left + 40, top + 40, right - 58, bot + 26)

v92 = full.trim(13476, 13546)
v92 = v92.crop(left + 40, top + 40, right - 58, bot + 26)

v93 = full.trim(13547, 13630)
v93 = v93.crop(left + 40, top + 40, right - 58, bot + 26)

v94 = full.trim(13631, 13696)
v94 = v94.crop(left + 60, top + 40, right - 38, bot + 26)

v95 = full.trim(13697, 13819)
v95 = v95.crop(left + 60, top + 40, right - 38, bot + 26)

v96 = full.trim(13820, 13855)
v96 = v96.crop(left + 60, top + 40, right - 38, bot + 26)

#return v96.adjustSize.adjustBorders.prefetch
#return src.adjustBorders.info.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 65

v65 = LWLibavVideoSource(source_dir + "v65f.avi", cache=false).ConvertToYV24()
v65 = v65.AdjustColor(ou=0, ov=-4, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v65 = v65.colorYUV(off_u=-4, off_v=4)
v65 = v65.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
return v65.prefetch
#adjustframerate

v66 = LWLibavVideoSource(source_dir + "v66f.avi", cache=false).ConvertToYV24()
v66 = v66.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.5, red=1, grn=1, blu=1, gam_mac=true)
v66 = v66.colorYUV(off_u=-4, off_v=4)
v66 = v66.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
return v66.prefetch
#adjustframerate

v67 = LWLibavVideoSource(source_dir + "v67f.avi", cache=false).ConvertToYV24()
v67 = v67.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v67 = v67.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
return v67.prefetch
#adjustframerate

v68 = LWLibavVideoSource(source_dir + "v68f.avi", cache=false).ConvertToYV24()
v68 = v68.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v68 = v68.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
return v68.prefetch
#adjustframerate

v69 = LWLibavVideoSource(source_dir + "v69f.avi", cache=false).ConvertToYV24()
v69 = v69.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v69 = v69.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
return v69.prefetch
#adjustframerate

v70 = LWLibavVideoSource(source_dir + "v70f.avi", cache=false).ConvertToYV24()
v70 = v70.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v70 = v70.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
return v70.prefetch
#adjustframerate

v71 = LWLibavVideoSource(source_dir + "v71f.avi", cache=false).ConvertToYV24()
v71 = v71.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v71 = v71.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v71 = v71.adjustSize
v71 = v71.assumeFPS(18)
return v71.prefetch
#adjustframerate

v72 = LWLibavVideoSource(source_dir + "v72f.avi", cache=false).ConvertToYV24()
v72 = v72.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
return v72.prefetch
#adjustframerate

v73 = LWLibavVideoSource(source_dir + "v73f.avi", cache=false).ConvertToYV24()
v73 = v73.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v73 = v73.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v73 = v73.adjustSize
v73 = v73.assumeFPS(18)
return v73.prefetch
#adjustframerate

v74 = LWLibavVideoSource(source_dir + "v74f.avi", cache=false).ConvertToYV24()
v74 = v74.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v74 = v74.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
return v74.prefetch
#adjustframerate

v75 = LWLibavVideoSource(source_dir + "v75f.avi", cache=false).ConvertToYV24()
v75 = v75.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
return v75.prefetch
#adjustframerate

v76 = LWLibavVideoSource(source_dir + "v76f.avi", cache=false).ConvertToYV24()
v76 = v76.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v76 = v76.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v76 = v76.adjustSize
v76 = v76.assumeFPS(18)
return v76.prefetch
#adjustframerate

v77 = LWLibavVideoSource(source_dir + "v77f.avi", cache=false).ConvertToYV24()
v77 = v77.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v77 = v77.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v77 = v77.adjustSize
v77 = v77.assumeFPS(18)
return v77.prefetch
#adjustframerate

v78 = LWLibavVideoSource(source_dir + "v78f.avi", cache=false).ConvertToYV24()
v78 = v78.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v78 = v78.adjustSize
v78 = v78.assumeFPS(18)
return v78.prefetch
#adjustframerate

v79 = LWLibavVideoSource(source_dir + "v79f.avi", cache=false).ConvertToYV24()
v79 = v79.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
return v79.prefetch
#adjustframerate

v80 = LWLibavVideoSource(source_dir + "v80f.avi", cache=false).ConvertToYV24()
v80 = v80.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v80 = v80.colorYUV(off_u=0, off_v=-4)
v80 = v80.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
return v80.prefetch
#adjustframerate

v81 = LWLibavVideoSource(source_dir + "v81f.avi", cache=false).ConvertToYV24()
v81 = v81.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v81 = v81.colorYUV(off_u=-4, off_v=-4)
v81 = v81.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
return v81.prefetch
#adjustframerate

v82 = LWLibavVideoSource(source_dir + "v82f.avi", cache=false).ConvertToYV24()
v82 = v82.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v82 = v82.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
return v82.prefetch
#adjustframerate

v83 = LWLibavVideoSource(source_dir + "v83f.avi", cache=false).ConvertToYV24()
v83 = v83.AdjustColor(ou=2, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v83 = v83.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v83 = v83.adjustSize
v83 = v83.assumeFPS(18)
return v83.prefetch
#adjustframerate

v84 = LWLibavVideoSource(source_dir + "v84f.avi", cache=false).ConvertToYV24()
v84 = v84.AdjustColor(ou=2, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v84 = v84.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
return v84.prefetch
#adjustframerate

v85 = LWLibavVideoSource(source_dir + "v85f.avi", cache=false).ConvertToYV24()
v85 = v85.AdjustColor(ou=2, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v85 = v85.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
return v85.prefetch
#adjustframerate

v86 = LWLibavVideoSource(source_dir + "v86f.avi", cache=false).ConvertToYV24()
v86 = v86.AdjustColor(ou=0, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v86 = v86.colorYUV(off_u=-4, off_v=0)
v86 = v86.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
return v86.prefetch
#adjustframerate

v87 = LWLibavVideoSource(source_dir + "v87f.avi", cache=false).ConvertToYV24()
v87 = v87.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v87 = v87.colorYUV(off_u=-4, off_v=2)
v87 = v87.adjustSize
v87 = v87.assumeFPS(18)
return v87.prefetch
#adjustframerate

v88 = LWLibavVideoSource(source_dir + "v88f.avi", cache=false).ConvertToYV24()
v88 = v88.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
return v88.prefetch
#adjustframerate

v89 = LWLibavVideoSource(source_dir + "v89f.avi", cache=false).ConvertToYV24()
v89 = v89.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v89 = v89.colorYUV(off_u=-4, off_v=2)
v89 = v89.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v89 = v89.adjustSize
v89 = v89.assumeFPS(18)
return v89.prefetch
#adjustframerate

v90 = LWLibavVideoSource(source_dir + "v90f.avi", cache=false).ConvertToYV24()
v90 = v90.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v90 = v90.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v90 = v90.adjustSize
v90 = v90.assumeFPS(18)
return v90.prefetch
#adjustframerate

v91 = LWLibavVideoSource(source_dir + "v91f.avi", cache=false).ConvertToYV24()
v91 = v91.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v91 = v91.colorYUV(off_u=-4, off_v=2)
v91 = v91.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
return v91.prefetch
#adjustframerate

v92 = LWLibavVideoSource(source_dir + "v92f.avi", cache=false).ConvertToYV24()
v92 = v92.AdjustColor(ou=0, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v92 = v92.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
return v92.prefetch
#adjustframerate

v93 = LWLibavVideoSource(source_dir + "v93f.avi", cache=false).ConvertToYV24()
v93 = v93.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v93 = v93.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
return v93.prefetch
#adjustframerate

v94 = LWLibavVideoSource(source_dir + "v94f.avi", cache=false).ConvertToYV24()
v94 = v94.AdjustColor(ou=0, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v94 = v94.colorYUV(off_u=-4, off_v=2)
v94 = v94.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v94 = v94.adjustSize
v94 = v94.assumeFPS(18)
return v94.prefetch
#adjustframerate

v95 = LWLibavVideoSource(source_dir + "v95f.avi", cache=false).ConvertToYV24()
v95 = v95.AdjustColor(ou=0, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v95 = v95.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v95 = v95.adjustSize
v95 = v95.assumeFPS(18)
return v95.prefetch
#adjustframerate

v96 = LWLibavVideoSource(source_dir + "v96f.avi", cache=false).ConvertToYV24()
#v96_ = LWLibavVideoSource(source_dir + "v96s.avi", cache=false).ConvertToYV24()
#return v96_.interleave(v96).histogram("levels")
#v96 = v96.colorYUV(off_y=6)
#v96 = v96.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v96 = v96.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
#v96 = v96.colorYUV(off_u=-4, off_v=2)
v96 = v96.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
#return v96.histogram("levels").prefetch
v96 = v96.adjustSize
v96 = v96.assumeFPS(18)
return v96.prefetch
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
/*
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/