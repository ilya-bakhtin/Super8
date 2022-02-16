LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v115 = LWLibavVideoSource(source_dir + "v115rc.avi", cache=false)
v115 = v115.convertToYV24(interlaced=false)

v115 = v115.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v115 = v115.removeDirt
v115 = v115.convertToYV12
v115 = v115.UnsharpMask(strength=300, radius=5, threshold=1)
v115 = v115.adjustBorders
v115 = v115.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v115.Prefetch(12)

