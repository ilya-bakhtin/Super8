LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v5 = LWLibavVideoSource(source_dir + "v5rc.avi", cache=false)
v5 = v5.convertToYV24(interlaced=false)

v5 = v5.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v5 = v5.removeDirt
v5 = v5.convertToYV12
v5 = v5.UnsharpMask(strength=300, radius=5, threshold=1)
v5 = v5.adjustBorders
v5 = v5.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v5.Prefetch(12)

