LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v187 = LWLibavVideoSource(source_dir + "v187rc.avi", cache=false)
v187 = v187.convertToYV24(interlaced=false)

v187 = v187.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v187 = v187.removeDirt
v187 = v187.convertToYV12
v187 = v187.UnsharpMask(strength=300, radius=5, threshold=1)
v187 = v187.adjustBorders
v187 = v187.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v187.Prefetch(12)

