LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v129 = LWLibavVideoSource(source_dir + "v129rc.avi", cache=false)
v129 = v129.convertToYV24(interlaced=false)

v129 = v129.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v129 = v129.removeDirt
v129 = v129.convertToYV12
v129 = v129.UnsharpMask(strength=300, radius=5, threshold=1)
v129 = v129.adjustBorders
v129 = v129.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v129.Prefetch(12)

