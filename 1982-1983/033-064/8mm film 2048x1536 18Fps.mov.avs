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
# 2669, 2719, 2777, 2833, 2935, 2992, 3106, 3208, 3272, 3331, 3387, 3457, 3509, 3577, 3597, 3640, 3686, 3729, 3785, 3825, 3887

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v32 = full.trim(1717, 1798-15).crop(44, 88, -50, -60)
v33 = full.trim(1799+1, 1866).crop(44, 88, -50, -60)
v34 = full.trim(1867, 1913-1).crop(40, 94, -50, -48)
v35 = full.trim(1914, 1957).crop(40, 94, -50, -48)
v36 = full.trim(1958+4, 2051).crop(40, 94, -50, -48)
v37 = full.trim(2052, 2120).crop(40, 98, -50, -46)
v38 = full.trim(2121, 2181).crop(40, 96, -50, -46)
v39 = full.trim(2182, 2245).crop(40, 90, -50, -54)
v40 = full.trim(2246, 2289).crop(40, 102, -50, -44)
v41 = full.trim(2290, 2328).crop(40, 98, -50, -56)
v42 = full.trim(2329, 2441).crop(40, 102, -50, -44)
v43 = full.trim(2442, 2478).crop(40, 102, -50, -44)
v43 = full.trim(2479, 2516).crop(40, 98, -50, -44)
v44 = full.trim(2517, 2584).crop(40, 94, -50, -48)
v45 = full.trim(2585, 2668).crop(40, 94, -50, -52)
v46 = full.trim(2669, 2718).crop(44, 98, -50, -52)
v47 = full.trim(2719, 2776).crop(44, 96, -50, -54)
v48 = full.trim(2777, 2832).crop(44, 100, -50, -50)
v49 = full.trim(2833, 2934).crop(44, 100, -50, -50)
v50 = full.trim(2935, 2991).crop(40, 100, -50, -48)
v51 = full.trim(2992, 3105).crop(40, 100, -50, -48)
v52 = full.trim(3106, 3207).crop(44, 100, -50, -48)
v53 = full.trim(3208, 3271).crop(44, 100, -50, -48)
v54 = full.trim(3272, 3330).crop(44, 92, -50, -56)
v55 = full.trim(3331, 3386).crop(44, 92, -50, -56)
v56 = full.trim(3387, 3456).crop(44, 92, -50, -60)
v57 = full.trim(3457, 3508).crop(44, 92, -50, -56)
v58 = full.trim(3509, 3570).crop(44, 92, -50, -56) +\
      full.trim(3571, -1).crop(58, 82, -36, -66) +\
      full.trim(3572, -1).crop(66, 82, -28, -66) +\
      full.trim(3573, -1).crop(56, 52, -38, -96) +\
      full.trim(3574, -1).crop(52, 110, -42, -38) +\
      full.trim(3575, -1).crop(40, 140, -54, -8)
v59 = full.trim(3578, 3595).crop(70, 92, -24, -56)
v60 = full.trim(3597, 3639).crop(64, 92, -30, -56)
v61 = full.trim(3640, 3685).crop(64, 92, -40, -56)
v62 = full.trim(3686, 3728).crop(54, 108, -54, -48)
v63 = full.trim(3729, 3784).crop(54, 92, -54, -56)
v64 = full.trim(3785, 3824).crop(58, 112, -42, -46)
#return v64

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

#******

# 33

v33 = LWLibavVideoSource(source_dir + "v33f.avi").ConvertToYV24()
v33 = v33.crop(0, 12, 0, 0)
v33 = v33.adjustSize()
v33 = v33.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)#,\
#    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v33 = v33.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v33.prefetch(6)
#adjustframerate

v34 = LWLibavVideoSource(source_dir + "v34f.avi").ConvertToYV24()
v34 = v34.crop(0, 12, 0, -4)
v34 = v34.adjustSize()
v34 = v34.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v34 = v34.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v34.prefetch(6)
#adjustframerate

v35 = LWLibavVideoSource(source_dir + "v35f.avi").ConvertToYV24()
v35 = v35.crop(0, 12, 0, -4)
v35 = v35.adjustSize()
v35 = v35.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v35 = v35.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v35.prefetch(6)
#adjustframerate

v36 = LWLibavVideoSource(source_dir + "v36f.avi").ConvertToYV24()
#v36 = v36.crop(0, 12, 0, -4)
v36 = v36.adjustSize()
v36 = v36.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v36 = v36.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v36.prefetch(6)
#adjustframerate

v37 = LWLibavVideoSource(source_dir + "v37f.avi").ConvertToYV24()
#v37 = v37.crop(0, 12, 0, -4)
v37 = v37.adjustSize()
v37 = v37.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v37 = v37.colorYUV(off_u=0, off_v=0, gamma_y = 64)
return v37.prefetch(6)
#adjustframerate

v38 = LWLibavVideoSource(source_dir + "v38f.avi").ConvertToYV24()
v38 = v38.crop(0, 12, 0, -4)
v38 = v38.adjustSize()
v38 = v38.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2.5, red=1, grn=1, blu=1, gam_mac=true)
v38 = v38.colorYUV(off_u=6, off_v=-6, gamma_y=32)
return v38.prefetch(6)
#adjustframerate

v39 = LWLibavVideoSource(source_dir + "v39f.avi").ConvertToYV24()
#v39 = v39.crop(0, 12, 0, -4)
v39 = v39.adjustSize()
v39 = v39.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v39 = v39.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v39.prefetch(6)
#adjustframerate

v40 = LWLibavVideoSource(source_dir + "v40f.avi").ConvertToYV24()
#v40 = v40.crop(0, 12, 0, -4)
v40 = v40.adjustSize()
v40 = v40.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v40 = v40.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v40.prefetch(6)
#adjustframerate

v41 = LWLibavVideoSource(source_dir + "v41f.avi").ConvertToYV24()
#v41 = v41.crop(0, 12, 0, -4)
v41 = v41.adjustSize()
v41 = v41.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v41 = v41.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v41.prefetch(6)
#adjustframerate

v42 = LWLibavVideoSource(source_dir + "v42f.avi").ConvertToYV24()
#v42 = v42.crop(0, 12, 0, -4)
v42 = v42.adjustSize()
v42 = v42.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v42 = v42.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v42.prefetch(6)
#adjustframerate

v43 = LWLibavVideoSource(source_dir + "v43f.avi").ConvertToYV24()
#v43 = v43.crop(0, 12, 0, -4)
v43 = v43.adjustSize()
v43 = v43.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v43 = v43.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v43.prefetch(6)
#adjustframerate

v44 = LWLibavVideoSource(source_dir + "v44f.avi").ConvertToYV24()
#v44 = v44.crop(0, 12, 0, -4)
v44 = v44.adjustSize()
v44 = v44.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v44 = v44.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v44.prefetch(6)
#adjustframerate

v45 = LWLibavVideoSource(source_dir + "v45f.avi").ConvertToYV24()
#v45 = v45.crop(0, 12, 0, -4)
v45 = v45.adjustSize()
v45 = v45.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v45 = v45.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v45.prefetch(6)
#adjustframerate

v46 = LWLibavVideoSource(source_dir + "v46f.avi").ConvertToYV24()
#v46 = v46.crop(0, 12, 0, -4)
v46 = v46.adjustSize()
v46 = v46.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v46 = v46.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v46.prefetch(6)
#adjustframerate

v47 = LWLibavVideoSource(source_dir + "v47f.avi").ConvertToYV24()
#v47 = v47.crop(0, 12, 0, -4)
v47 = v47.adjustSize()
v47 = v47.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v47 = v47.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v47.prefetch(6)
#adjustframerate

v48 = LWLibavVideoSource(source_dir + "v48f.avi").ConvertToYV24()
#v48 = v48.crop(0, 12, 0, -4)
v48 = v48.adjustSize()
v48 = v48.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v48 = v48.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v48.prefetch(6)
#adjustframerate

v49 = LWLibavVideoSource(source_dir + "v49f.avi").ConvertToYV24()
#v49 = v49.crop(0, 12, 0, -4)
v49 = v49.adjustSize()
v49 = v49.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v49 = v49.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v49.prefetch(6)
#adjustframerate

v50 = LWLibavVideoSource(source_dir + "v50f.avi").ConvertToYV24()
v50 = v50.crop(0, 0, 0, -8)
v50 = v50.adjustSize()
v50 = v50.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v50 = v50.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v50.prefetch(6)
#adjustframerate

v51 = LWLibavVideoSource(source_dir + "v51f.avi").ConvertToYV24()
v51 = v51.crop(0, 8, 0, -4)
v51 = v51.adjustSize()
v51 = v51.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v51 = v51.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v51.prefetch(6)
#adjustframerate

v52 = LWLibavVideoSource(source_dir + "v52f.avi").ConvertToYV24()
#v52 = v52.crop(0, 8, 0, -4)
v52 = v52.adjustSize()
v52 = v52.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v52 = v52.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v52.prefetch(6)
#adjustframerate

v53 = LWLibavVideoSource(source_dir + "v53f.avi").ConvertToYV24()
#v53 = v53.crop(0, 8, 0, -4)
v53 = v53.adjustSize()
v53 = v53.AdjustColor(ou=0, ov=-0, x=10, y=10, w=-10, h=-200, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v53 = v53.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v53.prefetch(6)
#adjustframerate

v54 = LWLibavVideoSource(source_dir + "v54f.avi").ConvertToYV24()
#v54 = v54.crop(0, 8, 0, -4)
v54 = v54.adjustSize()
v54 = v54.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v54 = v54.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v54.prefetch(6)
#adjustframerate

v55 = LWLibavVideoSource(source_dir + "v55f.avi").ConvertToYV24()
#v55 = v55.crop(0, 8, 0, -4)
v55 = v55.adjustSize()
v55 = v55.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v55 = v55.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v55.prefetch(6)
#adjustframerate

v56 = LWLibavVideoSource(source_dir + "v56f.avi").ConvertToYV24()
#v56 = v56.crop(0, 8, 0, -4)
v56 = v56.adjustSize()
v56 = v56.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v56 = v56.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v56.prefetch(6)
#adjustframerate

v57 = LWLibavVideoSource(source_dir + "v57f.avi").ConvertToYV24()
#v57 = v57.crop(0, 8, 0, -4)
v57 = v57.adjustSize()
v57 = v57.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v57 = v57.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v57.prefetch(6)
#adjustframerate

v58 = LWLibavVideoSource(source_dir + "v58f.avi").ConvertToYV24()
#v58 = v58.crop(0, 8, 0, -4)
v58 = v58.adjustSize()
v58 = v58.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v58 = v58.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v58.prefetch(6)
#adjustframerate

v59 = LWLibavVideoSource(source_dir + "v59f.avi").ConvertToYV24()
#v59 = v59.crop(0, 8, 0, -4)
v59 = v59.adjustSize()
v59 = v59.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v59 = v59.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v59.prefetch(6)
#adjustframerate

v60 = LWLibavVideoSource(source_dir + "v60f.avi").ConvertToYV24()
#v60 = v60.crop(0, 8, 0, -4)
v60 = v60.adjustSize()
v60 = v60.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v60 = v60.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v60.prefetch(6)
#adjustframerate

v61 = LWLibavVideoSource(source_dir + "v61f.avi").ConvertToYV24()
#v61 = v61.crop(0, 8, 0, -4)
v61 = v61.adjustSize()
v61 = v61.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v61 = v61.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v61.prefetch(6)
#adjustframerate

v62 = LWLibavVideoSource(source_dir + "v62f.avi").ConvertToYV24()
#v62 = v62.crop(0, 8, 0, -4)
v62 = v62.adjustSize()
v62 = v62.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v62 = v62.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v62.prefetch(6)
#adjustframerate

v63 = LWLibavVideoSource(source_dir + "v63f.avi").ConvertToYV24()
#v63 = v63.crop(0, 8, 0, -4)
v63 = v63.adjustSize()
v63 = v63.AdjustColor(ou=-4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v63 = v63.colorYUV(off_u=0, off_v=-4, gamma_y=0)
return v63.prefetch(6)
#adjustframerate

v64 = LWLibavVideoSource(source_dir + "v64f.avi").ConvertToYV24()
#v64 = v64.crop(0, 8, 0, -4)
v64 = v64.adjustSize()
v64 = v64.AdjustColor(ou=-4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v64 = v64.colorYUV(off_u=2, off_v=-2, gamma_y=0)
#return v64.histogram("levels").prefetch(6)
#v64 = v64.adjustBorders
return v64.prefetch(6)
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