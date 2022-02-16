LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v174 = LWLibavVideoSource(source_dir + "v174rc.avi", cache=false)
v174 = v174.convertToYV24(interlaced=false)

v174 = v174.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v174 = v174.removeDirt
v174 = v174.convertToYV12
v174 = v174.UnsharpMask(strength=300, radius=5, threshold=1)
v174 = v174.adjustBorders
v174 = v174.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v174.Prefetch(12)

