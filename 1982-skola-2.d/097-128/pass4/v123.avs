LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v123 = LSMASHVideoSource(dst_dir + "v123rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v123f.mp4")
v123 = ImageSource(file = dst_dir + "v123-png\v123-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v123 = v123.convertToY.adjustSize

#v123 = v123.extractY.convertToYV12(interlaced=false)
#v123 = v123.deScratch.extractY

v123 = v123.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v123 = v123.convertBits(8).convertToYV12(interlaced=false)

v123 = v123.deScratch.extractY
v123 = v123.removeDirt
v123 = v123.convertToYV12(interlaced=false)
v123 = v123.UnsharpMask(strength=400, radius=5, threshold=1)
v123 = v123.adjustBorders
#v123 = v123.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v123 = v123.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v123, audio_rate = 48000, channels = 2).killVideo
v123 = v123.audioDub(va)

return v123.Prefetch

