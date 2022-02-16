SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("L:\Mov\8mm film 2048x1536 18Fps.mov")
assumefps(18)

full = last

crop(36, 88, -48, -62)

w = width
h = height
w = w*1080/h
h = 1080

#spline64Resize(w, h)
#return last.autolevels(filterRadius=0, ignore_high=0.0003).histogram("levels").Prefetch(6)

# 8, 52, 91, 147, 182, 203, 256, 307, 348, 391, 418, 452, 494, 550, 582, 621, 691, 758, 788, 792, 830, 871, 920, 979, 1015, 1076,
# 1126, 1252, 1329, 1407, 1497, 1625, 1717, 1799, 1867, 1914, 1958, 2052, 2121, 2182, 2246, 2290, 2329, 2442, 2479, 2517, 2585,

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

v1 = full.trim(8, 51).crop(36, 88, -50, -60)
v2 = full.trim(52, 90).crop(36, 88, -50, -60)
v3 = full.trim(91, 146).crop(36, 88, -50, -60)
v4 = full.trim(147, 181).crop(36, 88, -70, -60)
v5 = full.trim(182, 202).crop(36, 88, -70, -60)
v6 = full.trim(203, 255).crop(36, 88, -50, -60)
v7 = full.trim(256, 306).crop(36, 88, -50, -60)
v8 = full.trim(307, 347).crop(36, 88, -50, -60)
v9 = full.trim(348, 390).crop(36, 88, -50, -60)
v10 = full.trim(391, 417).crop(36, 88, -50, -60)
v11 = full.trim(418, 451).crop(36, 88, -50, -60)
v12 = full.trim(452, 493).crop(36, 88, -50, -60)
v13 = full.trim(494, 549).crop(36, 88, -50, -60)
v14 = full.trim(550, 581).crop(36, 88, -50, -60)
v15 = full.trim(582, 620).crop(36, 88, -50, -60)
v16 = full.trim(621, 690).crop(36, 88, -50, -60)
v17 = full.trim(691, 757).crop(36, 88, -50, -60)
v18 = full.trim(758, 787).crop(36, 88, -50, -60)
#v19 = full.trim(788, 791).crop(36, 88, -50, -60)
v19 = full.trim(792, 829).crop(40, 98, -50, -60)
v20 = full.trim(830, 870).crop(36, 88, -50, -60)
v21 = full.trim(871, 919).crop(36, 88, -50, -60)
v22 = full.trim(920, 978).crop(36, 88, -50, -60)
v23 = full.trim(979, 1014).crop(36, 88, -50, -60)
v24 = full.trim(1015, 1075-15).crop(36, 88, -50, -60)
v25 = full.trim(1076+3, 1125).crop(36, 88, -50, -60)
v26 = full.trim(1126, 1251).crop(36, 88, -50, -60)
v27 = full.trim(1252+5, 1328).crop(36, 88, -50, -60)
v28 = full.trim(1329, 1406).crop(36, 88, -50, -60)
v29 = full.trim(1407, 1495).crop(36, 88, -50, -60)
v30 = full.trim(1497, 1624-20).crop(44, 88, -50, -60)
v31 = full.trim(1625, 1716).crop(44, 88, -50, -60)
v32 = full.trim(1717, 1798-15).crop(44, 88, -50, -60)
#return v19.adjustSize.adjustBorders

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

#******

# 1

v1 = LWLibavVideoSource(source_dir + "v1f.avi").ConvertToYV24()
v1 = v1.adjustSize()
v1 = v1.AdjustColor(ou=6, ov=-8, x=300, y=250, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=3, gam_mac=true, red=1, blu=1.0)
return v1.prefetch(6)
/*
v1 = LWLibavVideoSource(source_dir + "v1cg.avi")
v1 = v1.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v1 = v1.removeDirt
v1 = v1.trim(1, 0)
v1 = v1.convertToYV12
v1 = v1.UnsharpMask(strength=300, radius=3, threshold=1)
v1 = v1.adjustBorders
return v1.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate

v2 = LWLibavVideoSource(source_dir + "v2f.avi").ConvertToYV24()
v2 = v2.adjustSize()
v2 = v2.AdjustColor(ou=6, ov=-8, x=300, y=350, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=3, gam_mac=true, red=1)
v2 = v2.colorYUV(off_u=2, off_v=-2)
return v2.prefetch(6)
/*
v2 = LWLibavVideoSource(source_dir + "v2cg.avi")
v2 = v2.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v2 = v2.removeDirt
v2 = v2.trim(1, 0)
v2 = v2.convertToYV12
v2 = v2.UnsharpMask(strength=300, radius=3, threshold=1)
v2 = v2.adjustBorders
#return v2.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate

v3 = LWLibavVideoSource(source_dir + "v3f.avi").ConvertToYV24()
v3 = v3.adjustSize()
v3 = v3.AdjustColor(ou=8, ov=-8, x=500, y=300, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=3, gam_mac=true, red = 0.95, blu=1.02)
return v3.prefetch(6)
/*
v3 = LWLibavVideoSource(source_dir + "v3cg.avi")
v3 = v3.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v3 = v3.removeDirt
v3 = v3.trim(1, 0)
v3 = v3.convertToYV12
v3 = v3.UnsharpMask(strength=300, radius=3, threshold=1)
v3 = v3.adjustBorders
return v3.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate

v4 = LWLibavVideoSource(source_dir + "v4f.avi").ConvertToYV24()
v4 = v4.adjustSize()
v4 = v4.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v4 = v4.colorYUV(off_u=6, off_v=0)
return v4.prefetch(6)
/*
v4 = LWLibavVideoSource(source_dir + "v4cg.avi")
v4 = v4.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v4 = v4.removeDirt
v4 = v4.convertToYV12
v4 = v4.UnsharpMask(strength=300, radius=5, threshold=1)
v4 = v4.adjustBorders
return v4.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate

v5 = LWLibavVideoSource(source_dir + "v5f.avi").ConvertToYV24()
v5 = v5.adjustSize()
v5 = v5.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v5 = v5.colorYUV(off_u=6, off_v=0)
return v5.prefetch(6)
/*
v5 = LWLibavVideoSource(source_dir + "v5cg.avi")
v5 = v5.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v5 = v5.removeDirt
v5 = v5.trim(1, 0)
v5 = v5.convertToYV12
v5 = v5.UnsharpMask(strength=300, radius=5, threshold=1)
v5 = v5.adjustBorders
return v5.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate

v6 = LWLibavVideoSource(source_dir + "v6f.avi").ConvertToYV24()
v6 = v6.adjustSize()
v6 = v6.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v6 = v6.colorYUV(off_u=6, off_v=0)
return v6.prefetch(6)
#adjustframerate

v7 = LWLibavVideoSource(source_dir + "v7f.avi").ConvertToYV24()
v7 = v7.adjustSize()
v7 = v7.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v7 = v7.colorYUV(off_u=6, off_v=0)
return v7.prefetch(6)
#adjustframerate

v8 = LWLibavVideoSource(source_dir + "v8f.avi").ConvertToYV24()
v8 = v8.adjustSize()
v8 = v8.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v8 = v8.colorYUV(off_u=6, off_v=0)
return v8.prefetch(6)
#adjustframerate

v9 = LWLibavVideoSource(source_dir + "v9f.avi").ConvertToYV24()
v9 = v9.adjustSize()
v9 = v9.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, gam_mac=true)
v9 = v9.colorYUV(off_u=10, off_v=-20)
return v9.prefetch(6)
#adjustframerate

v10 = LWLibavVideoSource(source_dir + "v10f.avi").ConvertToYV24()
v10 = v10.adjustSize()
v10 = v10.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, gam_mac=true)
v10 = v10.colorYUV(off_u=10, off_v=-20)
return v10.prefetch(6)
#adjustframerate

v11 = LWLibavVideoSource(source_dir + "v11f.avi").ConvertToYV24()
v11 = v11.adjustSize()
v11 = v11.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, gam_mac=true)
v11 = v11.colorYUV(off_u=10, off_v=-20, gamma_y = -32)
return v11.prefetch(6)
#adjustframerate

v12 = LWLibavVideoSource(source_dir + "v12f.avi").ConvertToYV24()
v12 = v12.adjustSize()
v12 = v12.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=2, gam_mac=true)
v12 = v12.colorYUV(off_u=10, off_v=-20, gamma_y = 32)
return v12.prefetch(6)
#adjustframerate

v13 = LWLibavVideoSource(source_dir + "v13f.avi").ConvertToYV24()
v13 = v13.adjustSize()
v13 = v13.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=1.5, gam_mac=true)
v13 = v13.colorYUV(off_u=5, off_v=-5, gamma_y = 0)
return v13.prefetch(6)
#adjustframerate

v14 = LWLibavVideoSource(source_dir + "v14f.avi").ConvertToYV24()
v14 = v14.adjustSize()
v14 = v14.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=1.5, gam_mac=true)
v14 = v14.colorYUV(off_u=5, off_v=-5, gamma_y = 0)
return v14.prefetch(6)
#adjustframerate

v15 = LWLibavVideoSource(source_dir + "v15f.avi").ConvertToYV24()
v15 = v15.adjustSize()
v15 = v15.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, gam_mac=true)
v15 = v15.colorYUV(off_u=5, off_v=-5, gamma_y = 0)
return v15.prefetch(6)
#adjustframerate

v16 = LWLibavVideoSource(source_dir + "v16f.avi").ConvertToYV24()
v16 = v16.adjustSize()
v16 = v16.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=1.5, gam_mac=true)
v16 = v16.colorYUV(off_u=7, off_v=-7, gamma_y = 0)
return v16.prefetch(6)
#adjustframerate

v17 = LWLibavVideoSource(source_dir + "v17f.avi").ConvertToYV24()
v17 = v17.adjustSize()
v17 = v17.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, gam_mac=true)
v17 = v17.colorYUV(off_u=4, off_v=-4, gamma_y = 0)
return v17.prefetch(6)
#adjustframerate

v18 = LWLibavVideoSource(source_dir + "v18f.avi").ConvertToYV24()
v18 = v18.adjustSize()
v18 = v18.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, gam_mac=true)
v18 = v18.colorYUV(off_u=4, off_v=-4, gamma_y = 0)
return v18.prefetch(6)
#adjustframerate

v19 = LWLibavVideoSource(source_dir + "v19f.avi").ConvertToYV24()
v19 = v19.adjustSize()
v19 = v19.autolevels(minRng=0, input_low=32, input_high=60)
v19 = v19.AdjustColor(ou=20, ov=-12, x=100, y=100, w=-10, h=-100, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=0.5, gam_mac=false, blu=1,\
    bluePoints="0,0, 26, 0, 40,0, 48,0, 66,0, 86,0, 107,0, 120,0, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
return v19.prefetch(6)
#adjustframerate

v20 = LWLibavVideoSource(source_dir + "v20f.avi").ConvertToYV24()
v20 = v20.crop(14, 18, 0, 0)
v20 = v20.adjustSize()
v20 = v20.AdjustColor(ou=4, ov=-2, x=10, y=200, w=-10, h=-100, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=3, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v20 = v20.colorYUV(off_u=18, off_v=-18, gamma_y = 0)
return v20.prefetch(6)
#adjustframerate

v21 = LWLibavVideoSource(source_dir + "v21f.avi").ConvertToYV24()
v21 = v21.crop(4, 12, 0, 0)
v21 = v21.adjustSize()
v21 = v21.AdjustColor(ou=8, ov=-8, x=10, y=200, w=-10, h=-100, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v21 = v21.colorYUV(off_u=4, off_v=-8, gamma_y = 8)
return v21.prefetch(6)
#adjustframerate

v22 = LWLibavVideoSource(source_dir + "v22f.avi").ConvertToYV24()
v22 = v22.crop(14, 18, 0, 0)
v22 = v22.adjustSize()
v22 = v22.AdjustColor(ou=8, ov=-4, x=10, y=200, w=-10, h=-100, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2.5, grn=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v22 = v22.colorYUV(off_u=4, off_v=-8, gamma_y = 0)
return v22.prefetch(6)
#adjustframerate

v23 = LWLibavVideoSource(source_dir + "v23f.avi").ConvertToYV24()
v23 = v23.crop(14, 18, 0, 0)
v23 = v23.adjustSize()
v23 = v23.AdjustColor(ou=8, ov=-4, x=10, y=200, w=-10, h=-100, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2.5, grn=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v23 = v23.colorYUV(off_u=4, off_v=-10, gamma_y = 0)
return v23.prefetch(6)
#adjustframerate

v24 = LWLibavVideoSource(source_dir + "v24f.avi").ConvertToYV24()
v24 = v24.crop(4, 12, 0, 0)
v24 = v24.adjustSize()
v24 = v24.AdjustColor(ou=8, ov=-4, x=10, y=200, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, grn=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v24 = v24.colorYUV(off_u=10, off_v=-16, gamma_y = 0)
return v24.prefetch(6)
#adjustframerate

v25 = LWLibavVideoSource(source_dir + "v25f.avi").ConvertToYV24()
v25 = v25.crop(4, 12, 0, 0)
v25 = v25.adjustSize()
v25 = v25.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, grn=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v25 = v25.colorYUV(off_u=6, off_v=-12, gamma_y = 0)
return v25.prefetch(6)
#adjustframerate

v26 = LWLibavVideoSource(source_dir + "v26f.avi").ConvertToYV24()
v26 = v26.crop(16, 20, 0, 0)
v26 = v26.adjustSize()
v26 = v26.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=2.5, grn=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v26 = v26.colorYUV(off_u=16, off_v=-16, gamma_y = 0)
return v26.prefetch(6)
#adjustframerate

v27 = LWLibavVideoSource(source_dir + "v27f.avi").ConvertToYV24()
v27 = v27.crop(4, 12, 0, 0)
v27 = v27.adjustSize()
v27 = v27.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=2.5, grn=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v27 = v27.colorYUV(off_u=6, off_v=-6, gamma_y = 0)
return v27.prefetch(6)
#adjustframerate

v28 = LWLibavVideoSource(source_dir + "v28f.avi").ConvertToYV24()
v28 = v28.crop(4, 12, 0, 0)
v28 = v28.adjustSize()
v28 = v28.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2.5, grn=1, gam_mac=true)
v28 = v28.colorYUV(off_u=4, off_v=-4, gamma_y = 0)
return v28.prefetch(6)
#adjustframerate

v29 = LWLibavVideoSource(source_dir + "v29f.avi").ConvertToYV24()
v29 = v29.crop(4, 12, 0, 0)
v29 = v29.adjustSize()
v29 = v29.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2.5, red=0.9, grn=1.04, blu=0.95, gam_mac=true)
#v29 = v29.colorYUV(off_u=6, off_v=-6, gamma_y = 0)
return v29.prefetch(6)
#adjustframerate

v30 = LWLibavVideoSource(source_dir + "v30f.avi").ConvertToYV24()
v30 = v30.crop(4, 12, 0, 0)
v30 = v30.adjustSize()
v30 = v30.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v30 = v30.colorYUV(off_u=4, off_v=-12, gamma_y = 0)
return v30.prefetch(6)
#adjustframerate

v31 = LWLibavVideoSource(source_dir + "v31f.avi").ConvertToYV24()
v31 = v31.crop(4, 12, 0, 0)
v31 = v31.adjustSize()
v31 = v31.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v31 = v31.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v31.prefetch(6)
#adjustframerate

v32 = LWLibavVideoSource(source_dir + "v32f.avi").ConvertToYV24()
v32 = v32.crop(4, 12, 0, 0)
v32 = v32.adjustSize()
v32 = v32.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v32 = v32.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v32.prefetch(6)
#adjustframerate

#******

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

function Curves(clip c, string "bluePoints", string "greenPoints")
{
    return StrLen(bluePoints) == 0 && StrLen(greenPoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints, greenPoints=greenPoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac",\
                     string "bluePoints", string "greenPoints", float "sat")
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
    greenPoints = Default(greenPoints, "")
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints=bluePoints, greenPoints=greenPoints).\
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

function AdjustFrameRate(clip c, string "preset_p", string "output_p", int "blksize_p",\
                         int "Dct", int "DctRe", int "MaskThr", int "MaskOcc", int "SkipThr", bool "Stp", int "BlendRatio")
{
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
#    c = c.Histogram("levels").info
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1,\
                             blksize=blksize_p, Dct=Dct, DctRe=DctRe, MaskThr=MaskThr,\
                             MaskOcc=MaskOcc, SkipThr=SkipThr, Stp=Stp, BlendRatio=BlendRatio)#, stp=false)
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