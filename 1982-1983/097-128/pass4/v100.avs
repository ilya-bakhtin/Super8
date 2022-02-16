LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v100 = LWLibavVideoSource(source_dir + "v100rc.avi", cache=false)
v100 = v100.convertToYV24(interlaced=false)

v100 = v100.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v100 = v100.removeDirt
v100 = v100.convertToYV12
v100 = v100.UnsharpMask(strength=300, radius=5, threshold=1)
v100 = v100.adjustBorders
v100 = v100.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v100.Prefetch(12)

