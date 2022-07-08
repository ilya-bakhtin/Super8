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
# 9560, 9721, 9841, 9936, 10049, 10226, 10496, 10757, 10798, 11000, 11182, 11570, 11604, 11913, 12377, 12428, 12556, 12731, # 80
#
# skipped
# (7525, 7534)
# (7767, 7771)

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

v33 = full.trim(5077, 5290)
v33 = v33.animate(0, 26, "crop", left + 44, top + 60, right - 88, bot + 20, left + 64, top + 60, right - 68, bot + 20).trim(0, 26) +\
      v33.animate(34, 44, "crop", left + 64, top + 60, right - 68, bot + 20, left + 42, top + 60, right - 90, bot + 20).trim(27, 44) +\
      v33.animate(44, 74, "crop", left + 42, top + 60, right - 90, bot + 20, left + 64, top + 60, right - 68, bot + 20).trim(45, 74) +\
      v33.animate(134, 143, "crop", left + 64, top + 60, right - 68, bot + 20, left + 24, top + 60, right - 108, bot + 20).trim(75, 143) +\
      v33.animate(143, 146, "crop", left + 24, top + 60, right - 108, bot + 20, left + 74, top + 60, right - 58, bot + 20).trim(144, 199) +\
      v33.animate(200, 210, "crop", left + 74, top + 60, right - 58, bot + 20, left + 138, top + 60, right + 6, bot + 20).trim(200, 210) +\
      v33.animate(210, 213, "crop", left + 138, top + 60, right + 6, bot + 20, left + 100, top + 60, right - 32, bot + 20).trim(211, 213)

right = ref_right - 30
v34 = full.trim(5300, 5636)
v34 = v34.animate(0, 5, "crop", left, top + 60, right - 92, bot + 28, left + 60, top + 60, right - 32, bot + 28).trim(0, 5) +\
      v34.animate(5, 7, "crop", left + 60, top + 60, right - 32, bot + 28, left + 68, top + 60, right - 24, bot + 28).trim(6, 7) +\
      v34.animate(7, 33, "crop", left + 68, top + 60, right - 24, bot + 28, left + 40, top + 60, right - 52, bot + 28).trim(8, 54) +\
      v34.animate(55, 68, "crop", left + 40, top + 60, right - 52, bot + 28, left + 60, top + 60, right - 32, bot + 28).trim(55, 68) +\
      v34.animate(68, 117, "crop", left + 60, top + 60, right - 32, bot + 28, left + 40, top + 60, right - 52, bot + 28).trim(69, 137) +\
      v34.animate(138, 152, "crop", left + 40, top + 60, right - 52, bot + 28, left + 70, top + 60, right - 22, bot + 28).trim(138, 152) +\
      v34.animate(152, 183, "crop", left + 70, top + 60, right - 22, bot + 28, left + 58, top + 60, right - 34, bot + 28).trim(153, 0)

left = ref_left - 8
right = ref_right + 52
top = ref_top - 40
bot = ref_bot + 6
v35 = full.trim(5637, 5642)
v35 = v35.crop(left + 44, top + 60, right - 88, bot + 20)

left = ref_left + 8
right = ref_right + 16
top = ref_top
bot = ref_bot + 6
v36 = full.trim(5643, 5839)
v36 = v36.crop(left + 44, top + 60, right - 88, bot + 20)

left = ref_left
right = ref_right
top = ref_top
bot = ref_bot
v37 = full.trim(5840, 5907)
v37 = v37.crop(left + 44, top + 60, right - 88, bot + 20)

v38 = full.trim(5908, 6064)
v38 = v38.crop(left + 38, top + 30, right - 54, bot + 20)

v39 = full.trim(6065, 6155)
v39 = v39.crop(left + 52, top + 50, right - 54, bot + 30)

v40 = full.trim(6156, 6200)
v40 = v40.crop(left + 52, top + 40, right - 54, bot + 20)

v41 = full.trim(6201, 6382)
v41 = v41.crop(left + 58, top + 50, right - 60, bot + 20)

v42 = full.trim(6383, 6607)
v42 = v42.crop(left + 58, top + 50, right - 60, bot + 20)

v43 = full.trim(6608, 6805)
v43 = v43.crop(left + 58, top + 50, right - 60, bot + 20)

v44 = full.trim(6807, 6858)
v44 = v44.crop(left + 58, top + 50, right - 60, bot + 20)

v45 = full.trim(6859, 7000)
v45 = v45.crop(left + 58, top + 50, right - 60, bot + 20)

v46 = full.trim(7003, 7025)
v46 = v46.animate(15, 22, "crop", left + 50, 0, right - 68, 0, left + 118, 0, right, 0)
v46 = v46.crop(0, top + 50, 0, bot + 20).trim(0, 15) +\
      v46.crop(0, top + 30, 0, bot + 00).trim(16, 16) +\
      v46.crop(0, top - 30, 0, bot - 60).trim(17, 17) +\
      v46.crop(0, top - 50, 0, bot - 80).trim(18, 18) +\
      v46.crop(0, top + 50, 0, bot + 20).trim(19, 0)

v47 = full.trim(7028, 7524)
v47 = v47.crop(left + 48, top + 50, right - 70, bot + 20)

#v48 = full.trim(7525, 7534)
v48 = full.trim(7535, 7634)
v48 = v48.crop(left + 58, top + 50, right - 60, bot + 20)

v49 = full.trim(7636, 7765)
v49 = v49.crop(left + 58, top + 50, right - 60, bot + 20)

#v50 = full.trim(7767, 7771)
v50 = full.trim(7773, 7839)
v50 = v50.crop(left + 58, top + 50, right - 60, bot + 20)

v51 = full.trim(7841, 7965)
v51 = v51.crop(left + 58, top + 50, right - 60, bot + 20)

v52 = full.trim(7967, 8248)
v52 = v52.crop(left + 68, top + 40, right - 50, bot + 10)

v53 = full.trim(8249, 8438)
v53 = v53.crop(left + 68, top + 40, right - 50, bot + 10)

v54 = full.trim(8439, 8724)
v54 = v54.crop(left + 68, top + 40, right - 50, bot + 10)

v55 = full.trim(8725, 8807)
v55 = v55.crop(left + 68, top + 30, right - 50, bot + 00)

v56 = full.trim(8809, 8893)
v56 = v56.crop(left + 68, top + 30, right - 50, bot + 00)

v57 = full.trim(8894, 9037)
v57 = v57.crop(left + 68, top + 30, right - 50, bot + 00)

v58 = full.trim(9038, 9223)
v58 = v58.crop(left + 68, top + 30, right - 50, bot + 00)

v59 = full.trim(9224, 9392)
v59 = v59.crop(left + 68, top + 30, right - 50, bot + 00)

v60 = full.trim(9393, 9559)
v60 = v60.crop(left + 68, top + 30, right - 50, bot + 00)

v61 = full.trim(9560, 9720)
v61 = v61.crop(left + 58, top + 30, right - 60, bot + 00).trim(0, 9) +\
      v61.crop(left + 48, top + 30, right - 70, bot + 00).trim(10, 0)

v62 = full.trim(9721, 9840)
v62 = v62.crop(left + 48, top + 30, right - 70, bot + 00)

v63 = full.trim(9841, 9935)
v63 = v63.crop(left + 48, top + 30, right - 70, bot + 00)

v64 = full.trim(9936, 10048)
v64 = v64.crop(left + 48, top + 30, right - 70, bot + 00)

#return v64.adjustSize.adjustBorders.prefetch
#return src.adjustBorders.info.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 33

v33 = LWLibavVideoSource(source_dir + "v33f.avi", cache=false).ConvertToYV24()
v33 = v33.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
return v33.prefetch
#adjustframerate

v34 = LWLibavVideoSource(source_dir + "v34f.avi", cache=false).ConvertToYV24()
br = v34.trim(250, 250).loop(v34.frameCount).crop(700, 0, -650, 0)
v34 = v34.stackHorizontal(br)
v34 = v34.AdjustColor(ou=2, ov=-2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v34 = v34.crop(0, 0, -br.width, 0)
v34 = v34.colorYUV(off_u=-4, off_v=2)
v34 = v34.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1)
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
return v34.prefetch
#adjustframerate

v35 = LWLibavVideoSource(source_dir + "v35f.avi", cache=false).ConvertToYV24()
v35 = v35.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v35 = v35.colorYUV(off_u=-4, off_v=2)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
return v35.prefetch
#adjustframerate

v36 = LWLibavVideoSource(source_dir + "v36f.avi", cache=false).ConvertToYV24()
v36 = v36.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v36 = v36.colorYUV(off_u=-4, off_v=2)
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
return v36.prefetch
#adjustframerate

v37 = LWLibavVideoSource(source_dir + "v37f.avi", cache=false).ConvertToYV24()
v37 = v37.AdjustColor(ou=2, ov=2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v37 = v37.colorYUV(off_u=-4, off_v=2)
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
return v37.prefetch
#adjustframerate

v38 = LWLibavVideoSource(source_dir + "v38f.avi", cache=false).ConvertToYV24()
v38 = v38.AdjustColor(ou=0, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v38 = v38.colorYUV(off_u=-4, off_v=2)
v38 = v38.adjustSize
v38 = v38.assumeFPS(18)
return v38.prefetch
#adjustframerate

v39 = LWLibavVideoSource(source_dir + "v39f.avi", cache=false).ConvertToYV24()
v39 = v39.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v39 = v39.colorYUV(off_u=-4, off_v=2)
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
return v39.prefetch
#adjustframerate

v40 = LWLibavVideoSource(source_dir + "v40f.avi", cache=false).ConvertToYV24()
v40 = v40.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
return v40.prefetch
#adjustframerate

v41 = LWLibavVideoSource(source_dir + "v41f.avi", cache=false).ConvertToYV24()
v41 = v41.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
return v41.prefetch
#adjustframerate

v42 = LWLibavVideoSource(source_dir + "v42f.avi", cache=false).ConvertToYV24()
v42 = v42.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v42 = v42.colorYUV(off_u=-4, off_v=0)
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
return v42.prefetch
#adjustframerate

v43 = LWLibavVideoSource(source_dir + "v43f.avi", cache=false).ConvertToYV24()
v43 = v43.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v43 = v43.colorYUV(off_u=-4, off_v=0)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
return v43.prefetch
#adjustframerate

v44 = LWLibavVideoSource(source_dir + "v44f.avi", cache=false).ConvertToYV24()
v44 = v44.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v44 = v44.colorYUV(off_u=-4, off_v=4)
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
return v44.prefetch
#adjustframerate

v45 = LWLibavVideoSource(source_dir + "v45f.avi", cache=false).ConvertToYV24()
v45 = v45.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v45 = v45.colorYUV(off_u=-4, off_v=4)
v45 = v45.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
return v45.prefetch
#adjustframerate

v46 = LWLibavVideoSource(source_dir + "v46f.avi", cache=false).ConvertToYV24()
v46 = v46.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v46 = v46.colorYUV(off_u=-4, off_v=0)
v46 = v46.adjustSize
v46 = v46.assumeFPS(18)
return v46.prefetch
#adjustframerate

v47 = LWLibavVideoSource(source_dir + "v47f.avi", cache=false).ConvertToYV24()
v47 = v47.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v47 = v47.colorYUV(off_u=-4, off_v=0)
v47 = v47.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
return v47.prefetch
#adjustframerate

v48 = LWLibavVideoSource(source_dir + "v48f.avi", cache=false).ConvertToYV24()
v48 = v48.AdjustColor(ou=2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v48 = v48.colorYUV(off_u=-8, off_v=2)
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
return v48.prefetch
#adjustframerate

v49 = LWLibavVideoSource(source_dir + "v49f.avi", cache=false).ConvertToYV24()
v49 = v49.AdjustColor(ou=2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v49 = v49.colorYUV(off_u=-8, off_v=-2)
v49 = v49.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
return v49.prefetch
#adjustframerate

v50 = LWLibavVideoSource(source_dir + "v50f.avi", cache=false).ConvertToYV24()
v50 = v50.AdjustColor(ou=2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v50 = v50.colorYUV(off_u=-8, off_v=2)
v50 = v50.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
return v50.prefetch
#adjustframerate

v51 = LWLibavVideoSource(source_dir + "v51f.avi", cache=false).ConvertToYV24()
v51 = v51.AdjustColor(ou=2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v51 = v51.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
return v51.prefetch
#adjustframerate

v52 = LWLibavVideoSource(source_dir + "v52f.avi", cache=false).ConvertToYV24()
v52 = v52.AdjustColor(ou=-2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v52 = v52.colorYUV(off_u=0, off_v=-2)
v52 = v52.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
return v52.prefetch
#adjustframerate

v53 = LWLibavVideoSource(source_dir + "v53f.avi", cache=false).ConvertToYV24()
v53 = v53.AdjustColor(ou=-2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v53 = v53.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
return v53.prefetch
#adjustframerate

v54 = LWLibavVideoSource(source_dir + "v54f.avi", cache=false).ConvertToYV24()
v54 = v54.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v54 = v54.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
return v54.prefetch
#adjustframerate

v55 = LWLibavVideoSource(source_dir + "v55f.avi", cache=false).ConvertToYV24()
v55 = v55.AdjustColor(ou=-2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v55 = v55.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v55 = v55.adjustSize
v55 = v55.assumeFPS(18)
return v55.prefetch
#adjustframerate

v56 = LWLibavVideoSource(source_dir + "v56f.avi", cache=false).ConvertToYV24()
v56 = v56.AdjustColor(ou=-2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v56 = v56.colorYUV(off_u=-2, off_v=0)
v56 = v56.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
return v56.prefetch
#adjustframerate

v57 = LWLibavVideoSource(source_dir + "v57f.avi", cache=false).ConvertToYV24()
v57 = v57.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v57 = v57.colorYUV(off_u=-4, off_v=4)
v57 = v57.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
return v57.prefetch
#adjustframerate

v58 = LWLibavVideoSource(source_dir + "v58f.avi", cache=false).ConvertToYV24()
v58 = v58.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v58 = v58.colorYUV(off_u=-4, off_v=4)
v58 = v58.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
return v58.prefetch
#adjustframerate

v59 = LWLibavVideoSource(source_dir + "v59f.avi", cache=false).ConvertToYV24()
v59 = v59.AdjustColor(ou=-2, ov=-2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v59 = v59.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
return v59.prefetch
#adjustframerate

v60 = LWLibavVideoSource(source_dir + "v60f.avi", cache=false).ConvertToYV24()
v60 = v60.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v60 = v60.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.4)
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
return v60.prefetch
#adjustframerate

v61 = LWLibavVideoSource(source_dir + "v61f.avi", cache=false).ConvertToYV24()
v61 = v61.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v61 = v61.colorYUV(off_u=-4, off_v=4)
v61 = v61.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.4)
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
return v61.prefetch
#adjustframerate

v62 = LWLibavVideoSource(source_dir + "v62f.avi", cache=false).ConvertToYV24()
v62 = v62.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v62 = v62.colorYUV(off_u=-2, off_v=-2)
v62 = v62.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
return v62.prefetch
#adjustframerate

v63 = LWLibavVideoSource(source_dir + "v63f.avi", cache=false).ConvertToYV24()
v63 = v63.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v63 = v63.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
return v63.prefetch
#adjustframerate

v64 = LWLibavVideoSource(source_dir + "v64f.avi", cache=false).ConvertToYV24()
#v64 = v64.colorYUV(off_y=6)
#v64 = v64.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v64 = v64.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v64 = v64.colorYUV(off_u=-6, off_v=-2)
v64 = v64.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
#return v64.histogram("levels").prefetch
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
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
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode )
}
/*
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/