LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v77 = LWLibavVideoSource(source_dir + "v77rc.avi", cache=false)
v77 = v77.convertToYV24(interlaced=false)

v77 = v77.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v77 = v77.removeDirt
v77 = v77.convertToYV12
v77 = v77.UnsharpMask(strength=300, radius=5, threshold=1)
v77 = v77.adjustBorders
v77 = v77.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v77.Prefetch(12)

