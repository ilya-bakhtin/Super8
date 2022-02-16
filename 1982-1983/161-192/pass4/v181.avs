LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v181 = LWLibavVideoSource(source_dir + "v181rc.avi", cache=false)
v181 = v181.convertToYV24(interlaced=false)

v181 = v181.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v181 = v181.removeDirt
v181 = v181.convertToYV12
v181 = v181.UnsharpMask(strength=300, radius=5, threshold=1)
v181 = v181.adjustBorders
v181 = v181.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v181.Prefetch(12)

