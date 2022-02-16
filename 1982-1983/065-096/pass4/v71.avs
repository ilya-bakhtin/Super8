LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v71 = LWLibavVideoSource(source_dir + "v71rc.avi", cache=false)
v71 = v71.convertToYV24(interlaced=false)

v71 = v71.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v71 = v71.removeDirt
v71 = v71.convertToYV12
v71 = v71.UnsharpMask(strength=300, radius=5, threshold=1)
v71 = v71.adjustBorders
v71 = v71.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v71.Prefetch(12)

