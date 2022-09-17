LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v154 = LSMASHVideoSource(dst_dir + "v154rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v154f.mp4")
v154 = ImageSource(file = dst_dir + "v154-png\v154-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v154 = v154.convertToY.adjustSize

#v154 = v154.extractY.convertToYV12(interlaced=false)
#v154 = v154.deScratch.extractY

v154 = v154.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v154 = v154.convertBits(8).convertToYV12(interlaced=false)

v154 = v154.deScratch.extractY
v154 = v154.removeDirt
v154 = v154.convertToYV12(interlaced=false)
v154 = v154.UnsharpMask(strength=400, radius=5, threshold=1)
v154 = v154.adjustBorders
#v154 = v154.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v154 = v154.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v154, audio_rate = 48000, channels = 2).killVideo
v154 = v154.audioDub(va)

return v154.Prefetch

