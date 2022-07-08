LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v162 = LWLibavVideoSource(source_dir + "v162rc.avi", cache=false)
v162 = v162.convertToYV24(interlaced=false)

v162 = v162.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v162 = v162.removeDirt
v162 = v162.convertToYV12
v162 = v162.UnsharpMask(strength=400, radius=7, threshold=1)
v162 = v162.adjustBorders
#v162 = v162.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v162 = v162.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v162.Prefetch(12)

