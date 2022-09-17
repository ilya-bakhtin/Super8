LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v171 = LSMASHVideoSource(dst_dir + "v171rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v171f.mp4")
v171 = ImageSource(file = dst_dir + "v171-png\v171-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v171 = v171.convertToY.adjustSize

#v171 = v171.extractY.convertToYV12(interlaced=false)
#v171 = v171.deScratch.extractY

v171 = v171.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v171 = v171.convertBits(8).convertToYV12(interlaced=false)

v171 = v171.deScratch.extractY
v171 = v171.removeDirt
v171 = v171.convertToYV12(interlaced=false)
v171 = v171.UnsharpMask(strength=400, radius=5, threshold=1)
v171 = v171.adjustBorders
#v171 = v171.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v171 = v171.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v171, audio_rate = 48000, channels = 2).killVideo
v171 = v171.audioDub(va)

return v171.Prefetch

