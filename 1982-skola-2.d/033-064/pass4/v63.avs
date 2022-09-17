LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v63 = LSMASHVideoSource(dst_dir + "v63rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v63f.mp4")
v63 = ImageSource(file = dst_dir + "v63-png\v63-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v63 = v63.convertToY.adjustSize

#v63 = v63.extractY.convertToYV12(interlaced=false)
#v63 = v63.deScratch.extractY

v63 = v63.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v63 = v63.convertBits(8).convertToYV12(interlaced=false)

v63 = v63.deScratch.extractY
v63 = v63.removeDirt
v63 = v63.convertToYV12(interlaced=false)
v63 = v63.UnsharpMask(strength=400, radius=5, threshold=1)
v63 = v63.adjustBorders
#v63 = v63.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v63 = v63.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v63, audio_rate = 48000, channels = 2).killVideo
v63 = v63.audioDub(va)

return v63.Prefetch

