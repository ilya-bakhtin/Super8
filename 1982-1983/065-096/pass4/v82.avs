LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v82 = LWLibavVideoSource(source_dir + "v82rc.avi", cache=false)
v82 = v82.convertToYV24(interlaced=false)

v82 = v82.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v82 = v82.removeDirt
v82 = v82.convertToYV12
v82 = v82.UnsharpMask(strength=300, radius=5, threshold=1)
v82 = v82.adjustBorders
v82 = v82.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v82.Prefetch(12)

