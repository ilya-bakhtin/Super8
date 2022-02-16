LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v171 = LWLibavVideoSource(source_dir + "v171rc.avi", cache=false)
v171 = v171.convertToYV24(interlaced=false)

v171 = v171.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v171 = v171.removeDirt
v171 = v171.convertToYV12
v171 = v171.UnsharpMask(strength=300, radius=5, threshold=1)
v171 = v171.adjustBorders
v171 = v171.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v171.Prefetch(12)

