LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v180 = LSMASHVideoSource(dst_dir + "v180rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v180f.mp4")
v180 = ImageSource(file = dst_dir + "v180-png\v180-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v180 = v180.convertToY.adjustSize

#v180 = v180.extractY.convertToYV12(interlaced=false)
#v180 = v180.deScratch.extractY

v180 = v180.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v180 = v180.convertBits(8).convertToYV12(interlaced=false)

v180 = v180.deScratch.extractY
v180 = v180.removeDirt
v180 = v180.convertToYV12(interlaced=false)
v180 = v180.UnsharpMask(strength=400, radius=5, threshold=1)
v180 = v180.adjustBorders
#v180 = v180.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v180 = v180.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v180, audio_rate = 48000, channels = 2).killVideo
v180 = v180.audioDub(va)

return v180.Prefetch

