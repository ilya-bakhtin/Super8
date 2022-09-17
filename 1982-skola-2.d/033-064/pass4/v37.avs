LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v37 = LSMASHVideoSource(dst_dir + "v37rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v37f.mp4")
v37 = ImageSource(file = dst_dir + "v37-png\v37-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v37 = v37.convertToY.adjustSize

#v37 = v37.extractY.convertToYV12(interlaced=false)
#v37 = v37.deScratch.extractY

v37 = v37.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v37 = v37.convertBits(8).convertToYV12(interlaced=false)

v37 = v37.deScratch.extractY
v37 = v37.removeDirt
v37 = v37.convertToYV12(interlaced=false)
v37 = v37.UnsharpMask(strength=700, radius=7, threshold=1)
v37 = v37.adjustBorders
#v37 = v37.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v37 = v37.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v37, audio_rate = 48000, channels = 2).killVideo
v37 = v37.audioDub(va)

return v37.Prefetch

