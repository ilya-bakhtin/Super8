LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v58 = LWLibavVideoSource(source_dir + "v58rc.avi", cache=false)
v58 = v58.convertToYV24(interlaced=false)

v58 = v58.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v58 = v58.removeDirt
v58 = v58.convertToYV12
v58 = v58.UnsharpMask(strength=400, radius=7, threshold=1)
v58 = v58.adjustBorders
#v58 = v58.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v58 = v58.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v58.Prefetch(12)

