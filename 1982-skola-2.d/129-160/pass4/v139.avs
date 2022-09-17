LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v139 = LSMASHVideoSource(dst_dir + "v139rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v139f.mp4")
v139 = ImageSource(file = dst_dir + "v139-png\v139-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v139 = v139.convertToY.adjustSize

#v139 = v139.extractY.convertToYV12(interlaced=false)
#v139 = v139.deScratch.extractY

v139 = v139.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v139 = v139.convertBits(8).convertToYV12(interlaced=false)

v139 = v139.deScratch.extractY
v139 = v139.removeDirt
v139 = v139.convertToYV12(interlaced=false)
v139 = v139.UnsharpMask(strength=400, radius=5, threshold=1)
v139 = v139.adjustBorders
#v139 = v139.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v139 = v139.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v139, audio_rate = 48000, channels = 2).killVideo
v139 = v139.audioDub(va)

return v139.Prefetch

