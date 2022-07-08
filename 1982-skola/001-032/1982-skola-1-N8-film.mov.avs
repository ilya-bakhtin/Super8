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
# 3347, 3547, 3777, 3966, 4058, 4173, 4473, 4864, 5013, 5057, 5076, 5297, 5637, 5643, 5840, 5908, 6065, 6156, 6201, 6383, # 42
# 6608,

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

left = 180
right = 30
top = 110
bot = -92

v1 = full.trim(0, 78)
v1 = v1.animate(0, 5, "crop", 250, top, -10 - right, bot, 255, top, -5 - right, bot).trim(0, 5) +\
     v1.animate(6, 13, "crop", 255, top, -5 - right, bot, 210, top, -50 - right, bot).trim(6, 26) +\
     v1.crop(220, top, -40 - right, bot).trim(27, 29) +\
     v1.crop(210, top, -50 - right, bot).trim(30, 35) +\
     v1.animate(36, 49, "crop", 210, top, -50 - right, bot, 180, top, -80 - right, bot).trim(36, 0)

v2 = full.trim(79, 185)
right = 50
v2 = v2.crop(left, top, -80 - right, bot).trim(0, 19) +\
     v2.animate(20, 66, "crop", left, top, -80 - right, bot, left + 40, top, -40 - right, bot).trim(20, 71) +\
     v2.animate(72, 84, "crop", left + 40, top, -40 - right, bot, left + 30, top, -50 - right, bot).trim(72, 84) +\
     v2.animate(85, 95, "crop", left + 30, top, -50 - right, bot, left + 10, top, -70 - right, bot).trim(85, 98) +\
     v2.animate(99, 106, "crop", left + 10, top, -70 - right, bot, left + 30, top, -50 - right, bot).trim(99, 0)

v3 = full.trim(186, 316)
right = 50
v3 = v3.animate(0, 28, "crop", left + 30, top, -50 - right, bot, left + 5, top, -75 - right, bot).trim(0, 28) +\
     v3.animate(29, 67, "crop", left + 5, top, -75 - right, bot, left + 60, top, -20 - right, bot).trim(29, 0)

v4 = full.trim(318, 504)
right = 50
v4 = v4.animate(0, 30, "crop", left + 60, top, -20 - right, bot, left + 40, top, -40 - right, bot).trim(0, 30) +\
     v4.animate(31, 57, "crop", left + 40, top, -40 - right, bot, left + 20, top, -60 - right, bot).trim(31, 57) +\
     v4.animate(58, 70, "crop", left + 20, top, -60 - right, bot, left + 30, top, -50 - right, bot).trim(58, 70) +\
     v4.animate(71, 85, "crop", left + 30, top, -50 - right, bot, left + 15, top, -65 - right, bot).trim(71, 85) +\
     v4.animate(86, 114, "crop", left + 15, top, -65 - right, bot, left + 25, top, -55 - right, bot).trim(86, 114) +\
     v4.crop(left + 10, top, -70 - right, bot).trim(115, 0)

v5 = full.trim(505, 634)
right = 50
v5 = v5.animate(24, 39, "crop", left + 10, top, -70 - right, bot, left + 20, top, -60 - right, bot).trim(0, 39) +\
     v5.animate(40, 44, "crop", left + 20, top, -60 - right, bot, left + 10, top, -70 - right, bot).trim(40, 61) +\
     v5.animate(62, 92, "crop", left + 10, top, -70 - right, bot, left, top, -80 - right, bot).trim(62, 92) +\
     v5.animate(93, 103, "crop", left, top, -80 - right, bot, left + 20, top, -60 - right, bot).trim(93, 0)

v6 = full.trim(635, 792)
right = 60
v6 = v6.animate(0, 11, "crop", left + 20, top, -60 - right, bot, left + 10, top, -70 - right, bot).trim(0, 30) +\
     v6.animate(31, 40, "crop", left + 10, top, -70 - right, bot, left + 30, top, -50 - right, bot).trim(31, 40) +\
     v6.animate(41, 42, "crop", left + 30, top, -50 - right, bot, left + 25, top, -55 - right, bot).trim(41, 70) +\
     v6.animate(71, 75, "crop", left + 25, top, -55 - right, bot, left + 50, top, -30 - right, bot).trim(71, 78) +\
     v6.animate(79, 82, "crop", left + 50, top, -30 - right, bot, left + 60, top, -20 - right, bot).trim(79, 91) +\
     v6.animate(92, 97, "crop", left + 60, top, -20 - right, bot, left + 45, top, -35 - right, bot).trim(92, 99) +\
     v6.animate(100, 107, "crop", left + 52, top, -28 - right, bot, left + 60, top, -20 - right, bot).trim(100, 132) +\
     v6.animate(133, 135, "crop", left + 60, top, -20 - right, bot, left + 58, top, -22 - right, bot).trim(133, 0)

v7 = full.trim(793, 871)
right = 50
v7 = v7.animate(41, 45, "crop", left + 60, top, -20 - right, bot, left + 30, top, -50 - right, bot).trim(0, 49) +\
     v7.animate(50, 78, "crop", left + 30, top, -50 - right, bot, left - 5, top, -85 - right, bot).trim(50, 0)

v8 = full.trim(872, 961)
right = 50
v8 = v8.animate(16, 39, "crop", left - 10, top, -90 - right, bot, left + 30, top, -50 - right, bot).trim(0, 39) +\
     v8.animate(40, 58, "crop", left + 30, top, -50 - right, bot, left + 15, top, -65 - right, bot).trim(40, 67) +\
     v8.animate(68, 73, "crop", left + 15, top, -65 - right, bot, left + 25, top, -55 - right, bot).trim(68, 73) +\
     v8.animate(74, 83, "crop", left + 20, top, -60 - right, bot, left + 30, top, -50 - right, bot).trim(74, 0)

v9 = full.trim(963, 1022)
right = 50
v9 = v9.animate(0, 31, "crop", left + 30, top, -50 - right, bot, left + 15, top, -65 - right, bot).trim(0, 31) +\
     v9.animate(32, 59, "crop", left + 15, top, -65 - right, bot, left, top, -80 - right, bot).trim(32, 0)

v10 = full.trim(1023, 1163)
right = 40
v10 = v10.animate(0, 8, "crop", left, top, -80 - right, bot, left + 14, top, -66 - right, bot).trim(0, 8) +\
      v10.animate(9, 17, "crop", left + 14, top, -66 - right, bot, left + 20, top, -60 - right, bot).trim(9, 17) +\
      v10.animate(26, 31, "crop", left + 20, top, -60 - right, bot, left + 5, top, -75 - right, bot).trim(18, 31) +\
      v10.animate(92, 104, "crop", left + 10, top, -70 - right, bot, left + 40, top, -40 - right, bot).trim(32, 105) +\
      v10.animate(106, 110, "crop", left + 40, top, -40 - right, bot, left + 35, top, -45 - right, bot).trim(106, 111) +\
      v10.animate(112, 122, "crop", left + 35, top, -45 - right, bot, left + 20, top, -60 - right, bot).trim(112, 123) +\
      v10.animate(124, 135, "crop", left + 20, top, -60 - right, bot, left + 5, top, -75 - right, bot).trim(124, 135) +\
      v10.crop(left + 15, top, -65 - right, bot).trim(136, 0)

v11 = full.trim(1164, 1278)
right = 40
v11 = v11.animate(0, 13, "crop", left + 20, top, -60 - right, bot, left + 32, top, -48 - right, bot).trim(0, 14) +\
      v11.animate(15, 16, "crop", left + 32, top, -48 - right, bot, left + 25, top, -55 - right, bot).trim(15, 22) +\
      v11.animate(23, 24, "crop", left + 25, top, -55 - right, bot, left + 20, top, -60 - right, bot).trim(23, 26) +\
      v11.animate(27, 28, "crop", left + 20, top, -60 - right, bot, left + 15, top, -65 - right, bot).trim(27, 0)

right = 30
v12 = full.trim(1279, 1362).crop(left + 15, top, -65 - right, bot)

right = 50
v13 = full.trim(1364, 1492).crop(left + 20, top, -60 - right, bot)

right = 40
v14 = full.trim(1493, 1553).stackVertical(full.trim(1494, 1553).crop(8, 48, 0, 200).addBorders(0,0,8,0)).crop(0, 200, 0, 0)
v14 = v14.trim(1, v14.frameCount - 2).crop(left + 5, top, -75 - right, bot)

right = 50
v15 = full.trim(1555, 1739)
v15_0 = v15.animate(0, 15, "crop", left, top, -80 - right, bot, left + 15, top, -65 - right, bot).trim(0, 21) +\
      v15.animate(22, 24, "crop", left + 15, top, -65 - right, bot, left + 10, top, -70 - right, bot).trim(22, 27) +\
      v15.animate(28, 29, "crop", left + 10, top, -70 - right, bot, left + 5, top, -75 - right, bot).trim(28, 44) +\
      v15.animate(45, 56, "crop", left + 5, top, -75 - right, bot, left + 25, top, -55 - right, bot).trim(45, 69) +\
      v15.animate(70, 72, "crop", left + 25, top, -55 - right, bot, left + 18, top, -62 - right, bot).trim(70, 73) +\
      v15.animate(74, 75, "crop", left + 18, top, -62 - right, bot, left + 8, top, -72 - right, bot).trim(74, 116) +\
      v15.animate(117, 124, "crop", left + 8, top, -72 - right, bot, left + 25, top, -55 - right, bot).trim(117, 123) +\
      v15.animate(124, 132, "crop", left + 25, top, -55 - right, bot, left + 15, top, -65 - right, bot).trim(124, 146) +\
      v15.animate(147, 148, "crop", left + 15, top, -65 - right, bot, left + 25, top, -55 - right, bot).trim(147, 162) +\
      v15.animate(163, 172, "crop", left + 25, top, -55 - right, bot, left + 104, top, 24 - right, bot).trim(163, 174)
v15_1 = v15.animate(175, 184, "crop", left + 94, top, 14 - right, bot, left + 10, top, -70 - right, bot).trim(175, 0)
v15_2 = v15.animate(175, 184, "crop", left + 94, top - 60, 14 - right, bot - 60, left + 10, top - 60, -70 - right, bot - 60).trim(175, 0)
v15_3 = v15.animate(175, 184, "crop", left + 94, top - 110, 14 - right, bot - 110, left + 10, top - 110, -70 - right, bot - 110).trim(175, 0)
v15 = v15_0 + v15_1.trim(0, 3) + v15_2.trim(4, 4) + v15_3.trim(5, 5) + v15_1.trim(6, 0)

right = 38
top = top + 50
bot = bot + 44
v16 = full.trim(1742, 2152)
v16 = v16.animate(0, 116, "crop", left, 0/*top + 48*/, -80 - right, 0/*bot + 48*/, left + 35, 0/*top*/, -45 - right, 0/*bot*/)
v16 = v16.animate(70, 116, "crop", 0/*left*/, top + 48, 0/*-80 - right*/, bot + 48, 0/*left + 35*/, top, 0/*-45 - right*/, bot)

right = 30
bot = bot + 6  # 50
v17 = full.trim(2154, 2313).crop(left + 40, top, -40 - right, bot)
v18 = full.trim(2314, 2434).crop(left + 50, top, -30 - right, bot)
v19 = full.trim(2435, 2645).crop(left + 50, top, -30 - right, bot)

right = 40
top = top - 8
bot = bot - 16
v20 = full.trim(2659, 2852).crop(left + 50, top, -30 - right, bot)

right = 30
top = top + 8
bot = bot + 16
v21 = full.trim(2853, 2998).crop(left + 55, top, -25 - right, bot)

right = 50
top = top + 8  # 58
bot = bot - 4 - 4 # 42
v22 = full.trim(3009, 3344)
v22 = v22.animate(71, 126, "crop", left + 60, top, -20 - right, bot, left + 90, top, 10 - right, bot).trim(0, 129) +\
      v22.animate(130, 185, "crop", left + 90, top, 10 - right, bot, left + 60, top, -20 - right, bot).trim(130, 228) +\
      v22.animate(229, 331, "crop", left + 60, top, -20 - right, bot, left + 40, top, -40 - right, bot).trim(229, 330) +\
      v22.animate(331, 335, "crop", left + 40, top, -40 - right, bot, left + 60, top, -20 - right, bot).trim(331, 0)

right = 44
top = top - 8  # 50
bot = bot - 8 + 4 # 38
v23 = full.trim(3347, 3546).crop(left + 55, top, -25 - right, bot)

right = 50
top = top - 4  # 46
bot = bot - 8  # 30
v24 = full.trim(3547, 3776)
v24 = v24.animate(29, 43, "crop", left + 55, top, -25 - right, bot, left + 80, top, -0 - right, bot)

right = 52
bot = bot + 8  # 22
v25 = full.trim(3777, 3965).crop(left + 55, top, -25 - right, bot)
top = top + 10  # 56
bot = bot +  0  # 30
v26 = full.trim(3966, 4057).crop(left + 55, top, -25 - right, bot)
v27 = full.trim(4058, 4172).crop(left + 65, top, -15 - right, bot)
v28 = full.trim(4173, 4472).crop(left + 65, top, -15 - right, bot)
v29 = full.trim(4473, 4863).crop(left + 55, top, -25 - right, bot)
v30 = full.trim(4864, 5012).crop(left + 65, top, -15 - right, bot)
v31 = full.trim(5013, 5056).crop(left + 65, top, -15 - right, bot)

top = top - 10
bot = bot - 10
v32 = full.trim(5058, 5074) #5282)
v32 = v32.crop(left + 60, top, -20 - right, bot).trim(0, 11) +\
      v32.crop(left + 60, top - 15, -20 - right, bot - 15).trim(12, 12) +\
      v32.crop(left + 60, top, -20 - right, bot).trim(13, 13) +\
      v32.crop(left + 60, top - 80, -20 - right, bot - 80).trim(14, 14) +\
      v32.crop(left + 60, top - 20, -20 - right, bot - 20).trim(15, 15) +\
      v32.crop(left + 60, top, -20 - right, bot).trim(16, 16) +\
      v32.crop(left + 60, top - 40, -20 - right, bot - 40).trim(17, 17) #+\
      v32.animate(150, 162, "crop", left + 60, top, -20 - right, bot, left + 25, top, -55 - right, bot).trim(18, 163) +\
      v32.animate(164, 169, "crop", left + 25, top, -55 - right, bot, left + 50, top, -30 - right, bot).trim(164, 214) +\
      v32.animate(215, 224, "crop", left + 50, top, -30 - right, bot, left + 105, top, 25 - right, bot).trim(215, 0)

#return v3.adjustSize.adjustBorders.prefetch
#return src.adjustBorders.info.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 1

v1 = LWLibavVideoSource(source_dir + "v1f.avi", cache=false).ConvertToYV24()
v1 = v1.AdjustColor(ou=0, ov=0, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v1 = v1.colorYUV(off_u=-2, off_v=4)
v1 = v1.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v1 = v1.adjustSize
v1 = v1.assumeFPS(12)
return v1.prefetch
#adjustframerate

v2 = LWLibavVideoSource(source_dir + "v2f.avi", cache=false).ConvertToYV24()
v2 = v2.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v2 = v2.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
return v2.prefetch
#adjustframerate

v3 = LWLibavVideoSource(source_dir + "v3f.avi", cache=false).ConvertToYV24()
v3 = v3.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v3 = v3.adjustSize
v3 = v3.assumeFPS(12)
return v3.prefetch
#adjustframerate

v4 = LWLibavVideoSource(source_dir + "v4f.avi", cache=false).ConvertToYV24()
v4 = v4.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v4 = v4.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
return v4.prefetch
#adjustframerate

v5 = LWLibavVideoSource(source_dir + "v5f.avi", cache=false).ConvertToYV24()
v5 = v5.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v5 = v5.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v5 = v5.adjustSize
v5 = v5.assumeFPS(18)
return v5.prefetch
#adjustframerate

v6 = LWLibavVideoSource(source_dir + "v6f.avi", cache=false).ConvertToYV24()
v6 = v6.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v6 = v6.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
return v6.prefetch
#adjustframerate

v7 = LWLibavVideoSource(source_dir + "v7f.avi", cache=false).ConvertToYV24()
v7 = v7.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v7 = v7.adjustSize
v7 = v7.assumeFPS(18)
return v7.prefetch
#adjustframerate

v8 = LWLibavVideoSource(source_dir + "v8f.avi", cache=false).ConvertToYV24()
v8 = v8.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v8 = v8.adjustSize
v8 = v8.assumeFPS(18)
return v8.prefetch
#adjustframerate

v9 = LWLibavVideoSource(source_dir + "v9f.avi", cache=false).ConvertToYV24()
v9 = v9.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
return v9.prefetch
#adjustframerate

v10 = LWLibavVideoSource(source_dir + "v10f.avi", cache=false).ConvertToYV24()
v10 = v10.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v10 = v10.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
return v10.prefetch
#adjustframerate

v11 = LWLibavVideoSource(source_dir + "v11f.avi", cache=false).ConvertToYV24()
v11 = v11.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
return v11.prefetch
#adjustframerate

v12 = LWLibavVideoSource(source_dir + "v12f.avi", cache=false).ConvertToYV24()
v12 = v12.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v12 = v12.adjustSize
v12 = v12.assumeFPS(18)
return v12.prefetch
#adjustframerate

v13 = LWLibavVideoSource(source_dir + "v13f.avi", cache=false).ConvertToYV24()
v13 = v13.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v13 = v13.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v13 = v13.adjustSize
v13 = v13.assumeFPS(12)
return v13.prefetch
#adjustframerate

v14 = LWLibavVideoSource(source_dir + "v14f.avi", cache=false).ConvertToYV24()
v14 = v14.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v14 = v14.adjustSize
v14 = v14.assumeFPS(12)
return v14.prefetch
#adjustframerate

v15 = LWLibavVideoSource(source_dir + "v15f.avi", cache=false).ConvertToYV24()
v15 = v15.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
return v15.prefetch
#adjustframerate

v16 = LWLibavVideoSource(source_dir + "v16f.avi", cache=false).ConvertToYV24()
v16 = v16.AdjustColor(ou=0, ov=0, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v16 = v16.adjustSize
v16 = v16.assumeFPS(18)
return v16.prefetch
#adjustframerate

v17 = LWLibavVideoSource(source_dir + "v17f.avi", cache=false).ConvertToYV24()
v17 = v17.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v17 = v17.adjustSize
v17 = v17.assumeFPS(18)
return v17.prefetch
#adjustframerate

v18 = LWLibavVideoSource(source_dir + "v18f.avi", cache=false).ConvertToYV24()
v18 = v18.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
return v18.prefetch
#adjustframerate

v19 = LWLibavVideoSource(source_dir + "v19f.avi", cache=false).ConvertToYV24()
v19 = v19.AdjustColor(ou=0, ov=0, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
return v19.prefetch
#adjustframerate

v20 = LWLibavVideoSource(source_dir + "v20f.avi", cache=false).ConvertToYV24()
v20 = v20.AdjustColor(ou=0, ov=0, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
return v20.prefetch
#adjustframerate

v21 = LWLibavVideoSource(source_dir + "v21f.avi", cache=false).ConvertToYV24()
v21 = v21.AdjustColor(ou=0, ov=0, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v21 = v21.adjustSize
v21 = v21.assumeFPS(18)
return v21.prefetch
#adjustframerate

v22 = LWLibavVideoSource(source_dir + "v22f.avi", cache=false).ConvertToYV24()
v22 = v22.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v22 = v22.adjustSize
v22 = v22.assumeFPS(18)
return v22.prefetch
#adjustframerate

v23 = LWLibavVideoSource(source_dir + "v23f.avi", cache=false).ConvertToYV24()
v23 = v23.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
return v23.prefetch
#adjustframerate

v24 = LWLibavVideoSource(source_dir + "v24f.avi", cache=false).ConvertToYV24()
v24 = v24.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v24 = v24.adjustSize
v24 = v24.assumeFPS(18)
return v24.prefetch
#adjustframerate

v25 = LWLibavVideoSource(source_dir + "v25f.avi", cache=false).ConvertToYV24()
v25 = v25.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
return v25.prefetch
#adjustframerate

v26 = LWLibavVideoSource(source_dir + "v26f.avi", cache=false).ConvertToYV24()
v26 = v26.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
return v26.prefetch
#adjustframerate

v27 = LWLibavVideoSource(source_dir + "v27f.avi", cache=false).ConvertToYV24()
v27 = v27.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
return v27.prefetch
#adjustframerate

v28 = LWLibavVideoSource(source_dir + "v28f.avi", cache=false).ConvertToYV24()
v28 = v28.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
return v28.prefetch
#adjustframerate

v29 = LWLibavVideoSource(source_dir + "v29f.avi", cache=false).ConvertToYV24()
v29 = v29.AdjustColor(ou=0, ov=0, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
return v29.prefetch
#adjustframerate

v30 = LWLibavVideoSource(source_dir + "v30f.avi", cache=false).ConvertToYV24()
v30 = v30.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
return v30.prefetch
#adjustframerate

v31 = LWLibavVideoSource(source_dir + "v31f.avi", cache=false).ConvertToYV24()
v31 = v31.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v31 = v31.adjustSize
v31 = v31.assumeFPS(18)
return v31.prefetch
#adjustframerate

v32 = LWLibavVideoSource(source_dir + "v32f.avi", cache=false).ConvertToYV24()
#v32 = v32.colorYUV(off_y=6)
#v32 = v32.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v32 = v32.AdjustColor(ou=0, ov=0, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
#v32 = v32.colorYUV(off_u=-2, off_v=4)
#v32 = v32.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
#return v32.histogram("levels").prefetch
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
return v32.prefetch
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