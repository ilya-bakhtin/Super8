LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v162 = LSMASHVideoSource(dst_dir + "v162rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v162f.mp4")
v162 = ImageSource(file = dst_dir + "v162-png\v162-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v162 = v162.convertToY.adjustSize

#v162 = v162.extractY.convertToYV12(interlaced=false)
#v162 = v162.deScratch.extractY

v162 = v162.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v162 = v162.convertBits(8).convertToYV12(interlaced=false)

v162 = v162.deScratch.extractY
v162 = v162.removeDirt
v162 = v162.convertToYV12(interlaced=false)
v162 = v162.UnsharpMask(strength=400, radius=5, threshold=1)
v162 = v162.adjustBorders
#v162 = v162.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v162 = v162.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v162, audio_rate = 48000, channels = 2).killVideo
v162 = v162.audioDub(va)

return v162.Prefetch

