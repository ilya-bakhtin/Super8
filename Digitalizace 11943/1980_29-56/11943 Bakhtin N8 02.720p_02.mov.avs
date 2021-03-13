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
# 4906, 5007, 5104, 5292, 5359, 5516, 5556, 5652, 5686, 5766, 5773, 5891, 5995, 6152, 6218, 6283, 6464, 6831, 6840, 6940, 

src = last
#return last.ColorYUV(autogain=true)

#v28 = src.trim(3233, 3275).crop(0,0,-12,0)
v29 = (src.trim(3277, 3396) + src.trim(3402, 3433)).crop(0,0,-24,0)
v30 = src.trim(3437, 3619)
v31 = src.trim(3620, 3814)
v32 = src.trim(3815, 3995)
v33 = src.trim(3996, 4047)
#v34.0 = src.trim(4049, 4061)
v34 = src.trim(4062, 4102)
v35 = src.trim(4103, 4148)
v36 = src.trim(4150, 4179)
v37 = src.trim(4180, 4256)
v38 = src.trim(4257, 4474).crop(0,16,-8,0)
v39 = src.trim(4475, 4603).crop(0,8,-4,0)
v40 = (src.trim(4604, 4666) + src.trim(4669,4765)).crop(0,8,-4,0)
v41 = (src.trim(4766, 4801) + src.trim(4803, 4905)).crop(0,20,-4,0)
v42 = src.trim(4906, 5006)
v43 = src.trim(5007, 5103)
v44 = src.trim(5104, 5291).crop(0,0,-4,-20)
v45 = src.trim(5292, 5358).crop(0,0,-4,0)
v46 = src.trim(5359, 5515).crop(0,0,-4,-20)
#v47.0 = src.trim(5516, 5555)
v47 = src.trim(5556, 5651).crop(0,0,-4,-20)
v48 = src.trim(5652, 5685).crop(0,0,-8,0)
v49 = src.trim(5687, 5765)
v50 = src.trim(5767, 5772).crop(0,0,-24,0)
v51 = (src.trim(5783, 5811) + src.trim(5813, 5890)).crop(0,0,-16,-32)
v52 = src.trim(5891, 5994).crop(0,0,-20,-24)
v53 = src.trim(5995, 6151).crop(0,0,-20,-24)
v54 = src.trim(6153, 6217).crop(0,0,-20,-24)
v55 = src.trim(6223, 6282).crop(0,0,-20,-24)
v56 = src.trim(6292, 6463).crop(0,0,-28,-24)

#return v49.ColorYUV(autogain=true).fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, sigma2=10, sigma3=20, sigma4=20, plane=4).prefetch(6)
#return v56#.ColorYUV(autogain=true)

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

v29 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-29.mov.avi").ConvertToYV24()
v30 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-30.mov.avi").ConvertToYV24()
#v31 as is
v32 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-32.mov.avi").ConvertToYV24()
#v33 as is
v34 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-34.mov.avi").ConvertToYV24()
#v35 as is
#v36 as is
v37 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-37.mov.avi").ConvertToYV24()
#v38 as is
#v39 as is
v40 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-40.mov.avi").ConvertToYV24()
v41 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-41.mov.avi").ConvertToYV24()
#v42 as is
#v43 as is
v44 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-44.mov.avi").ConvertToYV24()
#v45 as is
#v46 as is
v47 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-47.mov.avi").ConvertToYV24()
#v48 as is
v49 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-49.mov.avi").ConvertToYV24()
#v50 as is
v51 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-51.mov.avi").ConvertToYV24()
v52 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-52.mov.avi").ConvertToYV24()
v53 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-53.mov.avi").ConvertToYV24()
v54 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-54.mov.avi").ConvertToYV24()
v55 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-55.mov.avi").ConvertToYV24()
v56 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_29-56\11943 Bakhtin N8 02.720p_02-56.mov.avi").ConvertToYV24()

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
v29 = v29.ColorYUV(gain_y=256).AdjustColor(0, -3, 0, 2, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)
v29 = v29.trim(3, 0)

v30 = v30.ColorYUV(gain_y=256).AdjustColor(2, -3, 0, 3, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128)

v31 = v31.ColorYUV(gain_y=256).AdjustColor(2, -3, 0, 3, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128)

v32 = v32.ColorYUV(gain_y=256).AdjustColor(2, -3, 0, 3, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128)
v32 = v32.trim(1, 0)

last = v29+v30+v31+v32
ConvertToYV12()
return Prefetch(6)
*/

/*
v33 = v33.ColorYUV(gain_y=256).AdjustColor(2, -3, 0, 3, blu_mul=1, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")

v34 = v34.ColorYUV(gain_y=128).AdjustColor(4, -3, 0, 3, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")
v34 = v34.trim(1, 0)

v35 = v35.ColorYUV(gain_y=128).AdjustColor(4, -3, 0, 3, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")
v35 = v35.trim(0, v35.framecount - 2)

v36 = v36.crop(0,8,0,0).ColorYUV(gain_y=256).AdjustColor(4, -3, 0, 3, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,8,0,0)

last = v33+v34+v35+v36
ConvertToYV12()
return Prefetch(6)
*/
/*
v37 = v37.ColorYUV(gain_y=256).AdjustColor(4, -3, 0, 3, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")

v38 = v38.ColorYUV(gain_y=128).AdjustColor(3, -3, 0, 2, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(ignore=0.001, gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,16,8,0)

v39 = v39.ColorYUV(gain_y=256).AdjustColor(3, -3, 0, 3, blu_mul=1, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(ignore=0.000, gamma=1.2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,8,4,0)

v40 = v40.ColorYUV(gain_y=256).AdjustColor(3, -3, 0, 3, blu_mul=1, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).AddBorders(0,8,4,0)

last = v37+v38+v39+v40
ConvertToYV12()
return Prefetch(6)
*/

/*
v41 = v41.ColorYUV(gain_y=256).AdjustColor(3, -3, 0, 1, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).tweak(sat=3, coring=false).AddBorders(0,20,4,0)

v42 = v42.ColorYUV(gain_y=256).AdjustColor(3, -3, 0, 1, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).tweak(sat=3, coring=false)

v43 = v43.ColorYUV(gain_y=354).AdjustColor(3, -3, 0, 1, blu_mul=1, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=128).tweak(sat=3, coring=false)

v44 = v44.ColorYUV(gain_y=384).AdjustColor(7, -6, 0, 1, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").tweak(sat=3, coring=false).AddBorders(0,0,4,20)

last = v41+v42+v43+v44
ConvertToYV12()
return Prefetch(6)
*/

/*
v45 = v45.ColorYUV(gain_y=384).AdjustColor(6, -6, 0, 1, blu_mul=1, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").tweak(sat=3, coring=false).AddBorders(0,0,4,0)

v46 = v46.ColorYUV(gain_y=384).AdjustColor(6, -6, 0, 1, blu_mul=1, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").tweak(sat=3, coring=false).AddBorders(0,0,4,20)

v47 = v47.ColorYUV(gain_y=256).AdjustColor(9, -9, 0, 1, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).tweak(sat=2, coring=false).AddBorders(0,0,4,20)

v48 = v48.ColorYUV(gain_y=384).AdjustColor(6, -6, 0, 1, blu_mul=1, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=40, sigma_c=40).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=0).tweak(sat=3, coring=false).AddBorders(0,0,8,0)

last = v45+v46+v47+v48
ConvertToYV12()
return Prefetch(6)
*/
/*
v49 = v49.ColorYUV(gain_y=256).AdjustColor(5, -5, 0, 2, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=28, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=2).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")

v50 = v50.AdjustColor(15, -9, 0, 1.8, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,0)

v51 = v51.ColorYUV(gain_y=256).AdjustColor(6, -7, 0, 3, blu_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,32)

v52 = v52.ColorYUV(gain_y=128).AdjustColor(6, -7, 0, 2, red_mul=0.96, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,20,24)

last = v49+v50+v51+v52
ConvertToYV12()
return Prefetch(6)
*/
/*
v53 = v53.ColorYUV(gain_y=128).AdjustColor(6, -7, 0, 2, red_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,20,24)

v54 = v54.ColorYUV(gain_y=128).AdjustColor(6, -7, 0, 2, red_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,20,24)

v55 = v55.ColorYUV(gain_y=384).AdjustColor(5, -6, 0, 3, red_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,20,24)

v56 = v56.ColorYUV(gain_y=128).AdjustColor(5, -6, 0, 3, red_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=0, sharpen=0).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=32, wintype=0, bt=5, ncpu=6, plane=3, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,28,24)

last = v53+v54+v55+v56
ConvertToYV12()
return Prefetch(6)
*/