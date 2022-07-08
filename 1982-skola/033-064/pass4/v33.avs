LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v33 = LWLibavVideoSource(source_dir + "v33rc.avi", cache=false)
v33 = v33.convertToYV24(interlaced=false)

v33 = v33.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v33 = v33.removeDirt
v33 = v33.convertToYV12
v33 = v33.UnsharpMask(strength=400, radius=7, threshold=1)
v33 = v33.adjustBorders
#v33 = v33.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v33 = v33.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v33.Prefetch(12)

