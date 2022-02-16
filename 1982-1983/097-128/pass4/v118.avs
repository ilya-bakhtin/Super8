LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\8mm film 2048x1536 18Fps.mov.avs")
v118 = LWLibavVideoSource(source_dir + "v118rc.avi", cache=false)
v118 = v118.convertToYV24(interlaced=false)

v118 = v118.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v118 = v118.removeDirt
v118 = v118.convertToYV12
v118 = v118.UnsharpMask(strength=300, radius=5, threshold=1)
v118 = v118.adjustBorders
v118 = v118.assumefps(18).AdjustFrameRate(preset_p = "slowest")

return v118.Prefetch(12)

