LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v164 = LWLibavVideoSource(source_dir + "v164rc.avi", cache=false)
v164 = v164.convertToYV24(interlaced=false)

v164 = v164.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v164 = v164.removeDirt
v164 = v164.convertToYV12
v164 = v164.UnsharpMask(strength=400, radius=7, threshold=1)
v164 = v164.adjustBorders
#v164 = v164.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v164 = v164.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v164.Prefetch(12)

