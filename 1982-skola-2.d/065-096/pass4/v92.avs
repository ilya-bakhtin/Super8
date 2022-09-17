LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v92 = LSMASHVideoSource(dst_dir + "v92rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v92f.mp4")
v92 = ImageSource(file = dst_dir + "v92-png\v92-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v92 = v92.convertToY.adjustSize

#v92 = v92.extractY.convertToYV12(interlaced=false)
#v92 = v92.deScratch.extractY

v92 = v92.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v92 = v92.convertBits(8).convertToYV12(interlaced=false)

v92 = v92.deScratch.extractY
v92 = v92.removeDirt
v92 = v92.convertToYV12(interlaced=false)
v92 = v92.UnsharpMask(strength=400, radius=5, threshold=1)
v92 = v92.adjustBorders
#v92 = v92.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v92 = v92.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v92, audio_rate = 48000, channels = 2).killVideo
v92 = v92.audioDub(va)

return v92.Prefetch

