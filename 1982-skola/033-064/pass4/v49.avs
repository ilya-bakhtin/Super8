LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-1-N8-film.mov.avs")
v49 = LWLibavVideoSource(source_dir + "v49rc.avi", cache=false)
v49 = v49.convertToYV24(interlaced=false)

v49 = v49.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v49 = v49.removeDirt
v49 = v49.convertToYV12
v49 = v49.UnsharpMask(strength=400, radius=7, threshold=1)
v49 = v49.adjustBorders
#v49 = v49.assumefps(18).AdjustFrameRate(preset_p = "slowest")
v49 = v49.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

return v49.Prefetch(12)

