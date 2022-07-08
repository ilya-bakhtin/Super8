LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v115 = LWLibavVideoSource(source_dir + "v115rc.avi", cache=false)
v115 = v115.convertToYV24(interlaced=false)

v115 = v115.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v115 = v115.removeDirt
v115 = v115.convertToYV12
v115 = v115.UnsharpMask(strength=400, radius=7, threshold=1)
v115 = v115.adjustBorders
#v115 = v115.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v115 = v115.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v115.Prefetch(12)

