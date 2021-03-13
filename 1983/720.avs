function Filter(clip c)
{
    bsize = 16
    over = bsize/2
    chrom = true
    hp = bsize
    vp = bsize
    search_v = 4
    dct_v = 0

    super = c.MSuper(pel=1, sharp=2, hpad=hp, vpad=vp, rfilter=4, chroma=chrom)
    super_render = c.MSuper(pel=1, sharp=2, hpad=hp, vpad=vp, levels=1, chroma=chrom)

    backward_vec1 = MAnalyse(super, isb = true, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec2 = MAnalyse(super, isb = true, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec3 = MAnalyse(super, isb = true, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec1 = MAnalyse(super, isb = false, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec2 = MAnalyse(super, isb = false, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec3 = MAnalyse(super, isb = false, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
#    return c.MDegrain2(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,thSAD=4000)
    return c.MDegrain3(super_render, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,\
           thSAD=900, thSADC=900, thSCD1=1600, thSCD2=130, limit=255, limitc=255, plane=4)
}

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov")
crop(240, 0, -240, 0)
#return last
#crop(500, 500, -500, -500)
#trim(4199, 4381)
#trim(12693, 12750)
#trim(10221, 10408)
trim(10409, 10606)

Spline64resize(960, 720)

autolevels(ignore=0)#, filterRadius = 0)
#return MSuper(pel=1, sharp=1, hpad=16, vpad=16, levels=1, rfilter=4)
#return last#.ConvertToRGB.extractB

#r = PointResize(720, 540).Spline64Resize(1440, 1080, src_top=0.25)
r = Spline64Resize(720, 540).Spline64Resize(1440, 1080)

#return last.subtract(r).ColorYUV(off_y = -94).ColorYUV(gain_y = 768).histogram().prefetch(6)

#last = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\1983\stab.avi").ConvertToYV24

#v1 = last.Filter()
#return v1
#v1 = last.TemporalDegrain(degrain=3, SAD1=1000, SAD2=1000)
#v1 = last.TemporalDegrain2(degrainTR=3)
v1 = last.TemporalDegrain2(degrainTR=3, ppSAD1=25, ppSAD2=25)#, postFFT=0, fftThreads=6, postSigma=40)
#return v1.interleave(v2).prefetch(12)

#return histogram("levels")

#v1 = last#.SMDegrain(tr=9, thSAD=1000) #, ppSAD1=60, ppSAD2=60, postFFT=0, fftThreads=6, postSigma=40)
v2 = last.SMDegrain(tr=9, thSAD=900, thSADC=900, RefineMotion=true, prefilter=2)
#return v2.prefetch(6)
return v1.interleave(v2).prefetch(12)
last=v2
#return autolevels(ignore=0, border = 500, filterRadius = 0, debug=true).histogram("levels").prefetch(6)

ColorYUV(off_u=20, off_v=-15)
#return last.histogram("levels").prefetch(12)
ConvertToRGB()
GamMac(LockChan=1, Scale=2, loTh=0.2, hiTh=0, RedMul=1, BluMul=1, verbosity=5, show=false)
ConvertToYV24()

sigma_y = 4
sigma_c = 4

#fft = fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6).\
fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)
#last = fft
autolevels(ignore=0.0001, filterRadius = 0, autolevel=true, gamma=1.5)
#ColorYUV(gamma_y=256)

tweak(sat=2, coring=false)

#return last.interleave(fft.autolevels(ignore=0, filterRadius = 0, autolevel=true, gamma=1.5).tweak(sat=2, coring=false))

#histogram("levels")
#histogram()

#Spline64resize(960, 720)#.histogram("levels")

preset_p = "Slowest"
output_p = "Flow"
blksize_p = 24
assumeFPS(18)
FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
trim(2, 255)
Spline64Resize(1440, 1080)

#orig = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov.avi").ConvertToYV24
#last.interleave(orig)

ConvertToYV12
Prefetch(12)
