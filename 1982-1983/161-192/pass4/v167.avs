LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v167 = LWLibavVideoSource(source_dir + "v167rc.avi", cache=false)
v167 = v167.convertToYV24(interlaced=false)

v167 = v167.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v167 = v167.removeDirt
v167 = v167.convertToYV12
v167 = v167.UnsharpMask(strength=300, radius=5, threshold=1)
v167 = v167.adjustBorders
v167 = v167.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v167.Prefetch(12)

