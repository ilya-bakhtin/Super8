LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v175 = LSMASHVideoSource(dst_dir + "v175rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v175f.mp4")
v175 = ImageSource(file = dst_dir + "v175-png\v175-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v175 = v175.convertToY.adjustSize

#v175 = v175.extractY.convertToYV12(interlaced=false)
#v175 = v175.deScratch.extractY

v175 = v175.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v175 = v175.convertBits(8).convertToYV12(interlaced=false)

v175 = v175.deScratch.extractY
v175 = v175.removeDirt
v175 = v175.convertToYV12(interlaced=false)
v175 = v175.UnsharpMask(strength=400, radius=5, threshold=1)
v175 = v175.adjustBorders
#v175 = v175.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v175 = v175.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v175, audio_rate = 48000, channels = 2).killVideo
v175 = v175.audioDub(va)

return v175.Prefetch

