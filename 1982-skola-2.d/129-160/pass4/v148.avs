LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v148 = LSMASHVideoSource(dst_dir + "v148rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v148f.mp4")
v148 = ImageSource(file = dst_dir + "v148-png\v148-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v148 = v148.convertToY.adjustSize

#v148 = v148.extractY.convertToYV12(interlaced=false)
#v148 = v148.deScratch.extractY

v148 = v148.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v148 = v148.convertBits(8).convertToYV12(interlaced=false)

v148 = v148.deScratch.extractY
v148 = v148.removeDirt
v148 = v148.convertToYV12(interlaced=false)
v148 = v148.UnsharpMask(strength=400, radius=5, threshold=1)
v148 = v148.adjustBorders
#v148 = v148.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v148 = v148.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v148, audio_rate = 48000, channels = 2).killVideo
v148 = v148.audioDub(va)

return v148.Prefetch

