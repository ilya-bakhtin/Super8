LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v92 = LWLibavVideoSource(source_dir + "v92rc.avi", cache=false)
v92 = v92.convertToYV24(interlaced=false)

v92 = v92.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v92 = v92.removeDirt
v92 = v92.convertToYV12
v92 = v92.UnsharpMask(strength=300, radius=5, threshold=1)
v92 = v92.adjustBorders
v92 = v92.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v92.Prefetch(12)

