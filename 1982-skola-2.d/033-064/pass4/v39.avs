LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v39 = LSMASHVideoSource(dst_dir + "v39rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v39f.mp4")
v39 = ImageSource(file = dst_dir + "v39-png\v39-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v39 = v39.convertToY.adjustSize

#v39 = v39.extractY.convertToYV12(interlaced=false)
#v39 = v39.deScratch.extractY

v39 = v39.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v39 = v39.convertBits(8).convertToYV12(interlaced=false)

v39 = v39.deScratch.extractY
v39 = v39.removeDirt
v39 = v39.convertToYV12(interlaced=false)
v39 = v39.UnsharpMask(strength=500, radius=7, threshold=1)
v39 = v39.adjustBorders
#v39 = v39.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v39 = v39.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v39, audio_rate = 48000, channels = 2).killVideo
v39 = v39.audioDub(va)

return v39.Prefetch

