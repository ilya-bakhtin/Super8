LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v159 = LWLibavVideoSource(source_dir + "v159rc.avi", cache=false)
v159 = v159.convertToYV24(interlaced=false)

v159 = v159.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v159 = v159.removeDirt
v159 = v159.convertToYV12
v159 = v159.UnsharpMask(strength=400, radius=7, threshold=1)
v159 = v159.adjustBorders
#v159 = v159.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v159 = v159.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v159.Prefetch(12)

