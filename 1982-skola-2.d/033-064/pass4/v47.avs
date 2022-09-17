LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v47 = LSMASHVideoSource(dst_dir + "v47rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v47f.mp4")
v47 = ImageSource(file = dst_dir + "v47-png\v47-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v47 = v47.convertToY.adjustSize

#v47 = v47.extractY.convertToYV12(interlaced=false)
#v47 = v47.deScratch.extractY

v47 = v47.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v47 = v47.convertBits(8).convertToYV12(interlaced=false)

v47 = v47.deScratch.extractY
v47 = v47.removeDirt
v47 = v47.convertToYV12(interlaced=false)
v47 = v47.UnsharpMask(strength=400, radius=5, threshold=1)
v47 = v47.adjustBorders
#v47 = v47.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v47 = v47.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v47, audio_rate = 48000, channels = 2).killVideo
v47 = v47.audioDub(va)

return v47.Prefetch

