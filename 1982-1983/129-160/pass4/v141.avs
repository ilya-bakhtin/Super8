LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v141 = LWLibavVideoSource(source_dir + "v141rc.avi", cache=false)
v141 = v141.convertToYV24(interlaced=false)

v141 = v141.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v141 = v141.removeDirt
v141 = v141.convertToYV12
v141 = v141.UnsharpMask(strength=300, radius=5, threshold=1)
v141 = v141.adjustBorders
v141 = v141.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v141.Prefetch(12)

