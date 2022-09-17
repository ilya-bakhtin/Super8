LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v161 = LSMASHVideoSource(dst_dir + "v161rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v161f.mp4")
v161 = ImageSource(file = dst_dir + "v161-png\v161-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v161 = v161.convertToY.adjustSize

#v161 = v161.extractY.convertToYV12(interlaced=false)
#v161 = v161.deScratch.extractY

v161 = v161.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v161 = v161.convertBits(8).convertToYV12(interlaced=false)

v161 = v161.deScratch.extractY
v161 = v161.removeDirt
v161 = v161.convertToYV12(interlaced=false)
v161 = v161.UnsharpMask(strength=400, radius=5, threshold=1)
v161 = v161.adjustBorders
#v161 = v161.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v161 = v161.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v161, audio_rate = 48000, channels = 2).killVideo
v161 = v161.audioDub(va)

return v161.Prefetch

