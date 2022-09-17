LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v77 = LSMASHVideoSource(dst_dir + "v77rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v77f.mp4")
v77 = ImageSource(file = dst_dir + "v77-png\v77-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v77 = v77.convertToY.adjustSize

#v77 = v77.extractY.convertToYV12(interlaced=false)
#v77 = v77.deScratch.extractY

v77 = v77.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v77 = v77.convertBits(8).convertToYV12(interlaced=false)

v77 = v77.deScratch.extractY
v77 = v77.removeDirt
v77 = v77.convertToYV12(interlaced=false)
v77 = v77.UnsharpMask(strength=400, radius=5, threshold=1)
v77 = v77.adjustBorders
#v77 = v77.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v77 = v77.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v77, audio_rate = 48000, channels = 2).killVideo
v77 = v77.audioDub(va)

return v77.Prefetch

