LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v47 = LWLibavVideoSource(source_dir + "v47rc.avi", cache=false)
v47 = v47.convertToYV24(interlaced=false)

v47 = v47.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v47 = v47.removeDirt
v47 = v47.convertToYV12
v47 = v47.UnsharpMask(strength=400, radius=7, threshold=1)
v47 = v47.adjustBorders
#v47 = v47.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v47 = v47.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v47.Prefetch(12)

