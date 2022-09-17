LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v131 = LSMASHVideoSource(dst_dir + "v131rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v131f.mp4")
v131 = ImageSource(file = dst_dir + "v131-png\v131-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v131 = v131.convertToY.adjustSize

#v131 = v131.extractY.convertToYV12(interlaced=false)
#v131 = v131.deScratch.extractY

v131 = v131.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v131 = v131.convertBits(8).convertToYV12(interlaced=false)

v131 = v131.deScratch.extractY
v131 = v131.removeDirt
v131 = v131.convertToYV12(interlaced=false)
v131 = v131.UnsharpMask(strength=400, radius=5, threshold=1)
v131 = v131.adjustBorders
#v131 = v131.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v131 = v131.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v131, audio_rate = 48000, channels = 2).killVideo
v131 = v131.audioDub(va)

return v131.Prefetch

