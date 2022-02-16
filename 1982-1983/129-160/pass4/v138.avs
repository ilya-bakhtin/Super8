LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v138 = LWLibavVideoSource(source_dir + "v138rc.avi", cache=false)
v138 = v138.convertToYV24(interlaced=false)

v138 = v138.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v138 = v138.removeDirt
v138 = v138.convertToYV12
v138 = v138.UnsharpMask(strength=300, radius=5, threshold=1)
v138 = v138.adjustBorders
v138 = v138.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v138.Prefetch(12)

