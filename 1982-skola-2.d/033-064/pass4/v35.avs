LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v35 = LSMASHVideoSource(dst_dir + "v35rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v35f.mp4")
v35 = ImageSource(file = dst_dir + "v35-png\v35-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v35 = v35.convertToY.adjustSize

#v35 = v35.extractY.convertToYV12(interlaced=false)
#v35 = v35.deScratch.extractY

v35 = v35.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v35 = v35.convertBits(8).convertToYV12(interlaced=false)

v35 = v35.deScratch.extractY
v35 = v35.removeDirt
v35 = v35.convertToYV12(interlaced=false)
v35 = v35.UnsharpMask(strength=400, radius=5, threshold=1)
v35 = v35.adjustBorders
#v35 = v35.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v35 = v35.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v35, audio_rate = 48000, channels = 2).killVideo
v35 = v35.audioDub(va)

return v35.Prefetch

