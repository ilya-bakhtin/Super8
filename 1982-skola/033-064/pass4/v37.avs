LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v37 = LWLibavVideoSource(source_dir + "v37rc.avi", cache=false)
v37 = v37.convertToYV24(interlaced=false)

v37 = v37.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v37 = v37.removeDirt
v37 = v37.convertToYV12
v37 = v37.UnsharpMask(strength=400, radius=7, threshold=1)
v37 = v37.adjustBorders
#v37 = v37.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v37 = v37.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v37.Prefetch(12)

