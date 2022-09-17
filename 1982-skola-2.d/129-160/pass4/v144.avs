LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v144 = LSMASHVideoSource(dst_dir + "v144rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v144f.mp4")
v144 = ImageSource(file = dst_dir + "v144-png\v144-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v144 = v144.convertToY.adjustSize

#v144 = v144.extractY.convertToYV12(interlaced=false)
#v144 = v144.deScratch.extractY

v144 = v144.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v144 = v144.convertBits(8).convertToYV12(interlaced=false)

v144 = v144.deScratch.extractY
v144 = v144.removeDirt
v144 = v144.convertToYV12(interlaced=false)
v144 = v144.UnsharpMask(strength=400, radius=5, threshold=1)
v144 = v144.adjustBorders
#v144 = v144.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v144 = v144.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v144, audio_rate = 48000, channels = 2).killVideo
v144 = v144.audioDub(va)

return v144.Prefetch

