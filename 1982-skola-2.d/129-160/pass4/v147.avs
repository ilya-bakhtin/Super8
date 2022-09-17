LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v147 = LSMASHVideoSource(dst_dir + "v147rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v147f.mp4")
v147 = ImageSource(file = dst_dir + "v147-png\v147-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v147 = v147.convertToY.adjustSize

#v147 = v147.extractY.convertToYV12(interlaced=false)
#v147 = v147.deScratch.extractY

v147 = v147.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v147 = v147.convertBits(8).convertToYV12(interlaced=false)

v147 = v147.deScratch.extractY
v147 = v147.removeDirt
v147 = v147.convertToYV12(interlaced=false)
v147 = v147.UnsharpMask(strength=400, radius=5, threshold=1)
v147 = v147.adjustBorders
#v147 = v147.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v147 = v147.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v147, audio_rate = 48000, channels = 2).killVideo
v147 = v147.audioDub(va)

return v147.Prefetch

