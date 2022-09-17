LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v119 = LSMASHVideoSource(dst_dir + "v119rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v119f.mp4")
v119 = ImageSource(file = dst_dir + "v119-png\v119-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v119 = v119.convertToY.adjustSize

#v119 = v119.extractY.convertToYV12(interlaced=false)
#v119 = v119.deScratch.extractY

v119 = v119.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v119 = v119.convertBits(8).convertToYV12(interlaced=false)

v119 = v119.deScratch.extractY
v119 = v119.removeDirt
v119 = v119.convertToYV12(interlaced=false)
v119 = v119.UnsharpMask(strength=400, radius=5, threshold=1)
v119 = v119.adjustBorders
#v119 = v119.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v119 = v119.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v119, audio_rate = 48000, channels = 2).killVideo
v119 = v119.audioDub(va)

return v119.Prefetch

