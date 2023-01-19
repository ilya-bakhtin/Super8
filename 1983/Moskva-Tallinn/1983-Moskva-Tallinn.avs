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
bot = -98

v1 = full.trim(0, 371)
v1_0 = v1.trim(0, -1)
v1_0 = v1_0.crop(0, 710, 0, -70).stackVertical(v1_0.crop(0, 20, 0, -v1_0.height + 800))
v1_19 = v1.trim(19, -1)
v1_19 = v1_19.crop(0, 720, 0, -60).stackVertical(v1_19.crop(0, 20, 0, -v1_19.height + 800))
v1 = v1_0 + v1.trim(1, 18) + v1_19 + v1.trim(20, 0)

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

v3 = full.trim(639, 1005)
v3 = v3.crop(left + 40, top + 10, right + 40, bot + 10)

v4 = full.trim(1006, 1177)
v4 = v4.crop(left + 40, top + 10, right + 40, bot + 10).trim(0, 5) +\
     v4.trim(5, 5).crop(0, v4.height - 50, 0, 0).stackVertical(v4.trim(6, 6).crop(0, 0, 0, -50)).crop(left + 40, top - 70, right + 40, bot - 70) +\
     v4.crop(left + 40, top + 10, right + 40, bot + 10).trim(7, 0)

v5 = full.trim(1178, 1408)
v5 = v5.crop(left + 40, top + 10, right + 40, bot + 10)

v6 = full.trim(1409, 1508)
v6 = v6.crop(left + 40, top + 10, right + 40, bot + 10)

v7 = full.trim(1509, 1610)
v7 = v7.crop(left + 40, top + 10, right + 40, bot + 10)

v8 = full.trim(1613, 1676)
v8 = v8.crop(left + 40, top + 10, right + 40, bot + 10)

v9 = full.trim(1677, 1766)
v9 = v9.crop(left + 40, top + 10, right + 40, bot + 10)

v10 = full.trim(1767, 1868)
v10 = v10.crop(left + 40, top + 10, right + 40, bot + 10)

v11 = full.trim(1869, 2075)
v11 = v11.crop(left + 40, top + 10, right + 40, bot + 10)

v12 = full.trim(2076, 2192)
v12 = v12.crop(left + 40, top + 10, right + 40, bot + 10)

v13 = full.trim(2194, 2310)
v13 = v13.crop(left + 40, top + 10, right + 40, bot + 10)

v14 = full.trim(2313, 2535)
v14 = v14.crop(left + 40, top + 10, right + 40, bot + 10)

v15 = full.trim(2536, 2587)
v15 = v15.crop(left + 40, top + 10, right + 40, bot + 10)

v16 = full.trim(2588, 2888)
v16 = v16.crop(left + 40, top + 10, right + 40, bot + 10)

v17 = full.trim(2889, 3414)
v17 = v17.crop(left + 40, top + 10, right + 40, bot + 10)

v18 = full.trim(3415, 3521)
v18 = v18.crop(left + 40, top + 10, right + 40, bot + 10)

v19 = full.trim(3522, 3723)
v19 = v19.crop(left + 50, top + 20, right + 50, bot + 20).trim(0, 198) +\
      v19.crop(left + 50, top - 80, right + 50, bot - 80).trim(199, 199) +\
      v19.crop(left + 50, top + 20, right + 50, bot + 20).trim(200, 0)

v20 = full.trim(3726, 3832)
v20 = v20.crop(left + 50, top + 60, right + 50, bot + 60).trim(0, 2) +\
      v20.crop(left + 50, top + 10, right + 50, bot + 10).trim(3, 3) +\
      v20.crop(left + 50, top + 60, right + 50, bot + 60).trim(4, 0)

v21 = full.trim(3833, 3986)
v21 = v21.crop(left + 50, top + 60, right + 50, bot + 60)

v22 = full.trim(3987, 4059)
v22 = v22.crop(left + 50, top + 60, right + 50, bot + 60)

v23 = full.trim(4060, 4181)
v23 = v23.crop(left + 50, top + 60, right + 50, bot + 60)

v24 = full.trim(4182, 4229)
v24 = v24.crop(left + 50, top + 60, right + 50, bot + 60)

v25 = full.trim(4230, 4296)
v25 = v25.crop(left + 50, top + 40, right + 50, bot + 40)

v26 = full.trim(4298, 4458)
v26 = v26.crop(left + 50, top + 40, right + 50, bot + 40)

v27 = full.trim(4459, 4533)
v27 = v27.crop(left + 50, top + 40, right + 50, bot + 40)

v28 = full.trim(4534, 4585)
v28 = v28.crop(left + 50, top + 40, right + 50, bot + 40)

v29 = full.trim(4586, 4850)
v29 = v29.crop(left + 50, top + 60, right + 50, bot + 60).trim(0, 80) +\
      v29.crop(left + 50, top + 40, right + 50, bot + 40).trim(81, 152) +\
      v29.crop(left + 50, top + 20, right + 50, bot + 20).trim(153, 0)

v30 = full.trim(4851, 4920)
v30 = v30.crop(left + 50, top + 20, right + 50, bot + 20)

v31 = full.trim(4921, 5081)
v31 = v31.crop(left + 50, top + 20, right + 50, bot + 20)

v32 = full.trim(5082, 5151)
v32 = v32.crop(left + 50, top + 20, right + 50, bot + 20)

#return v1.adjustBorders.prefetch
#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#v2 = v2.AdjustColor(ou = +12, ov = -4, x=1000, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=0, sat=1.7, gam_mac=true)
#return v32.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=500, border_r=100)/*.histogram("levels")*/.prefetch
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