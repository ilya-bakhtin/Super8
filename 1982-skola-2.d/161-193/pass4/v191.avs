LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v191 = LSMASHVideoSource(dst_dir + "v191rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v191f.mp4")
v191 = ImageSource(file = dst_dir + "v191-png\v191-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v191 = v191.convertToY.adjustSize

#v191 = v191.extractY.convertToYV12(interlaced=false)
#v191 = v191.deScratch.extractY

v191 = v191.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v191 = v191.convertBits(8).convertToYV12(interlaced=false)

v191 = v191.deScratch.extractY
v191 = v191.removeDirt
v191 = v191.convertToYV12(interlaced=false)
v191 = v191.UnsharpMask(strength=400, radius=5, threshold=1)
v191 = v191.adjustBorders
#v191 = v191.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v191 = v191.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v191, audio_rate = 48000, channels = 2).killVideo
v191 = v191.audioDub(va)

return v191.Prefetch

