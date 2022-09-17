LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v69 = LSMASHVideoSource(dst_dir + "v69rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v69f.mp4")
v69 = ImageSource(file = dst_dir + "v69-png\v69-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v69 = v69.convertToY.adjustSize

#v69 = v69.extractY.convertToYV12(interlaced=false)
#v69 = v69.deScratch.extractY

v69 = v69.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v69 = v69.convertBits(8).convertToYV12(interlaced=false)

v69 = v69.deScratch.extractY
v69 = v69.removeDirt
v69 = v69.convertToYV12(interlaced=false)
v69 = v69.UnsharpMask(strength=400, radius=5, threshold=1)
v69 = v69.adjustBorders
#v69 = v69.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v69 = v69.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v69, audio_rate = 48000, channels = 2).killVideo
v69 = v69.audioDub(va)

return v69.Prefetch

