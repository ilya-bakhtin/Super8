LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v178 = LSMASHVideoSource(dst_dir + "v178rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v178f.mp4")
v178 = ImageSource(file = dst_dir + "v178-png\v178-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v178 = v178.convertToY.adjustSize

#v178 = v178.extractY.convertToYV12(interlaced=false)
#v178 = v178.deScratch.extractY

v178 = v178.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v178 = v178.convertBits(8).convertToYV12(interlaced=false)

v178 = v178.deScratch.extractY
v178 = v178.removeDirt
v178 = v178.convertToYV12(interlaced=false)
v178 = v178.UnsharpMask(strength=400, radius=5, threshold=1)
v178 = v178.adjustBorders
#v178 = v178.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v178 = v178.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v178, audio_rate = 48000, channels = 2).killVideo
v178 = v178.audioDub(va)

return v178.Prefetch

