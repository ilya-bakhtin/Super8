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
w = w*960/h
h = 960

#spline64Resize(w, h)
#return last.autolevels(filterRadius=0, ignore_high=0.0003).histogram("levels").Prefetch(6)

# 8, 52, 91, 147, 182, 203, 256, 307, 348, 391, 418, 452, 494, 550, 582, 621, 691, 758, 788, 792, 830, 871, 920, 979, 1015, 1076,
# 1126, 1252, 1329, 1407, 1497, 1625, 1717, 1799, 1867, 1914, 1958, 2052, 2121, 2182, 2246, 2290, 2329, 2442, 2479, 2517, 2585,
# 2669, 2719, 2777, 2833, 2935, 2992, 3106, 3208, 3272, 3331, 3387, 3457, 3509, 3577, 3597, 3640, 3686, 3729, 3785, 3825, 3887,
# 3944, 3991, 4042, 4073, 4123, 4152, 4358, 4394, 4475, 4645, 4676, 4733, 4760, 4814, 4888, 4921, 4986, 5040, 5098, 5182, 5218,
# 5297, 5327, 5346, 5420, 5463, 5493, 5550, 5607, 5650, 5709, 5773, 5813, 5855, 5894, 5968, 6063, 6104, 6146, 6181, 6374, 6441,
#

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v64 = full.trim(3785, 3824).crop(58, 112, -42, -46)
v065 = full.trim(3825, 3886).crop(58, 112, -42, -46)
v066 = full.trim(3887, 3943).crop(54, 92, -46, -66)
v067 = full.trim(3944, 3990).crop(54, 92, -50, -66)
v068 = full.trim(3991, 4041).crop(54, 92, -50, -66)
v069 = full.trim(4042, 4072).crop(54, 92, -50, -66)
v070 = full.trim(4073, 4122).crop(54, 102, -50, -56)
v071 = full.trim(4123, 4151).crop(54, 102, -50, -56)
v072 = full.trim(4152, 4357).crop(54, 102, -50, -56)
v073 = full.trim(4358, 4393).crop(54, 102, -50, -56)
v074 = full.trim(4394, 4474).crop(54, 102, -50, -56)
v075 = full.trim(4475, 4644).crop(54, 102, -50, -56)
v076 = full.trim(4645, 4675).crop(54, 112, -50, -46)
v077 = full.trim(4676, 4732).crop(54, 112, -50, -46)
v078 = full.trim(4733, 4759).crop(54, 112, -50, -46)
v079 = full.trim(4760, 4813).crop(54, 112, -50, -46)
v080 = full.trim(4814, 4887).crop(54, 112, -50, -46)
v081 = full.trim(4888, 4920).crop(54, 112, -50, -46)
v082 = full.trim(4921, 4985).crop(54, 112, -50, -46)
v083 = full.trim(4986, 5039).crop(54, 102, -50, -56)
v084 = full.trim(5040, 5097).crop(54, 102, -50, -56)
v085 = full.trim(5098, 5181).crop(54, 102, -50, -56)
v086 = full.trim(5182, 5217).crop(54, 112, -50, -46)
v087 = full.trim(5218, 5296).crop(54, 112, -50, -46)
v088 = full.trim(5297, 5326).crop(54, 112, -50, -46)
v089 = full.trim(5327, 5345).crop(54, 112, -50, -46)
v090 = full.trim(5346, 5419).crop(54, 112, -50, -46)
v091 = full.trim(5420, 5462).crop(54, 112, -50, -46)
v092 = full.trim(5463, 5492).crop(54, 92, -50, -66)
v093 = full.trim(5493, 5549).crop(54, 102, -50, -56)
v094 = full.trim(5550, 5606).crop(54, 112, -50, -46)
v095 = full.trim(5607, 5649).crop(54, 112, -50, -46)
v096 = full.trim(5650, 5708).crop(54, 112, -50, -46)
#return v096.adjustSize.adjustBorders.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

#******

# 65
/*
v65 = LWLibavVideoSource(source_dir + "v065f.avi", cache=false).ConvertToYV24()
#v65 = v65.crop(0, 8, 0, -4)
v65 = v65.adjustSize()
v65 = v65.AdjustColor(ou=-8, ov=4, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v65 = v65.colorYUV(off_u=6, off_v=0, gamma_y=64)
return v65.prefetch(6)
#adjustframerate

v66 = LWLibavVideoSource(source_dir + "v066f.avi", cache=false).ConvertToYV24()
#v66 = v66.crop(0, 8, 0, -4)
v66 = v66.adjustSize()
v66 = v66.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v66 = v66.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v66.prefetch(6)
#adjustframerate

v67 = LWLibavVideoSource(source_dir + "v067f.avi", cache=false).ConvertToYV24()
#v67 = v67.crop(0, 8, 0, -4)
v67 = v67.adjustSize()
v67 = v67.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v67 = v67.colorYUV(off_u=-6, off_v=-6, gamma_y=0)
return v67.prefetch(6)
#adjustframerate

v68 = LWLibavVideoSource(source_dir + "v068f.avi", cache=false).ConvertToYV24()
#v68 = v68.crop(0, 8, 0, -4)
v68 = v68.adjustSize()
v68 = v68.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v68 = v68.colorYUV(off_u=2, off_v=-2, gamma_y=48)
return v68.prefetch(6)
#adjustframerate

v69 = LWLibavVideoSource(source_dir + "v069f.avi", cache=false).ConvertToYV24()
#v69 = v69.crop(0, 8, 0, -4)
v69 = v69.adjustSize()
v69 = v69.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v69 = v69.colorYUV(off_u=2, off_v=-2, gamma_y=48)
return v69.prefetch(6)
#adjustframerate

v70 = LWLibavVideoSource(source_dir + "v070f.avi", cache=false).ConvertToYV24()
#v70 = v70.crop(0, 8, 0, -4)
v70 = v70.adjustSize()
v70 = v70.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v70 = v70.colorYUV(off_u=2, off_v=-2, gamma_y=64)
return v70.prefetch(6)
#adjustframerate

v71 = LWLibavVideoSource(source_dir + "v071f.avi", cache=false).ConvertToYV24()
#v71 = v71.crop(0, 8, 0, -4)
v71 = v71.adjustSize()
v71 = v71.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v71 = v71.colorYUV(off_u=4, off_v=-4, gamma_y=48)
return v71.prefetch(6)
#adjustframerate

v72 = LWLibavVideoSource(source_dir + "v072f.avi", cache=false).ConvertToYV24()
#v72 = v72.crop(0, 8, 0, -4)
v72 = v72.adjustSize()
v72 = v72.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v72 = v72.colorYUV(off_u=0, off_v=-4, gamma_y=64)
return v72.prefetch(6)
#adjustframerate

v73 = LWLibavVideoSource(source_dir + "v073f.avi", cache=false).ConvertToYV24()
#v73 = v73.crop(0, 8, 0, -4)
v73 = v73.adjustSize()
v73 = v73.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=0, sat=2.5, red=1, grn=1, blu=1, gam_mac=true)
v73 = v73.colorYUV(off_u=0, off_v=-4, gamma_y=64)
return v73.prefetch(6)
#adjustframerate

v74 = LWLibavVideoSource(source_dir + "v074f.avi", cache=false).ConvertToYV24()
#v74 = v74.crop(0, 8, 0, -4)
v74 = v74.adjustSize()
v74 = v74.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v74 = v74.colorYUV(off_u=0, off_v=-4, gamma_y=64)
return v74.prefetch(6)
#adjustframerate

v75 = LWLibavVideoSource(source_dir + "v075f.avi", cache=false).ConvertToYV24()
#v75 = v75.crop(0, 8, 0, -4)
v75 = v75.adjustSize()
v75 = v75.AdjustColor(ou=-0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v75 = v75.colorYUV(off_u=0, off_v=-4, gamma_y=0)
return v75.prefetch(6)
#adjustframerate

v76 = LWLibavVideoSource(source_dir + "v076f.avi", cache=false).ConvertToYV24()
#v76 = v76.crop(0, 8, 0, -4)
v76 = v76.adjustSize()
v76 = v76.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v76 = v76.colorYUV(off_u=8, off_v=-8, gamma_y=48)
return v76.prefetch(6)
#adjustframerate

v77 = LWLibavVideoSource(source_dir + "v077f.avi", cache=false).ConvertToYV24()
#v77 = v77.crop(0, 8, 0, -4)
v77 = v77.adjustSize()
v77 = v77.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v77 = v77.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v77.prefetch(6)
#adjustframerate

v78 = LWLibavVideoSource(source_dir + "v078f.avi", cache=false).ConvertToYV24()
#v78 = v78.crop(0, 8, 0, -4)
v78 = v78.adjustSize()
v78 = v78.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.00, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v78 = v78.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v78.prefetch(6)
#adjustframerate

v79 = LWLibavVideoSource(source_dir + "v079f.avi", cache=false).ConvertToYV24()
#v79 = v79.crop(0, 8, 0, -4)
v79 = v79.adjustSize()
v79 = v79.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v79 = v79.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v79.prefetch(6)
#adjustframerate

v80 = LWLibavVideoSource(source_dir + "v080f.avi", cache=false).ConvertToYV24()
#v80 = v80.crop(0, 8, 0, -4)
v80 = v80.adjustSize()
v80 = v80.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v80 = v80.colorYUV(off_u=4, off_v=-6, gamma_y=0)
return v80.prefetch(6)
#adjustframerate

v81 = LWLibavVideoSource(source_dir + "v081f.avi", cache=false).ConvertToYV24()
#v81 = v81.crop(0, 8, 0, -4)
v81 = v81.adjustSize()
v81 = v81.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v81 = v81.colorYUV(off_u=4, off_v=-4, gamma_y=16)
return v81.prefetch(6)
#adjustframerate

v82 = LWLibavVideoSource(source_dir + "v082f.avi", cache=false).ConvertToYV24()
#v82 = v82.crop(0, 8, 0, -4)
v82 = v82.adjustSize()
v82 = v82.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v82 = v82.colorYUV(off_u=4, off_v=-4, gamma_y=16)
return v82.prefetch(6)
#adjustframerate

v83 = LWLibavVideoSource(source_dir + "v083f.avi", cache=false).ConvertToYV24()
#v83 = v83.crop(0, 8, 0, -4)
v83 = v83.adjustSize()
v83 = v83.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v83 = v83.colorYUV(off_u=4, off_v=-8, gamma_y=0)
return v83.prefetch(6)
#adjustframerate

v84 = LWLibavVideoSource(source_dir + "v084f.avi", cache=false).ConvertToYV24()
#v84 = v84.crop(0, 8, 0, -4)
v84 = v84.adjustSize()
v84 = v84.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v84 = v84.colorYUV(off_u=10, off_v=-14, gamma_y=32)
return v84.prefetch(6)
#adjustframerate

v85 = LWLibavVideoSource(source_dir + "v085f.avi", cache=false).ConvertToYV24()
#v85 = v85.crop(0, 8, 0, -4)
v85 = v85.adjustSize()
v85 = v85.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v85 = v85.colorYUV(off_u=4, off_v=-4, gamma_y=0)
return v85.prefetch(6)
#adjustframerate

v86 = LWLibavVideoSource(source_dir + "v086f.avi", cache=false).ConvertToYV24()
#v86 = v86.crop(0, 8, 0, -4)
v86 = v86.adjustSize()
v86 = v86.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v86 = v86.colorYUV(off_u=8, off_v=-8, gamma_y=32)
return v86.prefetch(6)
#adjustframerate

v87 = LWLibavVideoSource(source_dir + "v087f.avi", cache=false).ConvertToYV24()
#v87 = v87.crop(0, 8, 0, -4)
v87 = v87.adjustSize()
v87 = v87.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v87 = v87.colorYUV(off_u=0, off_v=-6, gamma_y=16)
return v87.prefetch(6)
#adjustframerate

v88 = LWLibavVideoSource(source_dir + "v088f.avi", cache=false).ConvertToYV24()
#v88 = v88.crop(0, 8, 0, -4)
v88 = v88.adjustSize()
v88 = v88.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v88 = v88.adjustBorders
return v88.prefetch(6)
#adjustframerate

v89 = LWLibavVideoSource(source_dir + "v089f.avi", cache=false).ConvertToYV24()
#v89 = v89.crop(0, 8, 0, -4)
v89 = v89.adjustSize()
v89 = v89.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v89 = v89.colorYUV(off_u=6, off_v=-6, gamma_y=0)
return v89.prefetch(6)
#adjustframerate

v90 = LWLibavVideoSource(source_dir + "v090f.avi", cache=false).ConvertToYV24()
#v90 = v90.crop(0, 8, 0, -4)
v90 = v90.adjustSize()
v90 = v90.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v90 = v90.adjustBorders
return v90.prefetch(6)
#adjustframerate

v91 = LWLibavVideoSource(source_dir + "v091f.avi", cache=false).ConvertToYV24()
#v91 = v91.crop(0, 8, 0, -4)
v91 = v91.adjustSize()
v91 = v91.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v91 = v91.colorYUV(off_u=6, off_v=-6, gamma_y=0)
return v91.prefetch(6)
#adjustframerate

v92 = LWLibavVideoSource(source_dir + "v092f.avi", cache=false).ConvertToYV24()
#v92 = v92.crop(0, 8, 0, -4)
v92 = v92.adjustSize()
v92 = v92.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v92 = v92.colorYUV(off_u=6, off_v=-6, gamma_y=0)
return v92.prefetch(6)
#adjustframerate

v93 = LWLibavVideoSource(source_dir + "v093f.avi", cache=false).ConvertToYV24()
#v93 = v93.crop(0, 8, 0, -4)
v93 = v93.adjustSize()
v93 = v93.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v93 = v93.colorYUV(off_u=6, off_v=-6, gamma_y=0)
return v93.prefetch(6)
#adjustframerate

v94 = LWLibavVideoSource(source_dir + "v094f.avi", cache=false).ConvertToYV24()
#v94 = v94.crop(0, 8, 0, -4)
v94 = v94.adjustSize()
v94 = v94.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v94 = v94.colorYUV(off_u=6, off_v=-6, gamma_y=0)
return v94.prefetch(6)
#adjustframerate

v95 = LWLibavVideoSource(source_dir + "v095f.avi", cache=false).ConvertToYV24()
#v95 = v95.crop(0, 8, 0, -4)
v95 = v95.adjustSize()
v95 = v95.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v95 = v95.colorYUV(off_u=6, off_v=-6, gamma_y=0)
return v95.prefetch(6)
#adjustframerate

v96 = LWLibavVideoSource(source_dir + "v096f.avi", cache=false).ConvertToYV24()
#v96 = v96.crop(0, 8, 0, -4)
v96 = v96.adjustSize()
v96 = v96.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v96 = v96.colorYUV(off_u=14, off_v=-14, gamma_y=64)
#return v96.histogram("levels").prefetch(6)
#v96 = v96.adjustBorders
return v96.prefetch(6)
#adjustframerate
*/
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