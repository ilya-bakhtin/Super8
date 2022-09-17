LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v124 = LSMASHVideoSource(dst_dir + "v124rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v124f.mp4")
v124 = ImageSource(file = dst_dir + "v124-png\v124-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v124 = v124.convertToY.adjustSize

#v124 = v124.extractY.convertToYV12(interlaced=false)
#v124 = v124.deScratch.extractY

v124 = v124.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v124 = v124.convertBits(8).convertToYV12(interlaced=false)

v124 = v124.deScratch.extractY
v124 = v124.removeDirt
v124 = v124.convertToYV12(interlaced=false)
v124 = v124.UnsharpMask(strength=400, radius=5, threshold=1)
v124 = v124.adjustBorders
#v124 = v124.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v124 = v124.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v124, audio_rate = 48000, channels = 2).killVideo
v124 = v124.audioDub(va)

return v124.Prefetch

