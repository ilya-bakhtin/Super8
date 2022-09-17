LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v108 = LSMASHVideoSource(dst_dir + "v108rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v108f.mp4")
v108 = ImageSource(file = dst_dir + "v108-png\v108-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v108 = v108.convertToY.adjustSize

#v108 = v108.extractY.convertToYV12(interlaced=false)
#v108 = v108.deScratch.extractY

v108 = v108.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v108 = v108.convertBits(8).convertToYV12(interlaced=false)

v108 = v108.deScratch.extractY
v108 = v108.removeDirt
v108 = v108.convertToYV12(interlaced=false)
v108 = v108.UnsharpMask(strength=400, radius=5, threshold=1)
v108 = v108.adjustBorders
#v108 = v108.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v108 = v108.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v108, audio_rate = 48000, channels = 2).killVideo
v108 = v108.audioDub(va)

return v108.Prefetch

