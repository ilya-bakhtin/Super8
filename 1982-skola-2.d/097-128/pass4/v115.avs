LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v115 = LSMASHVideoSource(dst_dir + "v115rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v115f.mp4")
v115 = ImageSource(file = dst_dir + "v115-png\v115-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v115 = v115.convertToY.adjustSize

#v115 = v115.extractY.convertToYV12(interlaced=false)
#v115 = v115.deScratch.extractY

v115 = v115.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v115 = v115.convertBits(8).convertToYV12(interlaced=false)

v115 = v115.deScratch.extractY
v115 = v115.removeDirt
v115 = v115.convertToYV12(interlaced=false)
v115 = v115.UnsharpMask(strength=400, radius=5, threshold=1)
v115 = v115.adjustBorders
#v115 = v115.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v115 = v115.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v115, audio_rate = 48000, channels = 2).killVideo
v115 = v115.audioDub(va)

return v115.Prefetch

