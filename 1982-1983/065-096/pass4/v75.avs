LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v75 = LWLibavVideoSource(source_dir + "v75rc.avi", cache=false)
v75 = v75.convertToYV24(interlaced=false)

v75 = v75.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v75 = v75.removeDirt
v75 = v75.convertToYV12
v75 = v75.UnsharpMask(strength=300, radius=5, threshold=1)
v75 = v75.adjustBorders
v75 = v75.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v75.Prefetch(12)

