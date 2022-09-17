LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v190 = LSMASHVideoSource(dst_dir + "v190rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v190f.mp4")
v190 = ImageSource(file = dst_dir + "v190-png\v190-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v190 = v190.convertToY.adjustSize

#v190 = v190.extractY.convertToYV12(interlaced=false)
#v190 = v190.deScratch.extractY

v190 = v190.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v190 = v190.convertBits(8).convertToYV12(interlaced=false)

v190 = v190.deScratch.extractY
v190 = v190.removeDirt
v190 = v190.convertToYV12(interlaced=false)
v190 = v190.UnsharpMask(strength=400, radius=5, threshold=1)
v190 = v190.adjustBorders
#v190 = v190.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v190 = v190.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v190, audio_rate = 48000, channels = 2).killVideo
v190 = v190.audioDub(va)

return v190.Prefetch

