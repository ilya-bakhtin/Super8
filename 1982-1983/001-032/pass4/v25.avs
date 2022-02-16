LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v25 = LWLibavVideoSource(source_dir + "v25rc.avi", cache=false)
v25 = v25.convertToYV24(interlaced=false)

v25 = v25.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v25 = v25.removeDirt
v25 = v25.convertToYV12
v25 = v25.UnsharpMask(strength=300, radius=5, threshold=1)
v25 = v25.adjustBorders
v25 = v25.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v25.Prefetch(12)

