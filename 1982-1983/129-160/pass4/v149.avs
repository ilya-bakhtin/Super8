LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v149 = LWLibavVideoSource(source_dir + "v149rc.avi", cache=false)
v149 = v149.convertToYV24(interlaced=false)

v149 = v149.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v149 = v149.removeDirt
v149 = v149.convertToYV12
v149 = v149.UnsharpMask(strength=300, radius=5, threshold=1)
v149 = v149.adjustBorders
v149 = v149.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v149.Prefetch(12)

