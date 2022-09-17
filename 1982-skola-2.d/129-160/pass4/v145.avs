LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v145 = LSMASHVideoSource(dst_dir + "v145rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v145f.mp4")
v145 = ImageSource(file = dst_dir + "v145-png\v145-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v145 = v145.convertToY.adjustSize

#v145 = v145.extractY.convertToYV12(interlaced=false)
#v145 = v145.deScratch.extractY

v145 = v145.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v145 = v145.convertBits(8).convertToYV12(interlaced=false)

v145 = v145.deScratch.extractY
v145 = v145.removeDirt
v145 = v145.convertToYV12(interlaced=false)
v145 = v145.UnsharpMask(strength=400, radius=5, threshold=1)
v145 = v145.adjustBorders
#v145 = v145.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v145 = v145.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v145, audio_rate = 48000, channels = 2).killVideo
v145 = v145.audioDub(va)

return v145.Prefetch

