LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v136 = LSMASHVideoSource(dst_dir + "v136rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v136f.mp4")
v136 = ImageSource(file = dst_dir + "v136-png\v136-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v136 = v136.convertToY.adjustSize

#v136 = v136.extractY.convertToYV12(interlaced=false)
#v136 = v136.deScratch.extractY

v136 = v136.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v136 = v136.convertBits(8).convertToYV12(interlaced=false)

v136 = v136.deScratch.extractY
v136 = v136.removeDirt
v136 = v136.convertToYV12(interlaced=false)
v136 = v136.UnsharpMask(strength=400, radius=5, threshold=1)
v136 = v136.adjustBorders
#v136 = v136.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v136 = v136.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v136, audio_rate = 48000, channels = 2).killVideo
v136 = v136.audioDub(va)

return v136.Prefetch

