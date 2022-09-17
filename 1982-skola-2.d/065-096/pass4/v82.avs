LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v82 = LSMASHVideoSource(dst_dir + "v82rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v82f.mp4")
v82 = ImageSource(file = dst_dir + "v82-png\v82-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v82 = v82.convertToY.adjustSize

#v82 = v82.extractY.convertToYV12(interlaced=false)
#v82 = v82.deScratch.extractY

v82 = v82.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v82 = v82.convertBits(8).convertToYV12(interlaced=false)

v82 = v82.deScratch.extractY
v82 = v82.removeDirt
v82 = v82.convertToYV12(interlaced=false)
v82 = v82.UnsharpMask(strength=400, radius=5, threshold=1)
v82 = v82.adjustBorders
#v82 = v82.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v82 = v82.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v82, audio_rate = 48000, channels = 2).killVideo
v82 = v82.audioDub(va)

return v82.Prefetch

