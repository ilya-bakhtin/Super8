LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v83 = LWLibavVideoSource(source_dir + "v83rc.avi", cache=false)
v83 = v83.convertToYV24(interlaced=false)

v83 = v83.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v83 = v83.removeDirt
v83 = v83.convertToYV12
v83 = v83.UnsharpMask(strength=400, radius=7, threshold=1)
v83 = v83.adjustBorders
#v83 = v83.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v83 = v83.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v83.Prefetch(12)

