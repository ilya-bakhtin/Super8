LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v70 = LSMASHVideoSource(dst_dir + "v70rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v70f.mp4")
v70 = ImageSource(file = dst_dir + "v70-png\v70-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v70 = v70.convertToY.adjustSize

#v70 = v70.extractY.convertToYV12(interlaced=false)
#v70 = v70.deScratch.extractY

v70 = v70.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v70 = v70.convertBits(8).convertToYV12(interlaced=false)

v70 = v70.deScratch.extractY
v70 = v70.removeDirt
v70 = v70.convertToYV12(interlaced=false)
v70 = v70.UnsharpMask(strength=400, radius=5, threshold=1)
v70 = v70.adjustBorders
#v70 = v70.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v70 = v70.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v70, audio_rate = 48000, channels = 2).killVideo
v70 = v70.audioDub(va)

return v70.Prefetch

