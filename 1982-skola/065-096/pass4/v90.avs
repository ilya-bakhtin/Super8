LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v90 = LWLibavVideoSource(source_dir + "v90rc.avi", cache=false)
v90 = v90.convertToYV24(interlaced=false)

v90 = v90.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v90 = v90.removeDirt
v90 = v90.convertToYV12
v90 = v90.UnsharpMask(strength=400, radius=7, threshold=1)
v90 = v90.adjustBorders
#v90 = v90.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v90 = v90.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v90.Prefetch(12)

