LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v50 = LWLibavVideoSource(source_dir + "v50rc.avi", cache=false)
v50 = v50.convertToYV24(interlaced=false)

v50 = v50.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v50 = v50.removeDirt
v50 = v50.convertToYV12
v50 = v50.UnsharpMask(strength=400, radius=7, threshold=1)
v50 = v50.adjustBorders
#v50 = v50.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v50 = v50.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v50.Prefetch(12)

