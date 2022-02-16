LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v19 = LWLibavVideoSource(source_dir + "v19rc.avi", cache=false)
v19 = v19.convertToYV24(interlaced=false)

v19 = v19.Filter(th_SAD=1700, th_SADC=1700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v19 = v19.removeDirt
v19 = v19.convertToYV12
v19 = v19.UnsharpMask(strength=300, radius=5, threshold=1)
v19 = v19.adjustBorders
#return v19.Prefetch(12)
v19 = v19.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v19.Prefetch(12)

