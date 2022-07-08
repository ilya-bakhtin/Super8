LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v45 = LWLibavVideoSource(source_dir + "v45rc.avi", cache=false)
v45 = v45.convertToYV24(interlaced=false)

v45 = v45.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v45 = v45.removeDirt
v45 = v45.convertToYV12
v45 = v45.UnsharpMask(strength=400, radius=7, threshold=1)
v45 = v45.adjustBorders
#v45 = v45.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v45 = v45.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v45.Prefetch(12)

