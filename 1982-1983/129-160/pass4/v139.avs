LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v139 = LWLibavVideoSource(source_dir + "v139rc.avi", cache=false)
v139 = v139.convertToYV24(interlaced=false)

v139 = v139.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v139 = v139.removeDirt
v139 = v139.convertToYV12
v139 = v139.UnsharpMask(strength=300, radius=5, threshold=1)
v139 = v139.adjustBorders
v139 = v139.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v139.Prefetch(12)

