LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v112 = LSMASHVideoSource(dst_dir + "v112rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v112f.mp4")
v112 = ImageSource(file = dst_dir + "v112-png\v112-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v112 = v112.convertToY.adjustSize

#v112 = v112.extractY.convertToYV12(interlaced=false)
#v112 = v112.deScratch.extractY

v112 = v112.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v112 = v112.convertBits(8).convertToYV12(interlaced=false)

v112 = v112.deScratch.extractY
v112 = v112.removeDirt
v112 = v112.convertToYV12(interlaced=false)
v112 = v112.UnsharpMask(strength=400, radius=5, threshold=1)
v112 = v112.adjustBorders
#v112 = v112.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v112 = v112.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v112, audio_rate = 48000, channels = 2).killVideo
v112 = v112.audioDub(va)

return v112.Prefetch

