LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v170 = LSMASHVideoSource(dst_dir + "v170rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v170f.mp4")
v170 = ImageSource(file = dst_dir + "v170-png\v170-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v170 = v170.convertToY.adjustSize

#v170 = v170.extractY.convertToYV12(interlaced=false)
#v170 = v170.deScratch.extractY

v170 = v170.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v170 = v170.convertBits(8).convertToYV12(interlaced=false)

v170 = v170.deScratch.extractY
v170 = v170.removeDirt
v170 = v170.convertToYV12(interlaced=false)
v170 = v170.UnsharpMask(strength=400, radius=5, threshold=1)
v170 = v170.adjustBorders
#v170 = v170.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v170 = v170.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v170, audio_rate = 48000, channels = 2).killVideo
v170 = v170.audioDub(va)

return v170.Prefetch

