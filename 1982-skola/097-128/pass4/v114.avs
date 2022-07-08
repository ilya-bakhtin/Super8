LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v114 = LWLibavVideoSource(source_dir + "v114rc.avi", cache=false)
v114 = v114.convertToYV24(interlaced=false)

v114 = v114.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v114 = v114.removeDirt
v114 = v114.convertToYV12
v114 = v114.UnsharpMask(strength=400, radius=7, threshold=1)
v114 = v114.adjustBorders
#v114 = v114.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v114 = v114.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v114.Prefetch(12)

