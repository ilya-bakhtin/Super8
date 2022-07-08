LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v101 = LWLibavVideoSource(source_dir + "v101rc.avi", cache=false)
v101 = v101.convertToYV24(interlaced=false)

v101 = v101.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v101 = v101.removeDirt
v101 = v101.convertToYV12
v101 = v101.UnsharpMask(strength=400, radius=7, threshold=1)
v101 = v101.adjustBorders
#v101 = v101.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v101 = v101.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v101.Prefetch(12)

