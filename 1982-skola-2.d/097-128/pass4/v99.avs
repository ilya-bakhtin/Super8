LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v99 = LSMASHVideoSource(dst_dir + "v99rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v99f.mp4")
v99 = ImageSource(file = dst_dir + "v99-png\v99-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v99 = v99.convertToY.adjustSize

#v99 = v99.extractY.convertToYV12(interlaced=false)
#v99 = v99.deScratch.extractY

v99 = v99.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v99 = v99.convertBits(8).convertToYV12(interlaced=false)

v99 = v99.deScratch.extractY
v99 = v99.removeDirt
v99 = v99.convertToYV12(interlaced=false)
v99 = v99.UnsharpMask(strength=400, radius=5, threshold=1)
v99 = v99.adjustBorders
#v99 = v99.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v99 = v99.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v99, audio_rate = 48000, channels = 2).killVideo
v99 = v99.audioDub(va)

return v99.Prefetch

