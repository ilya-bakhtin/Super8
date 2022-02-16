LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v23 = LWLibavVideoSource(source_dir + "v23rc.avi", cache=false)
v23 = v23.convertToYV24(interlaced=false)

v23 = v23.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v23 = v23.removeDirt
v23 = v23.convertToYV12
v23 = v23.UnsharpMask(strength=300, radius=5, threshold=1)
v23 = v23.adjustBorders
v23 = v23.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v23.Prefetch(12)

