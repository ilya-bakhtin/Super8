LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v114 = LSMASHVideoSource(dst_dir + "v114rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v114f.mp4")
v114 = ImageSource(file = dst_dir + "v114-png\v114-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v114 = v114.convertToY.adjustSize

#v114 = v114.extractY.convertToYV12(interlaced=false)
#v114 = v114.deScratch.extractY

v114 = v114.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v114 = v114.convertBits(8).convertToYV12(interlaced=false)

v114 = v114.deScratch.extractY
v114 = v114.removeDirt
v114 = v114.convertToYV12(interlaced=false)
v114 = v114.UnsharpMask(strength=400, radius=5, threshold=1)
v114 = v114.adjustBorders
#v114 = v114.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v114 = v114.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v114, audio_rate = 48000, channels = 2).killVideo
v114 = v114.audioDub(va)

return v114.Prefetch

