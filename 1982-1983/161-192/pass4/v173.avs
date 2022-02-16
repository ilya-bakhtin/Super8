LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v173 = LWLibavVideoSource(source_dir + "v173rc.avi", cache=false)
v173 = v173.convertToYV24(interlaced=false)

v173 = v173.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v173 = v173.removeDirt
v173 = v173.convertToYV12
v173 = v173.UnsharpMask(strength=300, radius=5, threshold=1)
v173 = v173.adjustBorders
v173 = v173.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v173.Prefetch(12)

