LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v160 = LSMASHVideoSource(dst_dir + "v160rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v160f.mp4")
v160 = ImageSource(file = dst_dir + "v160-png\v160-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v160 = v160.convertToY.adjustSize

#v160 = v160.extractY.convertToYV12(interlaced=false)
#v160 = v160.deScratch.extractY

v160 = v160.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v160 = v160.convertBits(8).convertToYV12(interlaced=false)

v160 = v160.deScratch.extractY
v160 = v160.removeDirt
v160 = v160.convertToYV12(interlaced=false)
v160 = v160.UnsharpMask(strength=400, radius=5, threshold=1)
v160 = v160.adjustBorders
#v160 = v160.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v160 = v160.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v160, audio_rate = 48000, channels = 2).killVideo
v160 = v160.audioDub(va)

return v160.Prefetch

