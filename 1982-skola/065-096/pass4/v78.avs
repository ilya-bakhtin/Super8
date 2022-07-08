LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v78 = LWLibavVideoSource(source_dir + "v78rc.avi", cache=false)
v78 = v78.convertToYV24(interlaced=false)

v78 = v78.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v78 = v78.removeDirt
v78 = v78.convertToYV12
v78 = v78.UnsharpMask(strength=400, radius=7, threshold=1)
v78 = v78.adjustBorders
#v78 = v78.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v78 = v78.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v78.Prefetch(12)

