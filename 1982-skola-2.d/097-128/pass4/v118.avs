LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v118 = LSMASHVideoSource(dst_dir + "v118rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v118f.mp4")
v118 = ImageSource(file = dst_dir + "v118-png\v118-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v118 = v118.convertToY.adjustSize

#v118 = v118.extractY.convertToYV12(interlaced=false)
#v118 = v118.deScratch.extractY

v118 = v118.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v118 = v118.convertBits(8).convertToYV12(interlaced=false)

v118 = v118.deScratch.extractY
v118 = v118.removeDirt
v118 = v118.convertToYV12(interlaced=false)
v118 = v118.UnsharpMask(strength=400, radius=5, threshold=1)
v118 = v118.adjustBorders
#v118 = v118.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v118 = v118.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v118, audio_rate = 48000, channels = 2).killVideo
v118 = v118.audioDub(va)

return v118.Prefetch

