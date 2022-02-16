LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v29 = LWLibavVideoSource(source_dir + "v29rc.avi", cache=false)
v29 = v29.convertToYV24(interlaced=false)

v29 = v29.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v29 = v29.removeDirt
v29 = v29.convertToYV12
v29 = v29.UnsharpMask(strength=300, radius=5, threshold=1)
v29 = v29.adjustBorders
v29 = v29.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v29.Prefetch(12)

