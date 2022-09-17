LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v158 = LSMASHVideoSource(dst_dir + "v158rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v158f.mp4")
v158 = ImageSource(file = dst_dir + "v158-png\v158-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v158 = v158.convertToY.adjustSize

#v158 = v158.extractY.convertToYV12(interlaced=false)
#v158 = v158.deScratch.extractY

v158 = v158.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v158 = v158.convertBits(8).convertToYV12(interlaced=false)

v158 = v158.deScratch.extractY
v158 = v158.removeDirt
v158 = v158.convertToYV12(interlaced=false)
v158 = v158.UnsharpMask(strength=400, radius=5, threshold=1)
v158 = v158.adjustBorders
#v158 = v158.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v158 = v158.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v158, audio_rate = 48000, channels = 2).killVideo
v158 = v158.audioDub(va)

return v158.Prefetch

