LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v168 = LSMASHVideoSource(dst_dir + "v168rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v168f.mp4")
v168 = ImageSource(file = dst_dir + "v168-png\v168-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v168 = v168.convertToY.adjustSize

#v168 = v168.extractY.convertToYV12(interlaced=false)
#v168 = v168.deScratch.extractY

v168 = v168.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v168 = v168.convertBits(8).convertToYV12(interlaced=false)

v168 = v168.deScratch.extractY
v168 = v168.removeDirt
v168 = v168.convertToYV12(interlaced=false)
v168 = v168.UnsharpMask(strength=400, radius=5, threshold=1)
v168 = v168.adjustBorders
#v168 = v168.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v168 = v168.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v168, audio_rate = 48000, channels = 2).killVideo
v168 = v168.audioDub(va)

return v168.Prefetch

