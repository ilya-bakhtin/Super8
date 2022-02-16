LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v164 = LWLibavVideoSource(source_dir + "v164rc.avi", cache=false)
v164 = v164.convertToYV24(interlaced=false)

v164 = v164.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v164 = v164.removeDirt
v164 = v164.convertToYV12
v164 = v164.UnsharpMask(strength=300, radius=5, threshold=1)
v164 = v164.adjustBorders
v164 = v164.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v164.Prefetch(12)

