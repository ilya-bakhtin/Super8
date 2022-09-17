LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v185 = LSMASHVideoSource(dst_dir + "v185rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v185f.mp4")
v185 = ImageSource(file = dst_dir + "v185-png\v185-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v185 = v185.convertToY.adjustSize

#v185 = v185.extractY.convertToYV12(interlaced=false)
#v185 = v185.deScratch.extractY

v185 = v185.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v185 = v185.convertBits(8).convertToYV12(interlaced=false)

v185 = v185.deScratch.extractY
v185 = v185.removeDirt
v185 = v185.convertToYV12(interlaced=false)
v185 = v185.UnsharpMask(strength=400, radius=5, threshold=1)
v185 = v185.adjustBorders
#v185 = v185.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v185 = v185.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v185, audio_rate = 48000, channels = 2).killVideo
v185 = v185.audioDub(va)

return v185.Prefetch

