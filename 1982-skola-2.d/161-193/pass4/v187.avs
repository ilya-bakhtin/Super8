LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v187 = LSMASHVideoSource(dst_dir + "v187rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v187f.mp4")
v187 = ImageSource(file = dst_dir + "v187-png\v187-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v187 = v187.convertToY.adjustSize

#v187 = v187.extractY.convertToYV12(interlaced=false)
#v187 = v187.deScratch.extractY

v187 = v187.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v187 = v187.convertBits(8).convertToYV12(interlaced=false)

v187 = v187.deScratch.extractY
v187 = v187.removeDirt
v187 = v187.convertToYV12(interlaced=false)
v187 = v187.UnsharpMask(strength=400, radius=5, threshold=1)
v187 = v187.adjustBorders
#v187 = v187.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v187 = v187.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v187, audio_rate = 48000, channels = 2).killVideo
v187 = v187.audioDub(va)

return v187.Prefetch

