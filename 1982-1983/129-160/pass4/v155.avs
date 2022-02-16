LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v155 = LWLibavVideoSource(source_dir + "v155rc.avi", cache=false)
v155 = v155.convertToYV24(interlaced=false)

v155 = v155.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v155 = v155.removeDirt
v155 = v155.convertToYV12
v155 = v155.UnsharpMask(strength=300, radius=5, threshold=1)
v155 = v155.adjustBorders
v155 = v155.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v155.Prefetch(12)

