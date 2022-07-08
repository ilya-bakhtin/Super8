LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v98 = LWLibavVideoSource(source_dir + "v98rc.avi", cache=false)
v98 = v98.convertToYV24(interlaced=false)

v98 = v98.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v98 = v98.removeDirt
v98 = v98.convertToYV12
v98 = v98.UnsharpMask(strength=400, radius=7, threshold=1)
v98 = v98.adjustBorders
#v98 = v98.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v98 = v98.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v98.Prefetch(12)

