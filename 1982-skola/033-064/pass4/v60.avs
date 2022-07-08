LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v60 = LWLibavVideoSource(source_dir + "v60rc.avi", cache=false)
v60 = v60.convertToYV24(interlaced=false)

v60 = v60.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v60 = v60.removeDirt
v60 = v60.convertToYV12
v60 = v60.UnsharpMask(strength=400, radius=7, threshold=1)
v60 = v60.adjustBorders
#v60 = v60.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v60 = v60.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v60.Prefetch(12)

