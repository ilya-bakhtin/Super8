LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v21 = LWLibavVideoSource(source_dir + "v21rc.avi", cache=false)
v21 = v21.convertToYV24(interlaced=false)

v21 = v21.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v21 = v21.removeDirt
v21 = v21.convertToYV12
v21 = v21.UnsharpMask(strength=400, radius=7, threshold=1)
v21 = v21.adjustBorders
#v21 = v21.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v21.Prefetch(12)

