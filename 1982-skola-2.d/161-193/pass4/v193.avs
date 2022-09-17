LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v193 = LSMASHVideoSource(dst_dir + "v193rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v193f.mp4")
v193 = ImageSource(file = dst_dir + "v193-png\v193-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v193 = v193.convertToY.adjustSize

#v193 = v193.extractY.convertToYV12(interlaced=false)
#v193 = v193.deScratch.extractY

v193 = v193.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v193 = v193.convertBits(8).convertToYV12(interlaced=false)

v193 = v193.deScratch.extractY
v193 = v193.removeDirt
v193 = v193.convertToYV12(interlaced=false)
v193 = v193.UnsharpMask(strength=400, radius=5, threshold=1)
v193 = v193.adjustBorders
#v193 = v193.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v193 = v193.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v193, audio_rate = 48000, channels = 2).killVideo
v193 = v193.audioDub(va)

return v193.Prefetch

