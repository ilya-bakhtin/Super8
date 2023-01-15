SetFilterMTMode("DEFAULT_MT_MODE", 2)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov")
assumefps(18)

trim(1, 21373)

crop(240, 0, -240, 0)

#Spline64resize(960, 720)
global src = last

#return last

# 59, 214, 251, 291, 389, 484, 571, 623, 668, 777, 985, 1139, 1189, 1236, 1459, 1538, 1781, 2018, 2075, 2311, 2361, 2476,
# 2751, 2803, 2882, 3086, 3191, 3227, 3362, 3447, 3702, 3736, 3920, 4143, 4195, 4381, 4623, 4701, 4738, 5017, 5075, 5284,
# 5378, 5586, 5722, 5846, 6151, 6320, 6501, 6582, 6703, 6797, 6806, 6910, 6992, 7165, 7378, 7556, 7673, 7818, 8043, 8186,
# 8364, 8482, 8646, 8841, 9019, 9217, 9419, 9663, 9988, 10219, 10408, 10606, 10614, 10814, 10886, 11185, 11354, 11423,
# 11674, 11750, 11843, 11965, 12197, 12282, 12511, 12691, 12751, 12894, 13008, 13157, 13349, 13528, 13622, 13683, 13801, 14126,
# 14360, 14448, 14511, 14626, 14789, 14959, 15100, 15381, 15523, 15641, 15925, 16109, 16294, 16598, 16765, 16777, 16795,
# 16920, 17110, 17214, 17307, 17393, 17483, 17616, 17689, 17829, 17939, 18162, 18169, 18450, 18471, 18698, 18769, 18850,
# 18938, 18985, 18995, 19101, 19375, 19510, 19608, 19715, 19904, 19921, 20008, 20128, 20161, 20230, 20311, 20493, 20597,
# 20685, 20760, 20810, 20923, 20932, 21001, 21230, 21325, 21373

#v033 = src.trim(3736, 3919).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v034 = src.trim(3920, 4142).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v035 = src.trim(4144, 4191)#.autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v036 = src.trim(4198, 4380).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v037 = src.trim(4381, 4622).autolevels(ignore=0.0003, filterRadius = 9, minRng=0)
v038 = src.trim(4624, 4699).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v039 = src.trim(4702, 4737).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v040 = src.trim(4738, 5016).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v041 = src.trim(5017, 5074).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v042 = src.trim(5075, 5283).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v043 = src.trim(5285, 5377).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v044 = src.trim(5378, 5585).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v045 = src.trim(5586, 5721).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v046 = src.trim(5722, 5845).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v047 = src.trim(5846, 6150).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v048 = src.trim(6151, 6319).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v049 = src.trim(6321, 6500)#.autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v050 = src.trim(6502, 6581).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v051 = src.trim(6582, 6702).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v052 = src.trim(6703, 6796).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
#v053 = src.trim(6797, 6805).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v053 = src.trim(6806, 6909).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v054 = src.trim(6910, 6991).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v055 = src.trim(6992, 7164).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v056 = src.trim(7165, 7377).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v057 = src.trim(7378, 7555).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
#v058 = src.trim(7556, 7672).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
#v058 = src.trim(7673, 7817).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
#v058 = src.trim(7818, 8042).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v058 = src.trim(8044, 8185).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v059 = src.trim(8187, 8363).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
#v060 = src.trim(8364, 8481).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v060 = src.trim(8482, 8645).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v061 = src.trim(8646, 8840).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v062 = src.trim(8841, 9018).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v063 = src.trim(9019, 9216).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v064 = src.trim(9218, 9418).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v065 = src.trim(9419, 9662).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
v066 = src.trim(9664, 9987).autolevels(ignore=0.0003, filterRadius = 0, minRng=0)
#return v060.histogram("levels")

/*
v034 = v034.Filter
v035 = v035.Filter
v036 = v036.Filter
v037 = v037.Filter
v038 = v038.Filter
v039 = v039.Filter
v040 = v040.Filter
v041 = v041.Filter
v042 = v042.Filter
v043 = v043.Filter
v044 = v044.Filter
v045 = v045.Filter(sigma_y=4, sigma_c=8)
v046 = v046.Filter(th_SAD=1300, th_SADC=1300)
#v047 = v047.Filter
#v048 = v048.Filter
v049 = v049.Filter
#v050 = v050.Filter

#v051 = v051.Filter
v052 = v052.Filter
v053 = v053.Filter
v054 = v054.Filter
v055 = v055.Filter
#v056 = v056.Filter
v057 = v057.Filter
v058 = v058.Filter
v059 = v059.Filter

v060 = v060.Filter
#v061 = v061.Filter
v062 = v062.Filter
v063 = v063.Filter
v064 = v064.Filter
#v065 = v065.Filter
v066 = v066.Filter
*/
#return v066.prefetch(6)
/*
v034 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_002_034.avi").ConvertToYV24()
v035 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_035.avi").ConvertToYV24()
v036 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_036.avi").ConvertToYV24()
v037 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_037.avi").ConvertToYV24()
v038 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_038.avi").ConvertToYV24()
v039 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_039.avi").ConvertToYV24()
v040 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_040.avi").ConvertToYV24()
v041 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_041.avi").ConvertToYV24()
v042 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_042.avi").ConvertToYV24()
v043 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_043.avi").ConvertToYV24()
v044 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_044.avi").ConvertToYV24()
v045 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_045.avi").ConvertToYV24()
#v046 as is
v047 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_047.avi").ConvertToYV24()
v048 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_048.avi").ConvertToYV24()
#v049 as is
v050 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_050.avi").ConvertToYV24()
v051 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_051.avi").ConvertToYV24()
#v052 as is
#v053 as is
#v054 as is
#v055 as is
v056 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_056.avi").ConvertToYV24()
#v057 as is
#v058 as is
#v059 as is
#v060 as is
v061 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_061.avi").ConvertToYV24()
#v062 as is
#v063 as is
#v064 as is
v065 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\1983_720_065.avi").ConvertToYV24()
#v066 as is
*/

global filter16 = true


#******

# 34
/*
v034 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_034\pass2\v034f.avi")
v034 = v034.trim(1, v034.FrameCount - 20)
v034 = v034.AdjustColor(ou=7, ov=-7, lo_th=0.1, hi_th=0.1, lock_chan=0, x=720, sat=2, red=0.98, blu=1, gam_mac=true,\
    bluePoints="0,0, 26, 0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v034 = v034.convertToYV12
v034 = v034.removeDirt
v034 = v034.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
return v034.histogram("levels").prefetch(6)
return v034.assumeFPS(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#******

/*
v034 = v034.AdjustColor(ou=7, ov=-7, lo_th=0.1, lock_chan=0, red = 0.98).tweak(sat=2, coring=false)
v034 = v034.trim(1, v034.FrameCount - 20)
v034 = v034.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v035 = v035.AdjustColor(ou=7, ov=-7, lo_th=0.1, lock_chan=0, blu=0.96, x=480).tweak(sat=2, coring=false)
v035 = v035.trim(0, v035.FrameCount - 6)
v035 = v035.RemoveDirt.assumefps(18).autolevels.AdjustFrameRate(preset_p = "slowest")

v036 = v036.AdjustColor(ou=20, ov=-17, x=240, lo_th=0, lock_chan=0, blu=0.96, red=0.96).tweak(sat=2, coring=false)
v036 = v036.RemoveDirt.assumefps(18).autolevels(ignore=0.003, gamma=1.3).AdjustFrameRate(preset_p = "slowest")

v037 = v037.AdjustColor(ou=20, ov=-12, x=480, lo_th=0.1, lock_chan=0, hi_th=0, red=0.9).tweak(sat=2, coring=false)
v037 = v037.RemoveDirt.assumefps(18).autolevels(ignore=0.003, gamma=1.3).AdjustFrameRate(preset_p = "slowest")

v038 = v038.AdjustColor(ou=20, ov=-12, x=480, lo_th=0.1, lock_chan=0, hi_th=0, red=0.9).tweak(sat=2, coring=false)
v038 = v038.RemoveDirt.assumefps(18).autolevels(ignore=0.003, gamma=1.3).AdjustFrameRate(preset_p = "slowest")

v039 = v039.AdjustColor(ou=20, ov=-12, x=480, lo_th=0.1, lock_chan=0, hi_th=0, red=0.9).tweak(sat=2, coring=false)
v039 = v039.RemoveDirt.assumefps(18).autolevels(ignore=0.003, gamma=1.3).AdjustFrameRate(preset_p = "slowest")

v040 = v040.AdjustColor(ou=20, ov=-15, x=480, lo_th=0.1, hi_th=0, lock_chan=0, red=0.96, blu=0.96).tweak(sat=2, coring=false)
v040 = v040.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v041 = v041.AdjustColor(ou=20, ov=-15, x=480, lo_th=0.1, hi_th=0, lock_chan=0, red=0.9, blu=0.9).tweak(sat=2, coring=false)
v041 = v041.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v042 = v042.AdjustColor(ou=20, ov=-15, x=480, lo_th=0.1, hi_th=0, lock_chan=0, red=0.9, blu=0.9).tweak(sat=2, coring=false)
v042 = v042.RemoveDirt.assumefps(18).autolevels(ignore=0.0003, border_l=200, gamma=1.2).AdjustFrameRate(preset_p = "slowest")

v043 = v043.AdjustColor(ou=24, ov=-19, x=480, lo_th=0.1, hi_th=0.1, lock_chan=0, blu=0.9).tweak(sat=2, coring=false)
v043 = v043.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v044 = v044.AdjustColor(ou=24, ov=-19, x=480, lo_th=0.1, hi_th=0.1, lock_chan=0, red=0.96, blu=0.96).tweak(sat=2, coring=false)
v044 = v044.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v045 = v045.AdjustColor(ou=24, ov=-19, x=480, lo_th=0.1, hi_th=0.1, lock_chan=0, red=0.98, blu=0.96).tweak(sat=2, coring=false)
v045 = v045.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v046 = v046.AdjustColor(ou=24, ov=-19, x=480, lo_th=0.1, hi_th=0.1, lock_chan=0, red=0.98, blu=0.96).tweak(sat=2, coring=false)
v046 = v046.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v047 = v047.AdjustColor(ou=24, ov=-19, x=480, lo_th=0.1, hi_th=0.1, lock_chan=0, red=0.98, blu=0.96).tweak(sat=2, coring=false)
v047 = v047.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v048 = v048.AdjustColor(ou=24, ov=-12, x=480, lo_th=0.1, hi_th=0.1, lock_chan=0, red=0.96, blu=0.98).tweak(sat=2, coring=false)
v048 = v048.trim(1, v048.FrameCount - 2)
v048 = v048.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v049 = v049.AdjustColor(ou=24, ov=-12, x=200, lo_th=0.1, hi_th=0.1, lock_chan=0, red=0.96, blu=0.98).tweak(sat=2, coring=false)
v049 = v049.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v050 = v050.AdjustColor(ou=24, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, red=0.96, blu=0.98).tweak(sat=2, coring=false)
v050 = v050.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v051 = v051.AdjustColor(ou=12, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0).tweak(sat=2, coring=false)
v051 = v051.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v052 = v052.AdjustColor(ou=12, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=1, blu=0.96).tweak(sat=2, coring=false)
v052 = v052.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v053 = v053.AdjustColor(ou=18, ov=-7, lo_th=0, hi_th=0.1, lock_chan=1, blu=0.82).tweak(sat=2, coring=false)
v053 = v053.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v054 = v054.AdjustColor(ou=21, ov=-9, lo_th=0.05, hi_th=0.1, lock_chan=1, blu=0.86).tweak(sat=2, coring=false)
v054 = v054.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v055 = v055.AdjustColor(ou=17, ov=-9, lo_th=0.05, hi_th=0.1, lock_chan=1, blu=0.86).tweak(sat=2, coring=false)
v055 = v055.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v056 = v056.AdjustColor(ou=13, ov=-9, lo_th=0.05, hi_th=0.1, lock_chan=1, blu=0.86).tweak(sat=2, coring=false)
v056 = v056.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v057 = v057.AdjustColor(ou=25, ov=-9, lo_th=0.05, hi_th=0.1, lock_chan=1, blu=0.86).tweak(sat=2.3, coring=false)
v057 = v057.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v058 = v058.AdjustColor(ou=13, ov=-9, lo_th=0.05, hi_th=0.1, lock_chan=1, blu=0.86).tweak(sat=2.3, coring=false)
v058 = v058.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v059 = v059.AdjustColor(ou=13, ov=-9, lo_th=0.05, hi_th=0.1, lock_chan=1, red=0.96, blu=0.86).tweak(sat=2.3, coring=false)
v059 = v059.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v060 = v060.AdjustColor(ou=15, ov=-12, lo_th=0.05, hi_th=0.1, lock_chan=0, x=128, red=0.96, blu=0.86).tweak(sat=2, coring=false)
v060 = v060.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v061 = v061.AdjustColor(ou=15, ov=-12, lo_th=0.05, hi_th=0.1, lock_chan=0, x=400, red=0.96, blu=0.92).tweak(sat=2, coring=false)
v061 = v061.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v062 = v062.AdjustColor(ou=25, ov=-19, lo_th=0.05, hi_th=0.1, lock_chan=1, x=400, red=0.92, blu=0.86).tweak(sat=2, coring=false)
v062 = v062.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v063 = v063.AdjustColor(ou=25, ov=-19, lo_th=0.05, hi_th=0.1, lock_chan=1, x=400, red=0.92, blu=0.86).tweak(sat=2, coring=false)
v063 = v063.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v064 = v064.AdjustColor(ou=19, ov=-15, lo_th=0.05, hi_th=0.1, lock_chan=0, x=400, red=0.92, blu=0.9).tweak(sat=2, coring=false)
v064 = v064.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v065 = v065.AdjustColor(ou=19, ov=-15, lo_th=0.05, hi_th=0.1, lock_chan=0, x=400, red=0.9, blu=0.9).tweak(sat=2, coring=false)
v065 = v065.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v066 = v066.AdjustColor(ou=25, ov=-15, lo_th=0.05, hi_th=0.1, lock_chan=1, x=400, red=0.9, blu=0.86).tweak(sat=2, coring=false)
v066 = v066.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

#last = v066
#last = v034+v035+v036+v037+v038+v039+v040+v041+v042+v043+v044+v045+v046+v047+v048+v049+v050#+\
#last = v051+v052+v053+v054+v055+v056+v057+v058+v059#+\
last = v060+v061+v062+v063+v064+v065+v066

#histogram("levels")
ConvertToYV12
Prefetch(6)
*/

function adjustBorders(clip c)
{
    return src.height == c.height && src.width == c.width ? c : c.addBorders(0, 0, src.width - c.width, src.height - c.height)
}

function Curves(clip c, string "bluePoints", string "curvesFile")
{
    bluePoints = Default(bluePoints, "")
    curvesFile = Default(curvesFile, "")
    return StrLen(bluePoints) == 0 && StrLen(curvesFile) == 0 ? c : c.\
        ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints).ConvertBits(8)
#    return c.ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(curvesFile="D:/users/ilx/wrk/video/Super8/1983/1983_720_100/blueCurves.acv").ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac", string "bluePoints", float "sat",\
                     string "curvesFile")
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
    curvesFile = Default(curvesFile, "")
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints = bluePoints, curvesFile = curvesFile).\
       ConvertToYV24() : c

    c = sat == 1 ? c : c.tweak(sat=sat, coring=false)

#    c = c.AdjustDiv2(1, 2)

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
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)
#    dct = default(dct, 0)
    tr = default(tr, 9)
    RefineMotion = default(RefineMotion, true)
    contrasharp = default(contrasharp, true)
    truemotion = default(truemotion, true)

    c = filter16 ? c.convertBits(16) : c
#c = c.Spline64Resize(960, 720)
#c = c.SMDegrain(tr=tr, globals=3, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap)
    c = th_SAD == 0 && th_SADC == 0 ? c : c.SMDegrain(tr=tr, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap, search=3, truemotion=truemotion,\
                                                      RefineMotion=RefineMotion, prefilter=prefilter, contrasharp=contrasharp, globals=0, pel=1, subpixel=1,\
                                                      hpad=hpad, vpad=vpad)
    c = sigma_y == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6)
    c = sigma_c == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

#c = c.SincResize(1440, 1080)
    c = filter16 ? c.convertBits(8) : c

    return c
}

function AdjustDiv2(clip c, int level, int "max_level", float "red", float "grn", float "blu")
{
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)

    max_level = Default(max_level, 4)

    left = c.crop(0, 0, -c.width/2, 0)
    right = c.crop(c.width - c.width/2, 0, 0, 0)

    level = level + 1

    left = level < max_level ? left.AdjustDiv2(level, max_level, red, grn, blu) :\
    left.ConvertToRGB().\
    GamMac(LockChan=1, Scale=2, loTh=0, hiTh=0.1, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=0, w=0).\
    ConvertToYV24()

    right =  level < max_level ? right.AdjustDiv2(level, max_level, red, grn, blu) :\
    right.ConvertToRGB().\
    GamMac(LockChan=1, Scale=2, loTh=0, hiTh=0.1, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=0, w=0).\
    ConvertToYV24()

    return left.stackhorizontal(right)
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
dh = src.height - input.height
dw = src.width - input.width
input = input.adjustBorders
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
