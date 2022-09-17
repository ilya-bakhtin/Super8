LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v140 = LSMASHVideoSource(dst_dir + "v140rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v140f.mp4")
v140 = ImageSource(file = dst_dir + "v140-png\v140-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v140 = v140.convertToY.adjustSize

#v140 = v140.extractY.convertToYV12(interlaced=false)
#v140 = v140.deScratch.extractY

v140 = v140.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v140 = v140.convertBits(8).convertToYV12(interlaced=false)

v140 = v140.deScratch.extractY
v140 = v140.removeDirt
v140 = v140.convertToYV12(interlaced=false)
v140 = v140.UnsharpMask(strength=400, radius=5, threshold=1)
v140 = v140.adjustBorders
#v140 = v140.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v140 = v140.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v140, audio_rate = 48000, channels = 2).killVideo
v140 = v140.audioDub(va)

return v140.Prefetch

