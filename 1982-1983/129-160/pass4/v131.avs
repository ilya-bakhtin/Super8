LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v131 = LWLibavVideoSource(source_dir + "v131rc.avi", cache=false)
v131 = v131.convertToYV24(interlaced=false)

v131 = v131.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v131 = v131.removeDirt
v131 = v131.convertToYV12
v131 = v131.UnsharpMask(strength=300, radius=5, threshold=1)
v131 = v131.adjustBorders
v131 = v131.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v131.Prefetch(12)

