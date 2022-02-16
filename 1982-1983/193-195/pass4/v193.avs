LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v193 = LWLibavVideoSource(source_dir + "v193rc.avi", cache=false)
v193 = v193.convertToYV24(interlaced=false)

v193 = v193.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v193 = v193.removeDirt
v193 = v193.convertToYV12
v193 = v193.UnsharpMask(strength=300, radius=5, threshold=1)
v193 = v193.adjustBorders
v193 = v193.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v193.Prefetch(12)

