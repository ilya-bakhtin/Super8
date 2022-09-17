LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v177 = LSMASHVideoSource(dst_dir + "v177rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v177f.mp4")
v177 = ImageSource(file = dst_dir + "v177-png\v177-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v177 = v177.convertToY.adjustSize

#v177 = v177.extractY.convertToYV12(interlaced=false)
#v177 = v177.deScratch.extractY

v177 = v177.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v177 = v177.convertBits(8).convertToYV12(interlaced=false)

v177 = v177.deScratch.extractY
v177 = v177.removeDirt
v177 = v177.convertToYV12(interlaced=false)
v177 = v177.UnsharpMask(strength=400, radius=5, threshold=1)
v177 = v177.adjustBorders
#v177 = v177.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v177 = v177.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v177, audio_rate = 48000, channels = 2).killVideo
v177 = v177.audioDub(va)

return v177.Prefetch

