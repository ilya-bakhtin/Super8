LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v100 = LSMASHVideoSource(dst_dir + "v100rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v100f.mp4")
v100 = ImageSource(file = dst_dir + "v100-png\v100-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v100 = v100.convertToY.adjustSize

#v100 = v100.extractY.convertToYV12(interlaced=false)
#v100 = v100.deScratch.extractY

v100 = v100.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v100 = v100.convertBits(8).convertToYV12(interlaced=false)

v100 = v100.deScratch.extractY
v100 = v100.removeDirt
v100 = v100.convertToYV12(interlaced=false)
v100 = v100.UnsharpMask(strength=400, radius=5, threshold=1)
v100 = v100.adjustBorders
#v100 = v100.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v100 = v100.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v100, audio_rate = 48000, channels = 2).killVideo
v100 = v100.audioDub(va)

return v100.Prefetch

