LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v16 = LWLibavVideoSource(source_dir + "v16rc.avi", cache=false)
v16 = v16.convertToYV24(interlaced=false)

v16 = v16.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v16 = v16.removeDirt
v16 = v16.convertToYV12
v16 = v16.UnsharpMask(strength=300, radius=5, threshold=1)
v16 = v16.adjustBorders
v16 = v16.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v16.Prefetch(12)

