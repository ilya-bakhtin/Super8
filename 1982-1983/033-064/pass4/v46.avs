LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v46 = LWLibavVideoSource(source_dir + "v46rc.avi", cache=false)
v46 = v46.convertToYV24(interlaced=false)

v46 = v46.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v46 = v46.removeDirt
v46 = v46.convertToYV12
v46 = v46.UnsharpMask(strength=300, radius=5, threshold=1)
v46 = v46.adjustBorders
v46 = v46.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v46.Prefetch(12)

