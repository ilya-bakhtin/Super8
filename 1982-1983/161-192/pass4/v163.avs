LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v163 = LWLibavVideoSource(source_dir + "v163rc.avi", cache=false)
v163 = v163.convertToYV24(interlaced=false)

v163 = v163.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v163 = v163.removeDirt
v163 = v163.convertToYV12
v163 = v163.UnsharpMask(strength=300, radius=5, threshold=1)
v163 = v163.adjustBorders
v163 = v163.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v163.Prefetch(12)

