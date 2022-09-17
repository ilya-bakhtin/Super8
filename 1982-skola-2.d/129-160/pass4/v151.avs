LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v151 = LSMASHVideoSource(dst_dir + "v151rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v151f.mp4")
v151 = ImageSource(file = dst_dir + "v151-png\v151-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v151 = v151.convertToY.adjustSize

#v151 = v151.extractY.convertToYV12(interlaced=false)
#v151 = v151.deScratch.extractY

v151 = v151.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v151 = v151.convertBits(8).convertToYV12(interlaced=false)

v151 = v151.deScratch.extractY
v151 = v151.removeDirt
v151 = v151.convertToYV12(interlaced=false)
v151 = v151.UnsharpMask(strength=400, radius=5, threshold=1)
v151 = v151.adjustBorders
#v151 = v151.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v151 = v151.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v151, audio_rate = 48000, channels = 2).killVideo
v151 = v151.audioDub(va)

return v151.Prefetch

