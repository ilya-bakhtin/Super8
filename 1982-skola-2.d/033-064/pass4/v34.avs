LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v34 = LSMASHVideoSource(dst_dir + "v34rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v34f.mp4")
v34 = ImageSource(file = dst_dir + "v34-png\v34-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v34 = v34.convertToY.adjustSize

#v34 = v34.extractY.convertToYV12(interlaced=false)
#v34 = v34.deScratch.extractY

v34 = v34.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v34 = v34.convertBits(8).convertToYV12(interlaced=false)

v34 = v34.deScratch.extractY
v34 = v34.removeDirt
v34 = v34.convertToYV12(interlaced=false)
v34 = v34.UnsharpMask(strength=400, radius=5, threshold=1)
v34 = v34.adjustBorders
#v34 = v34.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v34 = v34.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v34, audio_rate = 48000, channels = 2).killVideo
v34 = v34.audioDub(va)

return v34.Prefetch

