LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v95 = LWLibavVideoSource(source_dir + "v95rc.avi", cache=false)
v95 = v95.convertToYV24(interlaced=false)

v95 = v95.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v95 = v95.removeDirt
v95 = v95.convertToYV12
v95 = v95.UnsharpMask(strength=300, radius=5, threshold=1)
v95 = v95.adjustBorders
v95 = v95.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v95.Prefetch(12)

