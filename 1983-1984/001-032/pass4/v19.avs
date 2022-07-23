LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1983-1984.mov.avs")
v19 = LWLibavVideoSource(source_dir + "v19rc.avi", cache=false)
v19 = v19.convertToYV24(interlaced=false)

v19 = v19.Filter(th_SAD=200, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v19 = v19.removeDirt
v19 = v19.convertToYV12
v19 = v19.UnsharpMask(strength=400, radius=7, threshold=1)
v19 = v19.adjustBorders
#v19 = v19.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = v19.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v19.Prefetch(12)

