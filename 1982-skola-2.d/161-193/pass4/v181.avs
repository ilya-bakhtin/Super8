LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v181 = LSMASHVideoSource(dst_dir + "v181rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v181f.mp4")
v181 = ImageSource(file = dst_dir + "v181-png\v181-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v181 = v181.convertToY.adjustSize

#v181 = v181.extractY.convertToYV12(interlaced=false)
#v181 = v181.deScratch.extractY

v181 = v181.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v181 = v181.convertBits(8).convertToYV12(interlaced=false)

v181 = v181.deScratch.extractY
v181 = v181.removeDirt
v181 = v181.convertToYV12(interlaced=false)
v181 = v181.UnsharpMask(strength=400, radius=5, threshold=1)
v181 = v181.adjustBorders
#v181 = v181.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v181 = v181.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v181, audio_rate = 48000, channels = 2).killVideo
v181 = v181.audioDub(va)

return v181.Prefetch

