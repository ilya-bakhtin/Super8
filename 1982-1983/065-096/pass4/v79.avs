LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v79 = LWLibavVideoSource(source_dir + "v79rc.avi", cache=false)
v79 = v79.convertToYV24(interlaced=false)

v79 = v79.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v79 = v79.removeDirt
v79 = v79.convertToYV12
v79 = v79.UnsharpMask(strength=300, radius=5, threshold=1)
v79 = v79.adjustBorders
v79 = v79.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v79.Prefetch(12)

