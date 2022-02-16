LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v119 = LWLibavVideoSource(source_dir + "v119rc.avi", cache=false)
v119 = v119.convertToYV24(interlaced=false)

v119 = v119.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v119 = v119.removeDirt
v119 = v119.convertToYV12
v119 = v119.UnsharpMask(strength=300, radius=5, threshold=1)
v119 = v119.adjustBorders
v119 = v119.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v119.Prefetch(12)

