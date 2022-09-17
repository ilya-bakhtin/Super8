LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v110 = LSMASHVideoSource(dst_dir + "v110rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v110f.mp4")
v110 = ImageSource(file = dst_dir + "v110-png\v110-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v110 = v110.convertToY.adjustSize

#v110 = v110.extractY.convertToYV12(interlaced=false)
#v110 = v110.deScratch.extractY

v110 = v110.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v110 = v110.convertBits(8).convertToYV12(interlaced=false)

v110 = v110.deScratch.extractY
v110 = v110.removeDirt
v110 = v110.convertToYV12(interlaced=false)
v110 = v110.UnsharpMask(strength=400, radius=5, threshold=1)
v110 = v110.adjustBorders
#v110 = v110.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v110 = v110.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v110, audio_rate = 48000, channels = 2).killVideo
v110 = v110.audioDub(va)

return v110.Prefetch

