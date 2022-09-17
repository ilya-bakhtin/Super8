LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v184 = LSMASHVideoSource(dst_dir + "v184rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v184f.mp4")
v184 = ImageSource(file = dst_dir + "v184-png\v184-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v184 = v184.convertToY.adjustSize

#v184 = v184.extractY.convertToYV12(interlaced=false)
#v184 = v184.deScratch.extractY

v184 = v184.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v184 = v184.convertBits(8).convertToYV12(interlaced=false)

v184 = v184.deScratch.extractY
v184 = v184.removeDirt
v184 = v184.convertToYV12(interlaced=false)
v184 = v184.UnsharpMask(strength=400, radius=5, threshold=1)
v184 = v184.adjustBorders
#v184 = v184.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v184 = v184.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v184, audio_rate = 48000, channels = 2).killVideo
v184 = v184.audioDub(va)

return v184.Prefetch

