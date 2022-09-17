LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v135 = LSMASHVideoSource(dst_dir + "v135rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v135f.mp4")
v135 = ImageSource(file = dst_dir + "v135-png\v135-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v135 = v135.convertToY.adjustSize

#v135 = v135.extractY.convertToYV12(interlaced=false)
#v135 = v135.deScratch.extractY

v135 = v135.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v135 = v135.convertBits(8).convertToYV12(interlaced=false)

v135 = v135.deScratch.extractY
v135 = v135.removeDirt
v135 = v135.convertToYV12(interlaced=false)
v135 = v135.UnsharpMask(strength=400, radius=5, threshold=1)
v135 = v135.adjustBorders
#v135 = v135.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v135 = v135.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v135, audio_rate = 48000, channels = 2).killVideo
v135 = v135.audioDub(va)

return v135.Prefetch

