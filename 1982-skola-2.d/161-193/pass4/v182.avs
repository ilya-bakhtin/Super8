LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v182 = LSMASHVideoSource(dst_dir + "v182rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v182f.mp4")
v182 = ImageSource(file = dst_dir + "v182-png\v182-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v182 = v182.convertToY.adjustSize

#v182 = v182.extractY.convertToYV12(interlaced=false)
#v182 = v182.deScratch.extractY

v182 = v182.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v182 = v182.convertBits(8).convertToYV12(interlaced=false)

v182 = v182.deScratch.extractY
v182 = v182.removeDirt
v182 = v182.convertToYV12(interlaced=false)
v182 = v182.UnsharpMask(strength=400, radius=5, threshold=1)
v182 = v182.adjustBorders
#v182 = v182.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v182 = v182.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v182, audio_rate = 48000, channels = 2).killVideo
v182 = v182.audioDub(va)

return v182.Prefetch

