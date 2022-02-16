LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v98 = LWLibavVideoSource(source_dir + "v98rc.avi", cache=false)
v98 = v98.convertToYV24(interlaced=false)

v98 = v98.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v98 = v98.removeDirt
v98 = v98.convertToYV12
v98 = v98.UnsharpMask(strength=300, radius=5, threshold=1)
v98 = v98.adjustBorders
v98 = v98.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v98.Prefetch(12)

