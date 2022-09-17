LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v67 = LSMASHVideoSource(dst_dir + "v67rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v67f.mp4")
v67 = ImageSource(file = dst_dir + "v67-png\v67-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v67 = v67.convertToY.adjustSize

#v67 = v67.extractY.convertToYV12(interlaced=false)
#v67 = v67.deScratch.extractY

v67 = v67.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v67 = v67.convertBits(8).convertToYV12(interlaced=false)

v67 = v67.deScratch.extractY
v67 = v67.removeDirt
v67 = v67.convertToYV12(interlaced=false)
v67 = v67.UnsharpMask(strength=400, radius=5, threshold=1)
v67 = v67.adjustBorders
#v67 = v67.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v67 = v67.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v67, audio_rate = 48000, channels = 2).killVideo
v67 = v67.audioDub(va)

return v67.Prefetch

