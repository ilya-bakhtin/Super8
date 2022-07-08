LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v105 = LWLibavVideoSource(source_dir + "v105rc.avi", cache=false)
v105 = v105.convertToYV24(interlaced=false)

v105 = v105.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v105 = v105.removeDirt
v105 = v105.convertToYV12
v105 = v105.UnsharpMask(strength=400, radius=7, threshold=1)
v105 = v105.adjustBorders
#v105 = v105.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v105 = v105.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v105.Prefetch(12)

