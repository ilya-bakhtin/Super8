LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v135 = LWLibavVideoSource(source_dir + "v135rc.avi", cache=false)
v135 = v135.convertToYV24(interlaced=false)

v135 = v135.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v135 = v135.removeDirt
v135 = v135.convertToYV12
v135 = v135.UnsharpMask(strength=300, radius=5, threshold=1)
v135 = v135.adjustBorders
v135 = v135.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v135.Prefetch(12)

