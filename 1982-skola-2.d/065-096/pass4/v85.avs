LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v85 = LSMASHVideoSource(dst_dir + "v85rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v85f.mp4")
v85 = ImageSource(file = dst_dir + "v85-png\v85-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v85 = v85.convertToY.adjustSize

#v85 = v85.extractY.convertToYV12(interlaced=false)
#v85 = v85.deScratch.extractY

v85 = v85.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v85 = v85.convertBits(8).convertToYV12(interlaced=false)

v85 = v85.deScratch.extractY
v85 = v85.removeDirt
v85 = v85.convertToYV12(interlaced=false)
v85 = v85.UnsharpMask(strength=400, radius=5, threshold=1)
v85 = v85.adjustBorders
#v85 = v85.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v85 = v85.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v85, audio_rate = 48000, channels = 2).killVideo
v85 = v85.audioDub(va)

return v85.Prefetch

