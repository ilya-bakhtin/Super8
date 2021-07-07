LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")
LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02.720p_01-.mov.avi")#.ConvertToYV24
src=last
fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=4, sigma2=4, sigma3=20, sigma4=20, wintype=1, sharpen=0, plane=4)#.subtract(src)
#v2=fft3dfilter(sigma=4, sigma2=4, sigma3=40, sigma4=10, plane=4, pframe=1142, px=4, py=4, pfactor=1, pshow=false)#.subtract(src)
#last = v1.subtract(v2)
#return v1
Prefetch(6)
