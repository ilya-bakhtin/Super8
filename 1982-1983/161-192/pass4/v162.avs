LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v162 = LWLibavVideoSource(source_dir + "v162rc.avi", cache=false)
v162 = v162.convertToYV24(interlaced=false)

v162 = v162.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v162 = v162.removeDirt
v162 = v162.convertToYV12
v162 = v162.UnsharpMask(strength=300, radius=5, threshold=1)
v162 = v162.adjustBorders
v162 = v162.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v162.Prefetch(12)

