LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v99 = LWLibavVideoSource(source_dir + "v99rc.avi", cache=false)
v99 = v99.convertToYV24(interlaced=false)

v99 = v99.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v99 = v99.removeDirt
v99 = v99.convertToYV12
v99 = v99.UnsharpMask(strength=400, radius=7, threshold=1)
v99 = v99.adjustBorders
#v99 = v99.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v99 = v99.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v99.Prefetch(12)

