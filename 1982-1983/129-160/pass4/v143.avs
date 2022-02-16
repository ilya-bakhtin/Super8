LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v143 = LWLibavVideoSource(source_dir + "v143rc.avi", cache=false)
v143 = v143.convertToYV24(interlaced=false)

v143 = v143.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v143 = v143.removeDirt
v143 = v143.convertToYV12
v143 = v143.UnsharpMask(strength=300, radius=5, threshold=1)
v143 = v143.adjustBorders
v143 = v143.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v143.Prefetch(12)

