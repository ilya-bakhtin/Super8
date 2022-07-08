LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v44 = LWLibavVideoSource(source_dir + "v44rc.avi", cache=false)
v44 = v44.convertToYV24(interlaced=false)

v44 = v44.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v44 = v44.removeDirt
v44 = v44.convertToYV12
v44 = v44.UnsharpMask(strength=400, radius=7, threshold=1)
v44 = v44.adjustBorders
#v44 = v44.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v44 = v44.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v44.Prefetch(12)

