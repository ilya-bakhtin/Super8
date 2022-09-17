LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v157 = LSMASHVideoSource(dst_dir + "v157rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v157f.mp4")
v157 = ImageSource(file = dst_dir + "v157-png\v157-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v157 = v157.convertToY.adjustSize

#v157 = v157.extractY.convertToYV12(interlaced=false)
#v157 = v157.deScratch.extractY

v157 = v157.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v157 = v157.convertBits(8).convertToYV12(interlaced=false)

v157 = v157.deScratch.extractY
v157 = v157.removeDirt
v157 = v157.convertToYV12(interlaced=false)
v157 = v157.UnsharpMask(strength=400, radius=5, threshold=1)
v157 = v157.adjustBorders
#v157 = v157.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v157 = v157.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v157, audio_rate = 48000, channels = 2).killVideo
v157 = v157.audioDub(va)

return v157.Prefetch

