LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v62 = LWLibavVideoSource(source_dir + "v62rc.avi", cache=false)
v62 = v62.convertToYV24(interlaced=false)

v62 = v62.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v62 = v62.removeDirt
v62 = v62.convertToYV12
v62 = v62.UnsharpMask(strength=400, radius=7, threshold=1)
v62 = v62.adjustBorders
#v62 = v62.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v62 = v62.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v62.Prefetch(12)

