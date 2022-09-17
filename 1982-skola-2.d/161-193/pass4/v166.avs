LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v166 = LSMASHVideoSource(dst_dir + "v166rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v166f.mp4")
v166 = ImageSource(file = dst_dir + "v166-png\v166-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v166 = v166.convertToY.adjustSize

#v166 = v166.extractY.convertToYV12(interlaced=false)
#v166 = v166.deScratch.extractY

v166 = v166.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v166 = v166.convertBits(8).convertToYV12(interlaced=false)

v166 = v166.deScratch.extractY
v166 = v166.removeDirt
v166 = v166.convertToYV12(interlaced=false)
v166 = v166.UnsharpMask(strength=400, radius=5, threshold=1)
v166 = v166.adjustBorders
#v166 = v166.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v166 = v166.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v166, audio_rate = 48000, channels = 2).killVideo
v166 = v166.audioDub(va)

return v166.Prefetch

