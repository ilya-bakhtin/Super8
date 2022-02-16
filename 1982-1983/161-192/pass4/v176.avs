LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v176 = LWLibavVideoSource(source_dir + "v176rc.avi", cache=false)
v176 = v176.convertToYV24(interlaced=false)

v176 = v176.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v176 = v176.removeDirt
v176 = v176.convertToYV12
v176 = v176.UnsharpMask(strength=300, radius=5, threshold=1)
v176 = v176.adjustBorders
v176 = v176.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v176.Prefetch(12)

