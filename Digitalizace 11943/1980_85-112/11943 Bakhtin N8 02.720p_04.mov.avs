SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("fft3dfilter", 2)
SetFilterMTMode("LSMASHVideoSource", 3)
SetFilterMTMode("LWLibavVideoSource", 3)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("Reverse", 3)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

src1 = LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02 cast 1.720p.mov")
src2 = LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02 cast 2.720p.mov")
last = src1 + src2
assumefps(18)

#crop(146,0,-190,-0)
crop(146,0,-224,-0)
#return last

# 196, 258, 326, 589, 685, 842, 955, 1065, 1285, 1357, 1494, 1554, 1675, 1796, 1917, 2107, 2183, 2242, 2284, 2354, 2376, 2424,
# 2489, 2515, 2576, 2850, 2982, 3046, 3231, 3276, 3435, 3620, 3815, 3996, 4049, 4062, 4103, 4150, 4180, 4257, 4475, 4604, 4766,
# 4906, 5007, 5104, 5292, 5359, 5516, 5556, 5652, 5686, 5766, 5773, 5891, 5995, 6152, 6218, 6283, 6464, 6831, 6840, 6940, 7173
# 7372, 7684, 7725, 7751, 7787, 7836, 7850, 8001, 8200, 8336, 8387, 8484, 8568, 8640, 8646, 8724, 8872, 9000, 9083, 9228, 9320,
# 9464, 9621, 9753, 10072, 10125, 10186, 10313, 10396, 10562, 10684, 10854, 10985, 11207, 11369, 11573, 11713, 11820, 11993,
# 12076, 12086, 12088, 12090, 12141, 12159, 12222, 12376, 12534, 12681, 12756, 12855, 12984, 13294, 13558, 13567, 13689, 13864,
# 14043, 14270, 14348, 14476, 14547, 14645, 14816, 14906, 15315, 15518, 15569, 15631, 15688, 15826, 16074, 16343, 16900, 17081,
# 17186, 17342, 17552, 17699, 18021, 18263, 18542, 18819, 18985, 19171, 19254, 19742, 19851, 19973, 20117, 20242, 20359, 20409,
# 20464, 20569, 20612, 20714, 20839, 20948, 21025, 21171, 21183, 21291, 21531, 21583

src = last
#return last.ColorYUV(autogain=true)

#v84 = src.trim(10186, 10311).crop(0,0,-56,0)
v85 = src.trim(10313, 10395).crop(0,0,-56,0)
v86 = src.trim(10396, 10561).crop(0,0,-56,-16)
v87 = src.trim(10562, 10683).crop(0,0,-56,0)
v88 = src.trim(10684, 10853).crop(0,0,-56,0)
v89 = src.trim(10854, 10984).crop(0,0,-48,0)
v90 = src.trim(10985, 11206).crop(0,0,-56,0)
v91 = src.trim(11207, 11368).crop(0,0,-48,0)
v92 = src.trim(11369, 11572).crop(0,0,-48,0)
v93 = src.trim(11573, 11712).crop(0,0,-48,0)
v94 = src.trim(11713, 11819).crop(0,0,-32,0)
v95 = src.trim(11820, 11992).crop(0,0,-36,-20)
v96 = src.trim(11993, 12075).crop(0,0,-52,-28)
#v97.0 = src.trim(12076, 12089)
#v97.1 = src.trim(12090, 12140)
#v97.2 = src.trim(12141, 12158)
v97 = src.trim(12159, 12221).crop(0,0,-16,0)
v98 = src.trim(12222, 12375)
v99 = src.trim(12376, 12533)
v100 = src.trim(12534, 12680).crop(0,0,-8,0)
v101 = src.trim(12681, 12755).crop(0,0,-8,0)
v102 = src.trim(12757, 12854)
v103 = src.trim(12855, 12983)
v104 = src.trim(12984, 13293)
v105 = src.trim(13294, 13557)
v106 = src.trim(13559, 13566)
v107 = src.trim(13567, 13688)
v108 = src.trim(13690, 13863)
v109 = src.trim(13865, 14042).crop(0,16,-16,-16)
v110 = src.trim(14044, 14269).crop(0,0,-16,0)
v111 = src.trim(14270, 14347).crop(0,0,-16,0)
v112 = src.trim(14348, 14475)

#return v81.autolevels.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, sigma2=10, sigma3=20, sigma4=20, plane=4).prefetch(6)
#return v112#.autolevels#.ColorYUV(autogain=true)

function merge16(clip c, frame)
{
m0 = c.trim(frame+0,-1).merge(c.trim(frame+1,-1))
m1 = c.trim(frame+2,-1).merge(c.trim(frame+3,-1))
m2 = c.trim(frame+4,-1).merge(c.trim(frame+5,-1))
m3 = c.trim(frame+6,-1).merge(c.trim(frame+7,-1))
m4 = c.trim(frame+8,-1).merge(c.trim(frame+9,-1))
m5 = c.trim(frame+10,-1).merge(c.trim(frame+11,-1))
m6 = c.trim(frame+12,-1).merge(c.trim(frame+13,-1))
m7 = c.trim(frame+14,-1).merge(c.trim(frame+15,-1))
m01 = m0.merge(m1)
m23 = m2.merge(m3)
m45 = m4.merge(m5)
m67 = m6.merge(m7)
m0123 = m01.merge(m23)
m4567 = m45.merge(m67)
return m0123.merge(m4567).autolevels()
}

v85 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-85.mov.avi").ConvertToYV24()
v86 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-86.mov.avi").ConvertToYV24()
v87 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-87.mov.avi").ConvertToYV24()
#v88 as is
#v89 as is
#v90 as is
#v91 as is
v92 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-92.mov.avi").ConvertToYV24()
v93 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-93.mov.avi").ConvertToYV24()
#v94 as is
v95 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-95.mov.avi").ConvertToYV24()
v96 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-96.mov.avi").ConvertToYV24()
v97 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-97.mov.avi").ConvertToYV24()
v98 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-98.mov.avi").ConvertToYV24()
v99 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-99.mov.avi").ConvertToYV24()
v100 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-100.mov.avi").ConvertToYV24()
v101 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-101.mov.avi").ConvertToYV24()
#v102 as is
v103 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-103.mov.avi").ConvertToYV24()
v104 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-104.mov.avi").ConvertToYV24()
v105 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-105.mov.avi").ConvertToYV24()
#v106 as is
v107 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-107.mov.avi").ConvertToYV24()
v108 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-108.mov.avi").ConvertToYV24()
v109 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-109.mov.avi").ConvertToYV24()
v110 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-110.mov.avi").ConvertToYV24()
v111 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-111.mov.avi").ConvertToYV24()
v112 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_85-112\11943 Bakhtin N8 02.720p_04-112.mov.avi").ConvertToYV24()

#return v12.ExtractY.autolevels.prefetch(6)

function AdjustColor(clip c, u, v, y_gamma, sat_mul, float "red_mul", float "grn_mul", float "blu_mul",\
                     bool "fft3d", int "sigma_y", int "sigma_c", bool "a_gamma", int "fft_bw", int "fft_bh")
{
    fft3d = Default(fft3d, false)
    fft_bw = Default(fft_bw, 32)
    fft_bh = Default(fft_bh, 32)
    sigma_y = Default(sigma_y, 40)
    sigma_c = Default(sigma_c, 80)
    a_gamma = Default(a_gamma, false)

    red_mul = Default(red_mul, 1)
    grn_mul = Default(grn_mul, 1)
    blu_mul = Default(blu_mul, 1)

    c = fft3d ? c : c.Filter()
#c = c.BicubicSharp(r = 5, edges = 0.5, str = 2, mode = 1)
    c = c.ColorYUV(off_u=u, off_v=v) # , gamma_y = y_gamma)
#return c.histogram("levels")
    c = c.ConvertToRGB()
    c = c.GamMac(LockChan=1, Scale=2, loTh=0.2, hiTh=0.2, RedMul=red_mul, GrnMul=grn_mul, BluMul=blu_mul, verbosity=5, show=false)
    c = c.ConvertToYV24()

    c = fft3d ? c.fft3dfilter(bw=fft_bw, bh=fft_bh, ow=fft_bw/2, oh=fft_bh/2, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6).\
                  fft3dfilter(bw=fft_bw, bh=fft_bh, ow=fft_bw/2, oh=fft_bh/2, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6) : c
    c = a_gamma ? c.autogamma() : c.ColorYUV(off_u=0, off_v=0, gamma_y = y_gamma)

    c = c.tweak(sat=sat_mul, coring=false)
    return c
}

function AdjustColorWB(clip c, y_gamma)
{
    c = c.tweak(sat=0, coring=false)
    c = c.Filter()
    c = c.ColorYUV(autogain=true, gamma_y = y_gamma)

    return c
}

function Filter(clip c)
{
    bsize = 8
    over = 4
    chrom = true
    hp = 16
    vp = 16
    search_v = 3
    dct_v = 1

    super = c.MSuper(pel=1, sharp=1, hpad=hp, vpad=vp, rfilter=4)
    backward_vec1 = MAnalyse(super, isb = true, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec2 = MAnalyse(super, isb = true, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec3 = MAnalyse(super, isb = true, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec1 = MAnalyse(super, isb = false, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec2 = MAnalyse(super, isb = false, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec3 = MAnalyse(super, isb = false, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
#    return c.MDegrain2(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,thSAD=4000)
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=4000)
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

function AdjustFrameRate1(clip c)
{
super_params="{pel:2,gpu:1}"

analyse_params="""{block:{w:32,h:32,overlap:2}, 
	main:{levels:4,search:{distance:-20, coarse:{distance:-10}}},
	refine:[{thsad:200}]}"""

smoothfps_params="{rate:{num:24,den:1,abs:true},algo:23,cubic:1,mask:{cover:50,area:50},light:{}}"

#c = c.ConvertToYV12().ColorYUV(off_y = -128, gain_y = 255)
c = c.ConvertToYV12().AddBorders(0, 64, 0, 64)

    super = c.SVSuper(super_params)
    vectors = SVAnalyse(super, analyse_params)

    c = c.SVSmoothFps(super, vectors, smoothfps_params, mt=6)
    return c.crop(0, 64, 0, -64).ConvertToYV24()
}
/*
v112 = v112.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 2, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).ColorYUV(off_u=-4, off_v=-4).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,16,0)
return v112.Prefetch(6)
*/
/*
v85 = v85.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 3, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)

v86 = v86.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 3, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,16)

v87 = v87.ColorYUV(gain_y=384).AdjustColor(4, -6, 0, 3, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)

v88 = v88.ColorYUV(gain_y=256).AdjustColor(4, -6, 0, 3, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)

last = v85+v86+v87+v88
ConvertToYV12()
return Prefetch(6)
*/
/*
v89 = v89.AdjustColor(4, -6, 0, 2, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,48,0)

v90 = v90.ColorYUV(gain_y=128).AdjustColor(6, -8, 0, 3, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)

v91 = v91.ColorYUV(gain_y=128).AdjustColor(6, -8, 0, 3, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,48,0)

v92 = v92.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 2, red_mul=0.94, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,48,0)

last = v89+v90+v91+v92
ConvertToYV12()
return Prefetch(6)
*/
/*
v93 = v93.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 2, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,48,0)

v94 = v94.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 2, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,32,0)

v95 = v95.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 2, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,36,20)

v96 = v96.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 2, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,52,28)

last = v93+v94+v95+v96
ConvertToYV12()
return Prefetch(6)
*/
/*
v97 = v97.ColorYUV(gain_y=256).AdjustColor(4, -6, 0, 3, red_mul=0.94, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

v98 = v98.ColorYUV(gain_y=256).AdjustColor(4, -6, 0, 3, red_mul=0.94, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,16,0)

v99 = v99.ColorYUV(gain_y=256).AdjustColor(4, -6, 0, 3, red_mul=0.94, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,16,0)

v100 = v100.ColorYUV(gain_y=128).AdjustColor(8, -10, 0, 2, red_mul=0.98, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,8,0)

last = v97+v98+v99+v100
ConvertToYV12()
return Prefetch(6)
*/
/*
v101 = v101.ColorYUV(gain_y=256).AdjustColor(2, -8, 0, 3, red_mul=0.98, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,8,0)

v102 = v102.ColorYUV(gain_y=256).AdjustColor(2, -8, 0, 3, red_mul=0.98, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,8,0)

v103 = v103.ColorYUV(gain_y=256).AdjustColor(2, -6, 0, 3, red_mul=0.98, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,8,0)

v104 = v104.ColorYUV(gain_y=256).AdjustColor(2, -6, 0, 3, red_mul=0.98, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,8,0)

last = v101+v102+v103+v104
ConvertToYV12()
return Prefetch(6)
*/
/*
v105 = v105.ColorYUV(gain_y=128).AdjustColor(6, -12, 0, 2, red_mul=0.98, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,8,0)

v106 = v106.ColorYUV(gain_y=128).AdjustColor(6, -10, 0, 2, red_mul=0.98, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels.\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,8,0)

v107 = v107.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 2, red_mul=0.96, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,8,0)

v108 = v108.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 3, red_mul=0.96, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,8,0)

last = v105+v106+v107+v108
ConvertToYV12()
return Prefetch(6)
*/

v109 = v109.ColorYUV(gain_y=256).AdjustColor(2, -6, 0, 2, red_mul=0.94, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,16,16,16)

v110 = v110.ColorYUV(gain_y=384).AdjustColor(2, -6, 0, 3, red_mul=0.92, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

v111 = v111.ColorYUV(gain_y=128).AdjustColor(6, -10, 0, 3, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

v112 = v112.ColorYUV(gain_y=128).AdjustColor(2, -6, 0, 2, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).ColorYUV(off_u=-4, off_v=-4).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")#.AddBorders(0,0,16,0)

last = v109+v110+v111+v112
ConvertToYV12()
return Prefetch(6)
