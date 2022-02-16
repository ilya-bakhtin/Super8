LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v10 = LWLibavVideoSource(source_dir + "v10rc.avi", cache=false)
v10 = v10.convertToYV24(interlaced=false)

v10 = v10.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v10 = v10.removeDirt
v10 = v10.convertToYV12
v10 = v10.UnsharpMask(strength=300, radius=5, threshold=1)
v10 = v10.adjustBorders
v10 = v10.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v10.Prefetch(12)

