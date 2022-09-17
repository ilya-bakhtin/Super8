LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v153 = LSMASHVideoSource(dst_dir + "v153rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v153f.mp4")
v153 = ImageSource(file = dst_dir + "v153-png\v153-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v153 = v153.convertToY.adjustSize

#v153 = v153.extractY.convertToYV12(interlaced=false)
#v153 = v153.deScratch.extractY

v153 = v153.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v153 = v153.convertBits(8).convertToYV12(interlaced=false)

v153 = v153.deScratch.extractY
v153 = v153.removeDirt
v153 = v153.convertToYV12(interlaced=false)
v153 = v153.UnsharpMask(strength=400, radius=5, threshold=1)
v153 = v153.adjustBorders
#v153 = v153.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v153 = v153.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v153, audio_rate = 48000, channels = 2).killVideo
v153 = v153.audioDub(va)

return v153.Prefetch

