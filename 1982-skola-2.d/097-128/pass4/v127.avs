LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v127 = LSMASHVideoSource(dst_dir + "v127rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v127f.mp4")
v127 = ImageSource(file = dst_dir + "v127-png\v127-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v127 = v127.convertToY.adjustSize

#v127 = v127.extractY.convertToYV12(interlaced=false)
#v127 = v127.deScratch.extractY

v127 = v127.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v127 = v127.convertBits(8).convertToYV12(interlaced=false)

v127 = v127.deScratch.extractY
v127 = v127.removeDirt
v127 = v127.convertToYV12(interlaced=false)
v127 = v127.UnsharpMask(strength=400, radius=5, threshold=1)
v127 = v127.adjustBorders
#v127 = v127.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v127 = v127.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v127, audio_rate = 48000, channels = 2).killVideo
v127 = v127.audioDub(va)

return v127.Prefetch

