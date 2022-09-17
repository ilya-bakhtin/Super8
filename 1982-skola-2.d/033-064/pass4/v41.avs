LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v41 = LSMASHVideoSource(dst_dir + "v41rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v41f.mp4")
v41 = ImageSource(file = dst_dir + "v41-png\v41-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v41 = v41.convertToY.adjustSize

#v41 = v41.extractY.convertToYV12(interlaced=false)
#v41 = v41.deScratch.extractY

v41 = v41.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v41 = v41.convertBits(8).convertToYV12(interlaced=false)

v41 = v41.deScratch.extractY
v41 = v41.removeDirt
v41 = v41.convertToYV12(interlaced=false)
v41 = v41.UnsharpMask(strength=400, radius=5, threshold=1)
v41 = v41.adjustBorders
#v41 = v41.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v41 = v41.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v41, audio_rate = 48000, channels = 2).killVideo
v41 = v41.audioDub(va)

return v41.Prefetch

