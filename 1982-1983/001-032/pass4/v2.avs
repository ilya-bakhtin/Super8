LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v2 = LWLibavVideoSource(source_dir + "v2rc.avi", cache=false)
v2 = v2.convertToYV24(interlaced=false)

v2 = v2.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v2 = v2.removeDirt
v2 = v2.convertToYV12
v2 = v2.UnsharpMask(strength=300, radius=5, threshold=1)
v2 = v2.adjustBorders
v2 = v2.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v2.Prefetch(12)

