LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v167 = LSMASHVideoSource(dst_dir + "v167rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v167f.mp4")
v167 = ImageSource(file = dst_dir + "v167-png\v167-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v167 = v167.convertToY.adjustSize

#v167 = v167.extractY.convertToYV12(interlaced=false)
#v167 = v167.deScratch.extractY

v167 = v167.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v167 = v167.convertBits(8).convertToYV12(interlaced=false)

v167 = v167.deScratch.extractY
v167 = v167.removeDirt
v167 = v167.convertToYV12(interlaced=false)
v167 = v167.UnsharpMask(strength=400, radius=5, threshold=1)
v167 = v167.adjustBorders
#v167 = v167.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v167 = v167.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v167, audio_rate = 48000, channels = 2).killVideo
v167 = v167.audioDub(va)

return v167.Prefetch

