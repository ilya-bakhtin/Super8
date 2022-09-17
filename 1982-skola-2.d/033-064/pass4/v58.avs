LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v58 = LSMASHVideoSource(dst_dir + "v58rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v58f.mp4")
v58 = ImageSource(file = dst_dir + "v58-png\v58-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v58 = v58.convertToY.adjustSize

#v58 = v58.extractY.convertToYV12(interlaced=false)
#v58 = v58.deScratch.extractY

v58 = v58.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v58 = v58.convertBits(8).convertToYV12(interlaced=false)

v58 = v58.deScratch.extractY
v58 = v58.removeDirt
v58 = v58.convertToYV12(interlaced=false)
v58 = v58.UnsharpMask(strength=400, radius=5, threshold=1)
v58 = v58.adjustBorders
#v58 = v58.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v58 = v58.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v58, audio_rate = 48000, channels = 2).killVideo
v58 = v58.audioDub(va)

return v58.Prefetch

