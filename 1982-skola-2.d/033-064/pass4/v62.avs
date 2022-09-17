LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v62 = LSMASHVideoSource(dst_dir + "v62rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v62f.mp4")
v62 = ImageSource(file = dst_dir + "v62-png\v62-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v62 = v62.convertToY.adjustSize

#v62 = v62.extractY.convertToYV12(interlaced=false)
#v62 = v62.deScratch.extractY

v62 = v62.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v62 = v62.convertBits(8).convertToYV12(interlaced=false)

v62 = v62.deScratch.extractY
v62 = v62.removeDirt
v62 = v62.convertToYV12(interlaced=false)
v62 = v62.UnsharpMask(strength=400, radius=5, threshold=1)
v62 = v62.adjustBorders
#v62 = v62.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v62 = v62.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v62, audio_rate = 48000, channels = 2).killVideo
v62 = v62.audioDub(va)

return v62.Prefetch

