LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v24 = LWLibavVideoSource(source_dir + "v24rc.avi", cache=false)
v24 = v24.convertToYV24(interlaced=false)

v24 = v24.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v24 = v24.removeDirt
v24 = v24.convertToYV12
v24 = v24.UnsharpMask(strength=400, radius=7, threshold=1)
v24 = v24.adjustBorders
#v24 = v24.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v24 = v24.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v24.Prefetch(12)

