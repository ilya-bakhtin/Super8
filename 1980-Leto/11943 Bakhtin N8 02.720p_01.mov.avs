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
# 4906, 5007, 5104, 5292, 5359, 5516, 5556, 5773, 5891, 5995, 6152, 6218, 6283, 6464, 6831, 6840, 6940, 

src = last
#return last.ColorYUV(autogain=true)

v1 = src.trim(196, 256).crop(0,0,-36,0)
v2 = src.trim(258, 325).crop(0,0,-36,0)
v3 = src.trim(329, 587)#.crop(0,0,-36,0)
v4 = src.trim(589, 683)#.crop(0,0,-36,0)
v5 = src.trim(686, 841).crop(0,0,-36,0)
v6 = src.trim(843, 954)#.crop(0,0,-36,0)
v7 = src.trim(955, 1064).crop(0,0,-36,0)
v8 = src.trim(1065, 1283).crop(0,0,-36,0)
v9 = src.trim(1290, 1355).crop(0,0,-18,0)
v10 = src.trim(1357, 1486)#.crop(0,0,-18,0)
# bad quality v11_0 = src.trim(1523, 1553).crop(0,0,-36,0)
v11 = src.trim(1563, 1674).crop(0,0,-44,0)
v12 = src.trim(1683, 1765).crop(0,0,-44,0)
v13 = (src.trim(1807, 1836) + src.trim(1838, 1916)).crop(0,0,-18,0)
v14 = src.trim(1917, 2106).crop(0,0,-18,0)
v15 = src.trim(2107, 2182).crop(0,0,-18,0)
v16 = src.trim(2183, 2241).crop(0,0,-18,0)
v17 = src.trim(2242, 2283).crop(0,0,-24,0)
v18 = (src.trim(2284, 2334)+src.trim(2336, 2353)).crop(0,0,-18,0)
v19 = src.trim(2354, 2375).crop(0,0,-18,0)
v20 = (src.trim(2377, 2409)+src.trim(2411, 2423)).crop(0,0,-36,0)
v21 = (src.trim(2425, 2458)+src.trim(2460, 2488)).crop(0,0,-24,0)
v22 = src.trim(2490, 2514).crop(0,0,-36,0)
v23 = src.trim(2515, 2574).crop(0,0,-24,0)
v24 = (src.trim(2577, 2607)+src.trim(2609, 2610)+src.trim(2612, 2666)+src.trim(2669, 2681)+\
       src.trim(2683, 2688)+src.trim(2690, 2691)+src.trim(2693, 2694)+src.trim(2697, 2703)+\
       src.trim(2705, 2818)+src.trim(2820, 2829)+src.trim(2831, 2836)+src.trim(2840, 2849)).crop(0,0,-36,0)
v25 = src.trim(2854, 2981).crop(0,0,-36,0)
v26 = src.trim(2983, 3045).crop(0,0,-36,0)
v27 = src.trim(3047, 3220).crop(0,0,-8,-88)
v28 = src.trim(3233, 3275).crop(0,0,-12,0)

v33 = src.trim(6848, 6939)

#return v28.ExtractY.ColorYUV(autogain=true).fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, sigma2=10, sigma3=40, sigma4=40, plane=4).prefetch(6)
#return v28#.ColorYUV(autogain=true)

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

#return v1+v2#+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24+v25+v26+v27+v28+v29+v30
v1 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-01.mov.avi").ConvertToYV24()
v2 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-02.mov.avi").ConvertToYV24()
v3 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-03.mov.avi").ConvertToYV24()
v4 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-04.mov.avi").ConvertToYV24()
v5 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-05.mov.avi").ConvertToYV24()
v6 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-06.mov.avi").ConvertToYV24()
v7 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-07.mov.avi").ConvertToYV24()
v8 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-08.mov.avi").ConvertToYV24()
v9 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-09.mov.avi").ConvertToYV24()
v10 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-10.mov.avi").ConvertToYV24()
v11 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-11.mov.avi").ConvertToYV24()
v12 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-12.mov.avi").ConvertToYV24().crop(0,48,0,0)
v13 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-13.mov.avi").ConvertToYV24()
#v14 as is
#v15 as is
#v16 as is
#v17 as is
#v18 as is
#v19 as is
v20 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-20.mov.avi").ConvertToYV24()
v21 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-21.mov.avi").ConvertToYV24()
v22 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-22.mov.avi").ConvertToYV24()
v23 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-23.mov.avi").ConvertToYV24()
v24 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-24.mov.avi").ConvertToYV24()
v25 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-25.mov.avi").ConvertToYV24()
v26 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-26.mov.avi").ConvertToYV24()
v27 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-27.mov.avi").ConvertToYV24()
v28 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-28.mov.avi").ConvertToYV24()

v33 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-33.mov.avi").ConvertToYV24()

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

#      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=20, wintype=0, bt=5, ncpu=6, plane=4).\
#return v15.Prefetch(6)
/*
v1 = v1.AdjustColor(4, -5, 0, 1.8, blu_mul=0.92, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40, a_gamma=true).\
     assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,36,0)
v1 = v1.trim(1, v1.FrameCount - 2)

v2 = v2.AdjustColor(5, -7, 0, 1.5, red_mul=0.92, blu_mul=0.92, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40, a_gamma=true).\
     assumefps(16).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,36,0)

v3 = v3.AdjustColor(5, -7, 64, 2, red_mul=0.92, grn_mul=1.1, blu_mul=0.92, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40, a_gamma=true).\
     assumefps(16).AdjustFrameRate(preset_p = "slowest")
v3 = v3.trim(2, 0)

v4 = v4.AdjustColor(5, -7, 0, 1, red_mul=0.92, grn_mul=1.08, blu_mul=0.92).\
     fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, sigma2=4, sigma3=10, sigma4=10, plane=4, wintype=0, bt=5, ncpu=6).\
     assumefps(16).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).tweak(sat=2, coring=false)

last = v1+v2+v3+v4#+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24+v25+v26+v27+v28+v29+v30
ConvertToYV12()
return Prefetch(6)

v5 = v5.AdjustColor(0, -4, 0, 1).\
     fft3dfilter(bw=32, bh=32, ow=16, oh=16, sigma=4, sigma2=4, sigma3=16, sigma4=16, plane=4, wintype=0, bt=5, ncpu=6).\
     assumefps(16).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).tweak(sat=1.6, coring=false).AddBorders(0,0,36,0)

v6 = v6.AdjustColor(0, -4, 0, 1, blu_mul=0.92).\
     fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=1, bt=5, ncpu=6, plane=4).\
     assumefps(16).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96).tweak(sat=1.5, coring=false)

v7 = v7.AdjustColor(0, -4, 0, 1, blu_mul=0.92).\
     fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4).\
     assumefps(12).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96).tweak(sat=1.6, coring=false).AddBorders(0,0,36,0)
v7 = v7.trim(76, 0)

v8 = v8.AdjustColor(-4, -2, 0, 1).\
     fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=20, wintype=0, bt=5, ncpu=6, plane=4).\
     assumefps(16).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96).tweak(sat=1.5, coring=false).AddBorders(0,0,36,0)

last = v5+v6+v7+v8#+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24+v25+v26+v27+v28+v29+v30
ConvertToYV12()
return Prefetch(6)

v9 = v9.AdjustColor(-6, 0, 0, 1).\
     fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=30, wintype=0, bt=5, ncpu=6, plane=4).\
     assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=1.3, coring=false).AddBorders(0,0,18,0)

v10 = v10.AdjustColor(-8, 0, 0, 1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=30, wintype=0, bt=5, ncpu=6, plane=4).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=1.3, coring=false)

v11 = v11.ColorYUV(gain_y=256).AdjustColor(0, -4, 0, 1, fft3d=false, fft_bw=64, fft_bh=64, sigma_y=50).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=30, wintype=0, bt=5, ncpu=6, plane=4).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=2, coring=false).AddBorders(0,0,44,0)

v12 = v12.AdjustColor(-1, -3, 64, 1.5, fft3d=true, fft_bw=64, fft_bh=64).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,48,44,0)
v12 = v12.trim(2, 0)

last = v9+v10+v11+v12#+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24+v25+v26+v27+v28+v29+v30
ConvertToYV12()
return Prefetch(6)

v13 = v13.AdjustColor(0, -3, 64, 1.5, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=30).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,18,0)

v14 = v14.AdjustColor(0, -4, 64, 1.5, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=30).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,18,0)

v15 = v15.AdjustColor(0, -4, 64, 1.5, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,18,0)

v16 = v16.ColorYUV(gain_y=256).AdjustColor(0, -2, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=30, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=3, coring=false).AddBorders(0,0,18,0)
v16 = v16.trim(1, 0)

last = v13+v14+v15+v16#+v17+v18+v19+v20+v21+v22+v23+v24+v25+v26+v27+v28+v29+v30
ConvertToYV12()
return Prefetch(6)

v17 = v17.ColorYUV(gain_y=256).AdjustColor(0, -2, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=30, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=3, coring=false).AddBorders(0,0,24,0)

v18 = v18.ColorYUV(gain_y=256).AdjustColor(0, -2, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=20, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=3, coring=false).AddBorders(0,0,18,0)

v19 = v19.ColorYUV(gain_y=256).AdjustColor(0, -2, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=15, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=3, coring=false).AddBorders(0,0,18,0)

v20 = v20.ColorYUV(gain_y=256).AdjustColor(0, -2, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=15, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=2, coring=false).AddBorders(0,0,36,0)
v20 = v20.trim(0, v20.FrameCount - 1)

last = v17+v18+v19+v20#+v21+v22+v23+v24+v25+v26+v27+v28+v29+v30
ConvertToYV12()
return Prefetch(6)

v21 = v21.ColorYUV(gain_y=256).AdjustColor(0, -2, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).tweak(sat=3, coring=false).AddBorders(0,0,24,0)

v22 = v22.AdjustColor(2, -4, 0, 1, blu_mul=0.92, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=2, coring=false).AddBorders(0,0,36,0)

v23 = v23.ColorYUV(gain_y=128).AdjustColor(2, -4, 0, 1, blu_mul=0.92, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=1.5, coring=false).AddBorders(0,0,24,0)

v24 = v24.AdjustColor(6, -7, 0, 1, blu_mul=0.92, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).tweak(sat=2, coring=false).AddBorders(0,0,36,0)

last = v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
ConvertToYV12()
return Prefetch(6)
*/

v25 = v25.ColorYUV(gain_y=256).AdjustColor(0, 0, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=2, coring=false).AddBorders(0,0,36,0)
#return v25.info.Prefetch(6)

v26 = v26.ColorYUV(gain_y=256).AdjustColor(0, 0, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=3, coring=false).AddBorders(0,0,36,0)

v27 = v27.ColorYUV(gain_y=256).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      AdjustColor(2, -2, 0, 1, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).tweak(sat=3, coring=false).AddBorders(0,0,8,88)

v28 = v28.ColorYUV(gain_y=256).AdjustColor(3, -3, 0, 1, blu_mul=0.92, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=3, coring=false).AddBorders(0,0,12,0)
last = v25+v26+v27+v28#+v29+v30
ConvertToYV12()
return Prefetch(6)

v33 = v33.ColorYUV(gain_y=128).AdjustColor(8, -6, 0, 1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=2, coring=false)#.AddBorders(0,0,24,0)
return v33.Prefetch(6)