LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v142 = LSMASHVideoSource(dst_dir + "v142rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v142f.mp4")
v142 = ImageSource(file = dst_dir + "v142-png\v142-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v142 = v142.convertToY.adjustSize

#v142 = v142.extractY.convertToYV12(interlaced=false)
#v142 = v142.deScratch.extractY

v142 = v142.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v142 = v142.convertBits(8).convertToYV12(interlaced=false)

v142 = v142.deScratch.extractY
v142 = v142.removeDirt
v142 = v142.convertToYV12(interlaced=false)
v142 = v142.UnsharpMask(strength=400, radius=5, threshold=1)
v142 = v142.adjustBorders
#v142 = v142.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v142 = v142.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v142, audio_rate = 48000, channels = 2).killVideo
v142 = v142.audioDub(va)

return v142.Prefetch

