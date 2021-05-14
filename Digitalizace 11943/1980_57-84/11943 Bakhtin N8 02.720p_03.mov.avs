SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
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
# 12076, 12086, 12088, 12090, 12141, 12159, 12222, 12376, 12535, 12681, 12756, 12855, 12984, 13294, 13558, 13567, 13689, 13864

global src = last
#return last.ColorYUV(autogain=true)

#v56 = src.trim(6292, 6463).crop(0,0,-28,-24)
v57 = (src.trim(6466, 6499) + src.trim(6501, 6532) + src.trim(6535, 6593) + src.trim(6595, 6598) + src.trim(6601, 6830)).crop(0,16,0,-16)
#v58.0 = src.trim(6831, 6839)
v58 = src.trim(6850, 6939).crop(0,16,0,0).autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 9, minRng=0)
#v59.0 = src.trim(6940, 7172)
v59 = src.trim(7243, 7254).autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0)
v60 = src.trim(7285, 7332).autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0)
v61 = src.trim(7350, 7371).autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0)
#v62.0 = src.trim(7372, 7683)
v62 = src.trim(7684, 7724)
v63 = src.trim(7725, 7750).crop(0,32,-16,0)
v64 = src.trim(7751, 7786)
v65 = src.trim(7787, 7835).crop(0,0,-16,-16)
v66 = src.trim(7836, 7849)
v67 = src.trim(7850, 8000).crop(0,8,-24,0).autolevels(ignore_low=0.00003, ignore_high=0.003, filterRadius = 0, minRng=0)
v68 = src.trim(8001, 8199).crop(0,0,-24,0).autolevels(ignore_low=0.00003, ignore_high=0.003, filterRadius = 1, minRng=0)
v69 = src.trim(8200, 8323).crop(0,0,-28,0).autolevels(ignore_low=0.00003, ignore_high=0.003, border_t=200, filterRadius = 1, minRng=0)
#v70.0 = src.trim(8336, 8386)
v70 = src.trim(8401, 8483).crop(0,16,-28,0)
v71 = src.trim(8484, 8567).crop(0,16,-28,0)
v72 = src.trim(8568, 8639).crop(0,8,-28,0)
#v73.0 = src.trim(8640, 8645)
v73 = (src.trim(8646, 8670) + src.trim(8672, 8723)).crop(0,0,-28,0)
v74 = (src.trim(8724, 8744) + src.trim(8746, 8755)).crop(0,0,-24,-20)
v75 = src.trim(8793, 8871).crop(0,0,-24,-20)
v76 = src.trim(8875, 8999).crop(0,0,-16,0)
#v77.0 = src.trim(9000, 9082)
v77 = src.trim(9083, 9226)
v77 = (v77.trim(6, 16) + v77.trim(22, 23) + v77.trim(27, 33) + v77.trim(40, 0)).crop(0,16,-32,0)
v78 = src.trim(9228, 9319).crop(0,0,-24,-8)
v79 = src.trim(9320, 9460).crop(0,0,-32,0)
v80 = src.trim(9464, 9620).crop(0,0,-32,0)
#v81.0 = src.trim(9621, 9747).crop(64,0,-32,0)
v81 = src.trim(9753, 10071).crop(0,0,-56,0)
v82 = src.trim(10072, 10124).crop(0,0,-56,0)
v83 = src.trim(10125, 10185).crop(0,0,-56,0)
v84 = src.trim(10186, 10311).crop(0,0,-56,0)

#return v81.autolevels.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=10, sigma2=10, sigma3=20, sigma4=20, plane=4).prefetch(6)
#return v84#.ColorYUV(autogain=true)

global filter16 = false

#v58 = v58.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
#v58 = v58.extractY.autolevels(ignore = 0.1, filterRadius=0)

#v60 = v60.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
#v60 = v60.extractY.autolevels(ignore = 0.1, filterRadius=0)

#v67 = v67.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=0, sigma_c=0)
#v67 = v67.extractY.autolevels(ignore = 0.2, filterRadius=0)

#v68 = v68.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8, truemotion=true, sigma_y=40, sigma_c=80)
#v68 = v68.extractY.autolevels(ignore = 0.4, filterRadius=0)

#return v69.prefetch(6)

/*
v57 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-57.mov.avi").ConvertToYV24()
v58 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-58.mov.avi").ConvertToYV24()
#v59 as is
v60 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-60.mov.avi").ConvertToYV24()
#v61 as is
#v62 as is
#v63 as is
#v64 as is
v65 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-65.mov.avi").ConvertToYV24()
v66 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-66.mov.avi").ConvertToYV24()
v67 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-67.mov.avi").ConvertToYV24()
v68 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-68.mov.avi").ConvertToYV24()
#v69 as is
#v70 as is
v71 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-71.mov.avi").ConvertToYV24()
#v72 as is
v73 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-73.mov.avi").ConvertToYV24()
v74 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-74.mov.avi").ConvertToYV24()
v75 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-75.mov.avi").ConvertToYV24()
v76 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-76.mov.avi").ConvertToYV24()
v77 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-77.mov.avi").ConvertToYV24()
#v78 as is
v79 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-79.mov.avi").ConvertToYV24()
v80 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-80.mov.avi").ConvertToYV24()
v81 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-81.mov.avi").ConvertToYV24()
v82 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-82.mov.avi").ConvertToYV24()
v83 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-83.mov.avi").ConvertToYV24()
v84 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\11943 Bakhtin N8 02.720p_03-84.mov.avi").ConvertToYV24()

#return v12.ExtractY.autolevels.prefetch(6)
*/

/*

#******

# 58


v58 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_57-84\pass2\v058f.avi").ConvertToYV24()
v58 = v58.AdjustColor(ou=20, ov=-20, lo_th=0.1, hi_th=0.1, sat=2, red=1, gam_mac=true)
v58 = v58.convertToYV12
v58 = v58.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v58 = v58.removeDirt
v58 = v58.autolevels(ignore_low=0.0003, ignore_high=0.0003, filterRadius = 0, minRng=0, gamma=1.5)
#v58 = v58.UnsharpMask(strength=100, radius=3, threshold=1)
#fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
#.ColorYUV(gamma_y=64).
return v58.histogram("levels").prefetch(6)
v58 = v58.adjustBorders
return v58.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#******


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

function adjustBorders(clip c)
{
    return src.height == c.height && src.width == c.width ? c : c.addBorders(0, 0, src.width - c.width, src.height - c.height)
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
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=4000)
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
    c = sigma_y == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6)
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
#dh = src.height - input.height
#dw = src.width - input.width
#input = input.adjustBorders.info
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
v84 = v84.AdjustColor(4, -6, 0, 1.5, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)
return v84.Prefetch(6)

v57 = v57.ColorYUV(gain_y=128).AdjustColor(5, -4, 0, 1, red_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96).tweak(sat=3, coring=false).AddBorders(0,16,0,16)

v58 = v58.ColorYUV(gain_y=128).AdjustColor(10, -10, 0, 3, red_mul=1, fft3d=false).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=6, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64).AddBorders(0,16,0,0)

v59 = v59.ColorYUV(gain_y=128).AdjustColor(12, -10, 0, 2, blu_mul=0.96, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=20, sigma_c=20).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=64)

v60 = v60.ColorYUV(gain_y=128).AdjustColor(12, -10, 0, 2, grn_mul=0.96, blu_mul=0.96, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=10, sigma_c=20).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")

last = v57+v58+v59+v60
ConvertToYV12()
return Prefetch(6)

v61 = v61.ColorYUV(gain_y=128).AdjustColor(12, -10, 0, 2, grn_mul=0.96, blu_mul=0.96, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=10, sigma_c=20).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest")

v62 = v62.ColorYUV(gain_y=384).AdjustColor(4, -8, 0, 3).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96)

v63 = v63.ColorYUV(gain_y=256).AdjustColor(1, -7, 0, 3, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96).AddBorders(0,32,16,0)

v64 = v64.ColorYUV(gain_y=256).AdjustColor(1, -7, 0, 3, red_mul=0.96, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96)

last = v61+v62+v63+v64
ConvertToYV12()
return Prefetch(6)

v65 = v65.ColorYUV(gain_y=256).AdjustColor(1, -7, 0, 2, red_mul=1, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96).AddBorders(0,0,16,16)

v66 = v66.ColorYUV(gain_y=256).AdjustColor(1, -7, 0, 3, red_mul=1, blu_mul=0.96, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=16, sigma_c=20).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96)

v67 = v67.ColorYUV(gain_y=256).AdjustColor(1, -7, 0, 3, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").ColorYUV(gamma_y=96).AddBorders(0,0,24,0)
v67 = v67.trim(0, v67.framecount - 10)

v68 = v68.ColorYUV(gain_y=512).AdjustColor(2, -7, 0, 3, blu_mul=0.96, fft3d=true, fft_bw=64, fft_bh=64, sigma_y=30, sigma_c=40).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").autogamma.AddBorders(0,0,24,0)

last = v65+v66+v67+v68
ConvertToYV12()
return Prefetch(6)

v69 = v69.ColorYUV(gain_y=384).AdjustColor(2, -7, 0, 3, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=18, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").autogamma.AddBorders(0,0,28,0)

v70 = v70.ColorYUV(gain_y=384).AdjustColor(2, -7, 0, 3, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=18, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").autogamma.AddBorders(0,16,28,0)

v71 = v71.ColorYUV(gain_y=384).AdjustColor(2, -7, 0, 3, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=18, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").autogamma.AddBorders(0,16,28,0)

v72 = v72.ColorYUV(gain_y=384).AdjustColor(2, -7, 0, 3, blu_mul=1).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=18, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").autogamma.AddBorders(0,8,28,0)

last = v69+v70+v71+v72
ConvertToYV12()
return Prefetch(6)

v73 = v73.ColorYUV(gain_y=256).AdjustColor(2, -7, 64, 3, blu_mul=0.96).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=18, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,28,0)

v74 = v74.ColorYUV(gain_y=196).AdjustColor(2, -7, 0, 3, blu_mul=0.94, a_gamma=true).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,20)

v75 = v75.ColorYUV(gain_y=384).AdjustColor(2, -7, 0, 3, blu_mul=0.94, a_gamma=true).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=24, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,20)

v76 = v76.ColorYUV(gain_y=256).AdjustColor(2, -7, 0, 3, red_mul=0.94, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.8).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,16,0)

last = v73+v74+v75+v76
ConvertToYV12()
return Prefetch(6)

v77 = v77.ColorYUV(gain_y=384).AdjustColor(2, -7, 0, 3, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.6).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,16,32,0)

v78 = v78.ColorYUV(gain_y=256).AdjustColor(3, -7, 0, 3, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=16, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.6).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,24,8)

v79 = v79.ColorYUV(gain_y=256).AdjustColor(3, -7, 0, 3, red_mul=1, blu_mul=0.94).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.6).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,32,0)

v80 = v80.ColorYUV(gain_y=128).AdjustColor(6, -7, 0, 3, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.3).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,32,0)

last = v77+v78+v79+v80
ConvertToYV12()
return Prefetch(6)

v81 = v81.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 2, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=12, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)

v82 = v82.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 2, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)

v83 = v83.ColorYUV(gain_y=128).AdjustColor(4, -6, 0, 2, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)

v84 = v84.AdjustColor(4, -6, 0, 1.5, red_mul=1, blu_mul=0.92).\
      fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=8, wintype=0, bt=5, ncpu=6, plane=4, sharpen=0).autolevels(gamma=1.5).\
      assumefps(18).AdjustFrameRate(preset_p = "slowest").AddBorders(0,0,56,0)

last = v81+v82+v83+v84
ConvertToYV12()
return Prefetch(6)
*/