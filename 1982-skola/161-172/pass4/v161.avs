LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v161 = LWLibavVideoSource(source_dir + "v161rc.avi", cache=false)
v161 = v161.convertToYV24(interlaced=false)

v161 = v161.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v161 = v161.removeDirt
v161 = v161.convertToYV12
v161 = v161.UnsharpMask(strength=400, radius=7, threshold=1)
v161 = v161.adjustBorders
#v161 = v161.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v161 = v161.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v161.Prefetch(12)

