LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v97 = LWLibavVideoSource(source_dir + "v97rc.avi", cache=false)
v97 = v97.convertToYV24(interlaced=false)

v97 = v97.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v97 = v97.removeDirt
v97 = v97.convertToYV12
v97 = v97.UnsharpMask(strength=400, radius=7, threshold=1)
v97 = v97.adjustBorders
#v97 = v97.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v97 = v97.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v97.Prefetch(12)

