LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v168 = LWLibavVideoSource(source_dir + "v168rc.avi", cache=false)
v168 = v168.convertToYV24(interlaced=false)

v168 = v168.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v168 = v168.removeDirt
v168 = v168.convertToYV12
v168 = v168.UnsharpMask(strength=400, radius=7, threshold=1)
v168 = v168.adjustBorders
#v168 = v168.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v168 = v168.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v168.Prefetch(12)

