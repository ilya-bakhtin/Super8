LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v94 = LSMASHVideoSource(dst_dir + "v94rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v94f.mp4")
v94 = ImageSource(file = dst_dir + "v94-png\v94-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v94 = v94.convertToY.adjustSize

#v94 = v94.extractY.convertToYV12(interlaced=false)
#v94 = v94.deScratch.extractY

v94 = v94.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v94 = v94.convertBits(8).convertToYV12(interlaced=false)

v94 = v94.deScratch.extractY
v94 = v94.removeDirt
v94 = v94.convertToYV12(interlaced=false)
v94 = v94.UnsharpMask(strength=400, radius=5, threshold=1)
v94 = v94.adjustBorders
#v94 = v94.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v94 = v94.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v94, audio_rate = 48000, channels = 2).killVideo
v94 = v94.audioDub(va)

return v94.Prefetch

