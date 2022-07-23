LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v26 = LWLibavVideoSource(source_dir + "v26rc.avi", cache=false)
v26 = v26.convertToYV24(interlaced=false)

v26 = v26.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v26 = v26.removeDirt
v26 = v26.convertToYV12
v26 = v26.UnsharpMask(strength=400, radius=7, threshold=1)
v26 = v26.adjustBorders
#v26 = v26.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v26 = v26.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v26.Prefetch(12)

