LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v166 = LWLibavVideoSource(source_dir + "v166rc.avi", cache=false)
v166 = v166.convertToYV24(interlaced=false)

v166 = v166.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v166 = v166.removeDirt
v166 = v166.convertToYV12
v166 = v166.UnsharpMask(strength=400, radius=7, threshold=1)
v166 = v166.adjustBorders
#v166 = v166.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v166 = v166.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v166.Prefetch(12)

