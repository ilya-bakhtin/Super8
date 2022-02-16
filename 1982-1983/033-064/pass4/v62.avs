LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v62 = LWLibavVideoSource(source_dir + "v62rc.avi", cache=false)
v62 = v62.convertToYV24(interlaced=false)

v62 = v62.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v62 = v62.removeDirt
v62 = v62.convertToYV12
v62 = v62.UnsharpMask(strength=300, radius=5, threshold=1)
v62 = v62.adjustBorders
v62 = v62.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v62.Prefetch(12)

